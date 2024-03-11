
addpath ../../recon/

% Get code from Github and local folders
get_code_and_set_paths;

% set file names and path
set_experimental_parameters_ge;

% remove existing local .h5 and .mat files
% rm ghostcal*.h5 mb1*.h5 rest*.h5 task*.h5 *.mat

% EPI ghost calibration. Saves linear ghost correction parameters in a.mat
% If you observe phase wraps in plots, change 'del' in set_experimental_params.m
D = readraw(datafile_ghostcal, scanner);
hmriutils.epi.io.draw2hdf(D, etl, np, 'ghostcal.h5');
get_ghost_calibration_data;  

% Get slice-GRAPPA calibration data (dcal)
D = readraw(datafile_mb1, scanner);
hmriutils.epi.io.draw2hdf(D, etl, np*mb, 'mb1.h5');
get_acs_data;

% Load and reconstruct fMRI resting run.
D = readraw(datafile_rest, scanner);
fn = 'rest.h5';   % 'fn' is used by recon_timeseries.m as well
hmriutils.epi.io.draw2hdf(D, etl, np, fn, 'maxFramesPerFile', 50);
nFrames = 10;  %  number of frames to reconstruct (out of 392)
recon_timeseries;

