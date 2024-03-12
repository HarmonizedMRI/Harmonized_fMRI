% This script is for GE data

scanner = 'GE';  % 'GE' or 'Siemens' (for now!)

% odd/even k-space delay (samples) to avoid phase wrap in fit
kspace_delay = -1.5;  

% readout gradient waveform file (for one echo in EPI train)
readout_trajectory_file = 'readout_Jan2024.mod';

% ScanArchive data file directory
datdir = '/mnt/storage/jfnielse/HarmonizedMRI/fMRI/examples/1/';

% receive gain calibration and odd/even ghost correction
datafile_ghostcal = [datdir 'ScanArchive_UM750MR_20240227_140830924.h5'];

% 2d multislice reference scan for slice GRAPPA recon ('ACS' data)
datafile_mb1 = [datdir 'ScanArchive_UM750MR_20240227_140844718.h5'];

% 5-min resting-state run
datafile_rest = [datdir 'ScanArchive_UM750MR_20240227_141621177.h5'];

set_common_parameters;   % in ../../recon/

