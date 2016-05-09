---
title: "Codebook template"
author: "Lee Davies"
date: "7 May 2016"
output:
  html_document:
    keep_md: yes
---

## Project Description
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

##Study design and data processing

###Collection of the raw data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###Notes on the original (raw) data 
The dataset includes the following files:
* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

The origional files can be located at the following location:
<a href="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip">
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip</a>

##Creating the tidy datafile

###Guide to create the tidy data file
Clone this repository.
Load the R source file using source('run_analysis.R')
Run the tidyUCIHARDataSet() function to return data.frame of the tidy data.
Run the writeAverageForVariableAndSubject() function to create a file containing the average of each variable for each activity and each subject.

###Cleaning of the data
Short, high-level description of what the cleaning script does. 

For a more detailed description of the code see the following link.
<a href="https://github.com/leedavies/ProgrammingAssignment2/blob/master/README.md">README.md</a>

##Description of the variables in the tiny_data.txt file
The script tidyUCIHARDataSet generates a data frame of 10299 obs. of 81 variables from the origional UCI Har Dataset.
The data contains the mean and standard deviations for the activities for each subject.

The resusting data set contains the following variables.

Variable: time-body-acceleration-mean-x Type: num
Variable: time-body-acceleration-mean-y Type: num               
Variable: time-body-acceleration-mean-z Type: num                          
Variable: time-body-acceleration-standarddeviation-x Type: num                
Variable: time-body-acceleration-standarddeviation-y Type: num                 
Variable: time-body-acceleration-standarddeviation-z Type: num                
Variable: time-gravity-acceleration-mean-x Type: num                           
Variable: time-gravity-acceleration-mean-y Type: num                          
Variable: time-gravity-acceleration-mean-z Type: num                           
Variable: time-gravity-acceleration-standarddeviation-x Type: num             
Variable: time-gravity-acceleration-standarddeviation-y Type: num              
Variable: time-gravity-acceleration-standarddeviation-z Type: num             
Variable: time-body-accelerationjerk-mean-x Type: num                          
Variable: time-body-accelerationjerk-mean-y Type: num                         
Variable: time-body-accelerationjerk-mean-z Type: num                          
Variable: time-body-accelerationjerk-standarddeviation-x Type: num            
Variable: time-body-accelerationjerk-standarddeviation-y Type: num             
Variable: time-body-accelerationjerk-standarddeviation-z Type: num            
Variable: time-body-gyro-mean-x Type: num                                      
Variable: time-body-gyro-mean-y Type: num                                     
Variable: time-body-gyro-mean-z Type: num                                      
Variable: time-body-gyro-standarddeviation-x Type: num                        
Variable: time-body-gyro-standarddeviation-y Type: num                         
Variable: time-body-gyro-standarddeviation-z Type: num                        
Variable: time-body-gyrojerk-mean-x Type: num                                 
Variable: time-body-gyrojerk-mean-y Type: num                                
Variable: time-body-gyrojerk-mean-z Type: num                                 
Variable: time-body-gyrojerk-standarddeviation-x Type: num                   
Variable: time-body-gyrojerk-standarddeviation-y Type: num                    
Variable: time-body-gyrojerk-standarddeviation-z Type: num                   
Variable: time-body-accelerationmagnitude-mean Type: num                       
Variable: time-body-accelerationmagnitude-standarddeviation Type: num         
Variable: time-gravity-accelerationmagnitude-mean Type: num                    
Variable: time-gravity-accelerationmagnitude-standarddeviation Type: num      
Variable: time-body-accelerationjerkmagnitude-mean Type: num                   
Variable: time-body-accelerationjerkmagnitude-standarddeviation Type: num     
Variable: time-body-gyromagnitude-mean Type: num                               
Variable: time-body-gyromagnitude-standarddeviation Type: num                 
Variable: time-body-gyrojerk-magnitude-mean Type: num                          
Variable: time-body-gyrojerk-magnitude-standarddeviation Type: num            
Variable: frequency-body-acceleration-mean-x Type: num                         
Variable: frequency-body-acceleration-mean-y Type: num                        
Variable: frequency-body-acceleration-mean-z Type: num                         
Variable: frequency-body-acceleration-standarddeviation-x Type: num           
Variable: frequency-body-acceleration-standarddeviation-y Type: num            
Variable: frequency-body-acceleration-standarddeviation-z Type: num           
Variable: frequency-body-acceleration-meanfrequency-x Type: num                
Variable: frequency-body-acceleration-meanfrequency-y Type: num               
Variable: frequency-body-acceleration-meanfrequency-z Type: num                
Variable: frequency-body-accelerationjerk-mean-x Type: num                    
Variable: frequency-body-accelerationjerk-mean-y Type: num                     
Variable: frequency-body-accelerationjerk-mean-z Type: num                    
Variable: frequency-body-accelerationjerk-standarddeviation-x Type: num        
Variable: frequency-body-accelerationjerk-standarddeviation-y Type: num       
Variable: frequency-body-accelerationjerk-standarddeviation-z Type: num        
Variable: frequency-body-accelerationjerk-meanfrequency-x Type: num           
Variable: frequency-body-accelerationjerk-meanfrequency-y Type: num            
Variable: frequency-body-accelerationjerk-meanfrequency-z Type: num           
Variable: frequency-body-gyro-mean-x Type: num                                 
Variable: frequency-body-gyro-mean-y Type: num                                
Variable: frequency-body-gyro-mean-z Type: num                                 
Variable: frequency-body-gyro-standarddeviation-x Type: num                   
Variable: frequency-body-gyro-standarddeviation-y Type: num                    
Variable: frequency-body-gyro-standarddeviation-z Type: num                   
Variable: frequency-body-gyro-meanfrequency-x Type: num                        
Variable: frequency-body-gyro-meanfrequency-y Type: num                       
Variable: frequency-body-gyro-meanfrequency-z Type: num                        
Variable: frequency-body-accelerationmagnitude-mean Type: num                 
Variable: frequency-body-accelerationmagnitude-standarddeviation Type: num     
Variable: frequency-body-accelerationmagnitude-meanfrequency- Type: num       
Variable: frequency-body-accelerationjerkmagnitude-mean Type: num              
Variable: frequency-body-accelerationjerkmagnitude-standarddeviation Type: num
Variable: frequency-body-accelerationjerkmagnitude-meanfrequency- Type: num    
Variable: frequency-body-gyromagnitude-mean Type: num                         
Variable: frequency-body-gyromagnitude-standarddeviation Type: num             
Variable: frequency-body-gyromagnitude-meanfrequency- Type: num               
Variable: frequency-body-gyrojerk-magnitude-mean Type: num                     
Variable: frequency-body-gyrojerk-magnitude-standarddeviation Type: num       
Variable: frequency-body-gyrojerk-magnitude-meanfrequency- Type: num           
Variable: subject Type: int                                                   
Variable: activity Type:  Factor w/ 6 levels 1 WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

