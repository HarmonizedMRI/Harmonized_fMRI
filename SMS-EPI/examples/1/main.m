
addpath ../../recon/

% Get code from Github and local folders
get_code_and_set_paths;

% set file names and path
set_experimental_parameters_ge;

% load ghost correction parameters
load a

% load 2d calibration data for slice GRAPPA
load dcal

% reconstruct
fn = 'rest.h5';   % custom data file format for raw data storage
nFrames = 10;  %  number of frames to reconstruct (out of 392)
recon_timeseries;

return

% The following code generates the files 'a.mat' and 'dcal.mat',
% and write the raw data to a custom .h5 file format

% EPI ghost calibration. Saves linear ghost correction parameters in a.mat.
% If you observe phase wraps in plots, change 'del' in set_experimental_params.m.
% This will be automated in a future release.
D = readraw(datafile_ghostcal, scanner);
hmriutils.epi.io.draw2hdf(D, etl, np, 'ghostcal.h5');
get_ghost_calibration_data;  
save a a

% Get slice-GRAPPA calibration data (dcal).
% Load data from ScanArchive file
D = readraw(datafile_mb1, scanner);
hmriutils.epi.io.draw2hdf(D, etl, np*mb, 'mb1.h5');
get_acs_data;
save('dcal.mat', 'dcal', '-v7.3');

% Load the resting-state run
D = readraw(datafile_rest, scanner);
fn = 'rest.h5';   % 'fn' is used by recon_timeseries.m as well
hmriutils.epi.io.draw2hdf(D, etl, np, fn, 'maxFramesPerFile', 50);

