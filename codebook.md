##CodeBook for the tidy dataset

###Data source

This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which is avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Files used

* Features.txt
* activity_labels.txt
* X_train.txt
* subject_train.txt
* y_train.txt
* X_test.txt
* subject_test.txt
* y_test.txt

Detailed information about the files and features is available in README.txt and features_info.txt.

###Processing steps

* Test and Train Data is read into respective tables
* Column names are assigned to the tables created for readabilty and differentiation
* Logical vector is created for filtering out the column with mean and standard deviation
* Only columns with exact string "mean()" or "std()" is retained
* Data sets are merged and melted based on subject, activity id and activity name
* The melted data is recast into the tidy data with mean value for each of the feature for that subject/activity combination.
* One subject has 6 activities. So for 30 subjects, there are a total of 180 rows
* The resultant data is written to a csv file.