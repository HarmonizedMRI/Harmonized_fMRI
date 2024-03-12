# A complete SMS-EPI example: from acquisition to image reconstruction

This folder contains MATLAB code that implements 
a complete vendor-agnostic workflow for acquiring and reconstructing
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


## Quick demo

### Requirements

**MATLAB** is required to run the code in this repository.

**git** is the most convenient way to download the code as described in the next step. 
Alternatively, you can navigate to each repository and download the code as a ZIP file 
(under the green "Code" button in each repository).

### Step 1: Download the data files

Download link: https://www.dropbox.com/scl/fo/vbc67ijm4lob38g91wrtb/h?rlkey=64juqy8xdu4a5xlt8uqykcw1h&dl=0

Copy all files to the current folder.


### Step 2: Run `main.m`

This should display SMS slice groups as they are being reconstructed.

