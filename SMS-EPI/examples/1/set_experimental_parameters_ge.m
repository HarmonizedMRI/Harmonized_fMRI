% This script is for GE data

%% Edit this section

scanner = 'GE';  % 'GE' or 'Siemens' (for now!)

% odd/even k-space delay (samples) to avoid phase wrap in fit
kspace_delay = -1.5;  

% echo readout gradient waveform file
readout_trajectory_file = 'readout_Jan2024.mod';

% data file names
datafile_ghostcal = '/export/jfnielse/tmp/4Yongli/20240227jondev_14114/scanarchive/Series4/ScanArchive_UM750MR_20240227_140830924.h5';
datafile_mb1 = '/export/jfnielse/tmp/4Yongli/20240227jondev_14114/scanarchive/Series5/ScanArchive_UM750MR_20240227_140844718.h5';
datafile_rest = '/export/jfnielse/tmp/4Yongli/20240227jondev_14114/scanarchive/Series6/ScanArchive_UM750MR_20240227_140930198.h5';  % beta on
datafile_rest = '/export/jfnielse/tmp/4Yongli/20240227jondev_14114/scanarchive/Series7/ScanArchive_UM750MR_20240227_141621177.h5';  % beta off

datafile_b0 = '/mnt/storage/rexfung/rex_phantom_0228/Exam14123/series1_3dgre_smaps/smaps_data.h5';
datafile_b0 = '/mnt/storage/jfnielse/HarmonizedMRI/fMRI/jfn24har00001_13995/Exam13995/Series5/ScanArchive_UM750MR_20240207_164001837.h5';
b0.deltaTE = 1000/440*1e-3;   % sec
b0.N = [100 100 100];         % matrix size
b0.fov = [24 24 24]*1e-2;     % m
b0.nzDummy = 1;               % dummy z loops (for setting receive gain on GE)

set_common_parameters;   % in ../recon/

