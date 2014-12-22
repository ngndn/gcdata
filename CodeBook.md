#CodeBook

##Introduction
This file describes the variables in `new_data.txt` which is produced at step 5 in the course project. This file also describes briefly the process to produce that file.

##Raw Data
Raw data come from this (dataset)[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]. This dataset is data collect from accelerometer and gyroscope in Samsung Galaxy S II

##Data
`new_data.txt` is a 180x81 matrix. Each row consists values of 79 variables (more info below) for each `subject` and `activity`. Value in each 79 variable (except `subject` and `activity`)  of each row is the mean. `subject` is integer which represents the person performing the acitivity. `activiy` consists 6 types of activity the person can perform: walking, walking upstairs, walking downstairs, stiing, standing, laying.

##Variables
There are 81 variables in `new_data.txt`. 79 variables are the combination of those signal:

* timeBodyAcc-XYZ
* timeGravityAcc-XYZ
* timeBodyAccJerk-XYZ
* timeBodyGyro-XYZ
* timeBodyGyroJerk-XYZ
* timeBodyAccMag
* timeGravityAccMag
* timeBodyAccJerkMag
* timeBodyGyroMag
* timeBodyGyroJerkMag
* freqBodyAcc-XYZ
* freqBodyAccJerk-XYZ
* freqBodyGyro-XYZ
* freqBodyAccMag
* freqBodyAccJerkMag
* freqBodyGyroMag
* freqBodyGyroJerkMag

with three measurements
* mean: mean value
* std: standard deviation
* meanFreq: Weighted average of the frequency components to obtain a mean frequency

if the signal has "-XYZ" suffix that means there is separate variable for each axis (X, Y, Z)

**NOTE**: 
* Combination does not mean there are exact pairs of signal-measurement.
* meanFreq is included for any further usage may involve

##Process
Raw data contains training and testing datasets. Those datasets are combined to produce the dataset of 10299x561. After some transformation (adding `subject` and `activity` column) and removing duplicate columns, we have 10299x479 dataset. From that a subset 10299x81 dataset was extracted, with 81 variables describe above. And then using average in each varible for each activity and each subject we got the 180x81 dataset above.





