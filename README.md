#Getting and Cleaning Data: Course Project

#About the source data

The features are in the x_test.txt. 
The activity labels are in the y_test.txt file.
The test subjects are in the subject_test.txt file.

The same holds for the training set.

#About the script 

The script run_analysis.R which will download the file and unzip the same in the working directory.

The test and train data extracted are then labeled for better understanding and only columns which are related to mean and standard deviation are selected.

As a result of the data transformation, tidy data set is created with the means of all the columns per test subject and per activity.
This tidy dataset will be written to a tidy.csv, which can also be found in this repository.

#About the Code Book

The CodeBook.md file explains the transformations performed and the resulting data and variables.
