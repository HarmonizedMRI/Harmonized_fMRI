# SMS-EPI reconstruction example

This folder contains MATLAB code that implements 
a complete vendor-agnostic workflow for reconstructing
SMS-EPI data for functional MRI.

The specific workflow implementation provided here is 
designed for **Linux**;
If you'd like to implement a similar workflow on
other operating systems, let us know and we'll work with
you to make that happen.

The SMS-EPI fMRI pulse sequence is defined in the 
[Pulseq](https://pulseq.github.io/ "Vendor-agnostic MRI pulse sequences")
vendor-agnostic file format,
that allows the same sequence definition to be executed on multiple MRI
hardware platforms; at present, Siemens and GE scanner models 
are supported.
The fMRI image time-series is reconstructed using slice GRAPPA.
In this way, you have complete control over, and knowledge of, 
the entire protocol from acquisition to reconstructed images;
no vendor-dependent reconstruction or image processing is performed.

The SMS-EPI fMRI sequence provided here matches the ABCD protocol
(2.4 mm isotropic resolution, 90x90x60 matrix size, 0.8s temporal resolution,
SMS factor 6).


## Requirements

**MATLAB** is required to run the code in this repository.

**git** is the most convenient way to download the code as described in the next step. 
Alternatively, you can navigate to each repository and download the code as a ZIP file 
(under the green "Code" button in each repository).


## Quick reconstruction demo


### Step 0: Download this repository and enter the example directory

```
$ git clone git@github.com:HarmonizedMRI/Harmonized_fMRI.git
$ cd Harmonized_fMRI/SMS-EPI/examples/1/
```

### Step 1: Download the data files to the current folder

Download link: https://www.dropbox.com/scl/fo/vbc67ijm4lob38g91wrtb/h?rlkey=64juqy8xdu4a5xlt8uqykcw1h&dl=0


### Step 2: Run `main1.m`

In MATLAB:
```
>> main1;
```

From the Linux command line:
```
$ matlab -nosplash -nodesktop -r "run('main1.m')"
```

This will:
   * Add ../../recon/ to the MATLAB path
   * Download the source code from Github
   * Load `a.mat` and `dcal.mat`
   * Reconstruct the first 10 frames of `rest.h5` using slice GRAPPA.
     SMS slice groups will be displayed as they are being reconstructed.

