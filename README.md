# Getting and Cleaning Data Course Project
Project for <a href="https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project">Getting and Cleaning course on Coursera</a>

Project Description
===================
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Repository Contents
===================
* CodeBook.md - information on the raw data, the tidy data and the process to convert from the raw to the tidy data set.
* README.md - this file
* run_analysis.R - the R script that will process the raw data into tidy data.
* data/UCI HAR Dataset - dataset used in this project.

Creating the tidy data set.
===========================
1. Clone this repository
2. Load the run_analysis.R script file in RStudio
3. Run the function tidyUCIHARDataSet() 
4. To create the second independent tidy data file run the script writeAverageForVariableAndSubject()

Script Functions.
=================
<b>tidyUCIHARDataSet(uci_dir)</b>

Function to tidy the UCI HAR DataSet.<p>
> <b>parameters:</b><p>
> uci_dir - the path to the UCI HAR DataSet, if no directory is sepcified uses "./data/UCI HAR Dataset"
> <p><b>return:</b><p>
> data.frame containing the tidy data for the UCI HAR DataSet

<b>writeAverageForVariableAndSubject(file_name, uci_dir)</b><p>
This function runs the tidyUCIHARDataSet() function and outputs the results to the file specified in the file_name parameter.<p>
> <b>parameters:</b><p>
> file_name - the name of the file to create, if no file is sepcified creates the file named "UCI_HAR_Dataset_Tidy_DataSet.txt"<p>
> uci_dir - the path to the UCI HAR DataSet, if no directory is sepcified uses "./data/UCI HAR Dataset"

