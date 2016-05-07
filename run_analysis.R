# Function to print out information from teh script
# As loading the data can take some time we need to give the user
# a status upate that the script is working.
p <- function(...) { 
    cat( ..., "\n") 
} 

# Function to read the feature file.
# parameters:
#     uci_dir - directory that contains the features.txt file.
# return:
#     data.frame that contains the contents of the features.txt file.
readFeatureFile <- function(uci_dir)
{
    feature_file <- paste(uci_dir, "features.txt", sep = "/") 
    read.table(feature_file, colClasses = c("character"))
}

# Function to read the activity label file.
# parameters:
#     uci_dir - directory that contains the activity_labels.txt file.
# return:
#     data.frame that contains the contents of the activity_labels.txt file.
readActivityLabels <- function(uci_dir)
{
    activity_labels_file <- paste(uci_dir, "activity_labels.txt", sep = "/")
    read.table(activity_labels_file, col.names = c("activityid", "activity"))
}

# Function to read the test subject file.
# parameters:
#     uci_dir - root directory that contains the test/subject_test.txt file.
# return:
#     data.frame that contains the contents of the test/subject_test.txt file.
readSubjectTest <- function(uci_dir)
{
    subject_test_file <- paste(uci_dir, "test/subject_test.txt", sep = "/")
    read.table(subject_test_file)
}

# Function to read the training subject file.
# parameters:
#     uci_dir - root directory that contains the train/subject_train.txt file.
# return:
#     data.frame that contains the contents of the train/subject_train.txt file.
readSubjectTraining <- function(uci_dir)
{
    subject_train_file <- paste(uci_dir, "train/subject_train.txt", sep = "/")
    read.table(subject_train_file)
}

# Function to read the information from a file using the read.table command
# parameters:
#      root_dir - the root directory that contains the file
#      file_path - the path to the file from the root directory
# return
#     data.frame containing the information from the file.
readTableFromPath <- function(root_dir, file_path)
{
    full_path <- paste(root_dir, file_path, sep="/")
    read.table(full_path)
}

# Function to merge the data from x_set and y_set with the subject data
# parameters: 
#     x_set - data.frame that contains the X data from the sensors.
#     y_set - data.frame that contains the Y data from the sensors.
#     subject -
# return:
#     data.frame that contains the sensor data in x_set and y_set data merged 
#     with the subjects in the subject data.frame 
bindSensorData <- function(x_set, y_set, subject)
{
    x_sensor_data <- cbind(x_set, subject)
    cbind(x_sensor_data, y_set)
}

# Function to convert the names in the parameter into tidy names.
# Removes (), converts t to Time and f to Frequency
# Converts the abbreviations to the full name
# Adds additional "." to space out the names and make them easier to read.
# parameters:
#      names - the names of the columns to tidy
# return:
#      the tidy names
updateNames <- function(names)
{
    # Remove parentheses 
    names <- gsub('\\(|\\)',"",names)
    # Make syntactically valid names and they are unique
    names <- make.names(names, unique = TRUE) 
    
    # change t to Time and f to Frequency 
    names <- gsub('^t',"Time.",names) 
    names <- gsub('^f',"Frequency.",names) 
    
    # Make clearer names based features_info.txt
    names <- gsub('Acc',"Acceleration",names) 
    names <- gsub('Mag',"Magnitude",names) 
    names <- gsub('\\.mean',".Mean",names) 
    names <- gsub('\\.std',".StandardDeviation",names) 
    names <- gsub('Freq\\.',"Frequency.",names) 
    names <- gsub('Freq$',"Frequency.",names)
    
    # Some column names contain BodyBody so make this just Body
    names <- gsub('BodyBody', "Body", names)
    
    # add in some additional "." delimiters to try and
    # space out the names to make them more readable.
    names <- gsub('Body', "Body.", names)
    names <- gsub('Gravity', "Gravity.", names)
    names <- gsub('GyroJerk', "GyroJerk.", names)
    
    # rename the subject and activityid fields
    names <- gsub('^subject', "Subject", names)
    names <- gsub('^activity', "Activity", names)
    
    # although the tidy data lectures says that 
    # all field names should be lower case and no "." if I do that
    # it makes it very difficult to distinguish one column from the next 
    # so commenting out these lines.
    #names <- gsub('\\.', "", names)
    #tolower(names)
}

# Function to tidy the UCI HAR DataSet.
# parameters:
#     uci_dir - the path to the UCI HAR DataSet, if no directory is sepcified uses "./data/UCI HAR Dataset"
# return:
#     data.frame containing the tidy data for the UCI HAR DataSet
tidyUCIHARDataSet <- function(uci_dir = "./data/UCI HAR Dataset")
{
    library(dplyr)
    
    # read all the data from the files
    #uci_dir <- "./data/UCI HAR Dataset"
    p("Reading Features")
    features <- readFeatureFile(uci_dir)
    p("Reading Labels")
    activity_labels <- readActivityLables(uci_dir)
    
    # read the trainging data
    p("Reading Training DataSet")
    p("    Reading X Training Subjects")
    x_train <- readTableFromPath(uci_dir, "train/x_train.txt")
    
    p("    Reading Y Training Subjects")
    y_train <- readTableFromPath(uci_dir, "train/y_train.txt")
    
    p("    Reading Training Subjects")
    subject_train <- readSubjectTraining(uci_dir)
   
    # create the training sensor data
    p("    Binding Training Sensor Data...")
    train_sensor_data <- bindSensorData(x_train, y_train, subject_train)
    
    #read the test data
    p("Getting Test DataSet")
    p("    Reading X Test Subjects")
    x_test <- readTableFromPath(uci_dir, "test/x_test.txt")
    
    p("    Reading Y Test Subjects")
    y_test <- readTableFromPath(uci_dir, "test/y_test.txt")
    
    p("    Reading Test Subjects")
    subject_test <- readSubjectTest(uci_dir)
    
    # create the test sensor data
    p("    Binding Test Sensor Data...")
    test_sensor_data <- bindSensorData(x_test, y_test, subject_test)
    
    # merge the full set of sensor data
    p("Merging Training and Test Sensor Data")
    sensor_data <- rbind(train_sensor_data, test_sensor_data)
    
    # update the labels for the sensors
    p("Update Columns Labels for Sensor Data")
    # add two additional columns for the subject and activity Id
    sensor_labels <- rbind(rbind(features, c(562, "subject")), c(563, "activityid"))[,2] 
    names(sensor_data) <- sensor_labels 
    
    # based on the names extract only those that have mean and std
    p("Extract columns with Mean and Standard Deviation Values")
    sensor_data_mean_std <- sensor_data[,grepl("mean|std|subject|activityid", names(sensor_data))]
    
    # update the labels
    p("Make tidy labels")
    # join on the activity id to get the activiy names
    sensor_data_mean_std <- join(sensor_data_mean_std, activity_labels, by = "activityid", match = "first") 
    
    #remove the activity id
    sensor_data_mean_std <- select(sensor_data_mean_std, -activityid)
    
    # update the names
    names(sensor_data_mean_std) <- updateNames(names(sensor_data_mean_std))
    
    # return the tidy data
    sensor_data_mean_std
}

# This function runs the tidyUCIHARDataSet() function and outputs the 
# results to the file specified in the file_name parameter.
# parameters:
#     file_name - the name of the file to create, if no file is sepcified creates the file named "UCI_HAR_Dataset_Tidy_DataSet.txt"
#     uci_dir - the path to the UCI HAR DataSet, if no directory is sepcified uses "./data/UCI HAR Dataset"
writeAverageForVariableAndSubject <- function(file_name = "UCI_HAR_Dataset_Tidy_DataSet.txt", uci_dir = "./data/UCI HAR Dataset")
{
    full_path = paste(uci_dir, file_name, sep= "/")
    sensor_data_mean_std <- tidyUCIHARDataSet()
    sensor_avg_by_act_sub = ddply(sensor_data_mean_std, c("Subject","Activity"), numcolwise(mean))
    p("Saving clean data to:", full_path)
    write.table(sensor_avg_by_act_sub, file = full_path, row.name=FALSE) 
}



