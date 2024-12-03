% Computing Functional Connectivity (FC) from Brain fMRI using seed-based cross-correlation 
% with seeds labeled in the Medical Image Labeler app.

%% Loading resting state fMRI data:

fMRI = medicalVolume("subjects/sub-control20/func/sub-control20_ses-01_task-rest-AP_bold.nii");
[h, w, d, T] = size(fMRI.Voxels)
% fMRI data has a spatial size of h-by-w-by-d and T timepoints.

% Reshape voxels of fMRI data into matrix where every column of the matrix represents one timepoint of the fMRI data. 
fMRIVoxels = fMRI.Voxels;
fMRIVoxelsMatrix = reshape(fMRI.Voxels,[],T);

%% Labeling seed region:

medicalImageLabeler

%% Compute FC map:

% Use niftiread to read the label data from the medical image labeling session.
% The label data is a mask for the selected seed region. 
% Reshape the mask into a single column and convert it to logical values.
seedMask = niftiread("MedicalLabelingSession/LabelData/sub-control20_ses-01_T1W.nii");
seedMask = reshape(seedMask,[],1);
seedMask = logical(seedMask);

% Use the reshaped mask as a logical index to get the timeseries of the seed voxels from fMRIVoxelsMatrix. 
% Compute the mean seed timeseries from the selected seed voxels timeseries.
fMRIVoxelsMatrix = reshape(fMRIVoxelsMatrix,[],1); 
seed = fMRIVoxelsMatrix(seedMask,:);
seed = mean(seed);

% Compute the rsFC map from the fMRI data voxels and the seed timeseries using the computeRestingStateFunctionalConnectivity function. 
% The function returns a 3-D volume that is a mask of the regions functionally connected with the seed region.
funcConnMap = computeRestingStateFunctionalConnectivity(fMRIVoxels,seed);
% This leads to "X and Y must have same number of elements" error.
% Need to change c = corrcoef(seed,V(m,n,p,:)) to make seed and V have same
% number of elements?