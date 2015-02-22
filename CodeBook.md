# Getting and Cleansing Data - Course Project - Codebook

Data is obtained from the following location:  [Link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Source Data
Source data contains a total of nine text files that were used for this analysis.  They are as follows:

* features.txt - A list of column headers for the raw data
* activity_labels.txt - A lookup list of the codes for Activities
* x_test.txt - raw test data
* subject_test.txt - Subject Number information for the test data
* y_test.txt - Activity data for the test subjects
* x_train.txt - raw training data
* subject_train.txt - Subject Number information for the training data
* y_train.txt - Activity data for the training subjects

The dataset contains the following variables:
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 


## Data Prep
Each file above was imported into the r environment.  Following the import, activity labels were appended to the test and training raw data files.  The Activity, Subject, and Activity Description files were appended to each data set to provide a complete set of information for each subject per activity.  

## Analysis
Following data prep, columns related to the mean and standard deviation of each metric were extracted and analyzed for each subject.  Data is aggregated by Subject Number ("SubjectNum"), Activity ("Activity"), and Activity Description ("ActivityDesc").
