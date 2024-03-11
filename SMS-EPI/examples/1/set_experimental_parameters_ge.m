% This script is for GE data

scanner = 'GE';  % 'GE' or 'Siemens' (for now!)

% odd/even k-space delay (samples) to avoid phase wrap in fit
kspace_delay = -1.5;  

% echo readout gradient waveform file
readout_trajectory_file = 'readout_Jan2024.mod';

% ScanArchive data file names
datafile_ghostcal = '/export/jfnielse/tmp/4Yongli/20240227jondev_14114/scanarchive/Series4/ScanArchive_UM750MR_20240227_140830924.h5';
datafile_mb1 = '/export/jfnielse/tmp/4Yongli/20240227jondev_14114/scanarchive/Series5/ScanArchive_UM750MR_20240227_140844718.h5';
datafile_rest = '/export/jfnielse/tmp/4Yongli/20240227jondev_14114/scanarchive/Series6/ScanArchive_UM750MR_20240227_140930198.h5';  % beta on
datafile_rest = '/export/jfnielse/tmp/4Yongli/20240227jondev_14114/scanarchive/Series7/ScanArchive_UM750MR_20240227_141621177.h5';  % beta off

set_common_parameters;   % in ../../recon/

