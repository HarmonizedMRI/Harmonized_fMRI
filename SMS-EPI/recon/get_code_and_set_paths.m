%% Get MATLAB toolboxes

% Read Siemens .dat files
% addpath ~/github/jfnielsen/scanLog/SiemensRead/
 
% toolbox for loading GE raw files
% addpath ~/Programs/orchestra-sdk-2.1-1.matlab/

% Pulseq (+mr namespace)
system('git clone --branch v1.4.2 git@github.com:pulseq/pulseq.git');
addpath pulseq/matlab

% hmriutils toolbox
%system('git clone --branch Harmonized_fMRI_prerelease git@github.com:HarmonizedMRI/utils.git');
system('git clone --branch Harmonized_fMRI_r0 git@github.com:HarmonizedMRI/utils.git');
addpath utils
 
% tools for converting to GE scan files
system('git clone --branch Harmonized_fMRI_r0 git@github.com:HarmonizedMRI/PulCeq.git');
addpath PulCeq/matlab
system('git clone --branch Harmonized_fMRI_r0 git@github.com:toppeMRI/toppe.git');
addpath toppe

% 'im' function for display
system('git clone --branch Harmonized_fMRI_r0 git@github.com:JeffFessler/mirt.git');
cd mirt; 
setup; 
ir_mex_build_mri;
ir_mex_build_table;
cd ..;
