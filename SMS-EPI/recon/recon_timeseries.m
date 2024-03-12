% recon mb=6 SMS data with slice-GRAPPA
% 
% In addition to the parameters defined in set_experimental_params.m,
% the following variables must be present in the MATLAB workspace:
%    a           odd/even echo calibration parameters (constant and linear offset)
%    dcal        individual slice k-space, for slice GRAPPA calibration

nFramesDiscard = 0;

% CAIPI sampling mask
smask = hmriutils.epi.getsamplingmask([1 3 5 1 3 5], nx, etl, mb);
%smask = flipdim(smask, 2);  % for testing negative y (PE) gradient on Siemens

% Initialize slice GRAPPA weights
for p = 1:np
    w{p} = [];
end

% slice order for the np partitions
Z_start = hmriutils.epi.getsliceordering(np);

% loop over frames and reconstruct
Irss = zeros(nx, ny, nz, nFrames);
for ifr = (nFramesDiscard+1):nFrames
    % load raw data for this frame, interpolate to Cartesian grid, 
    % and apply odd/even phase correction
    draw = hmriutils.epi.io.readframe(fn, ifr);
    dfr = hmriutils.epi.rampsampepi2cart(draw, kxo, kxe, nx, fov(1)*100, 'nufft'); 
    dfr = hmriutils.epi.epiphasecorrect(dfr, a);    %  [nx etl np nc]

    % loop over partitions (shots, or SMS slice groups)
    for p = 1:length(Z_start) 
        fprintf('Reconstructing partition (slice group) %d of %d\n', p, length(Z_start));

        % slices to recon
        Z = Z_start(p):np:nz;   

        % SMS data for one shot/partition
        ysms = squeeze(dfr(:,:,p,:));   % [nx etl nc]

        % calibration data (acquired without z blips)
        d_ex = dcal(:,:,Z,:);
        ncalx = 48; ncaly = 48; % setting optimal cal region size is an unsolved problem
        Rx = nx/2-ncalx/2:nx/2+ncalx/2-1;
        Ry = ny/2-ncaly/2:ny/2+ncaly/2-1;
        Ry = Ry - (ny-etl);
        ycal = 0*d_ex;
        ycal(Rx, Ry, :, :) = d_ex(Rx, Ry, :, :);

        % slice GRAPPA recon
        if isempty(w{p})
            K = [5 5];
            [y, w{p}] = hmriutils.epi.slg.recon(ysms, ycal, Z, nz, smask, K);
        else
            y = hmriutils.epi.slg.recon(ysms, ycal, Z, nz, smask, K, 'w', w{p});
        end

        % partial Fourier recon
        Irss(:,:,Z,ifr) = hmriutils.epi.slg.recon_pfky(y, ny, 'homodyne');

        % display
        msk = Irss(:,:,:,ifr)>0.0*max(Irss(:));
        if strcmp(scanner, 'GE')
            im(flipdim(Irss(:,:,:,ifr).*msk,2)); %, 10*abs(Irss(:,:,:,ifr)-Icalrss).*msk));
        else
            im(Irss(:,:,:,ifr).*msk); %, 10*abs(Irss(:,:,:,ifr)-Icalrss).*msk));
        end
        title(sprintf('frame %d', ifr)); pause(0.25);

        % compare with reference image
        %im(cat(1, Icalrss, Irss(:,:,:,ifr)).*msk); %, 10*abs(Irss(:,:,:,ifr)-Icalrss).*msk));
        %title('left: truth; middle: reconstructed; right: 10xdiff'); pause(1);
    end
end

% save to .mat and nifti files in current directory
%save([output_dir session_name '/' fn '.mat'], 'Irss', '-v7.3')
if strcmp(scanner, 'Siemens')
    Irss = flipdim(Irss,2);
end
save([fn '.mat'], 'Irss', '-v7.3')
niftiwrite(Irss, [fn '.nii']);
