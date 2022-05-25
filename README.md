﻿# CITS4402 Satellite Image Multiple Object Tracking
 
This repo contains an implementation of MOT in MATLAB as described in a paper by Wei Ao et al.

## Instructions
To run the code first download the repo and extract into a single directory - ensure that all of the MATLAB function files are in the same directory.

Next run the GUI app by opening the MOT.mlapp file.

From here, follow the instructions provided within app to process your dataset.

## Notes
- In the first tab the user is required the select dataset location, frame range and filename template. The following factors must be kept in mind when changing these parameter:
  - Dataset location: The app expects the file structure of the dataset to be as such: "001/img/xx.jpg". In such a case, the user would select folder "001" as their dataset location
  - Frame Range: User may provide an uppper and lower framerange if they want to analyse only a portion of their dataset. Please note, the app does not verify the selection and so the user must verify that the provided frame range is within the bounds of their dataset
  - Name template: The default frame template corresponds to the VISO MOT dataset. If users have image names that follow a different template they may edit the name template field to match their dataset
