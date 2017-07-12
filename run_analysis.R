
# download file and unzip the file
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
f <- file.path(getwd(), "wearable_data.zip")
download.file(url, f)
unzip(f)

# Load library dplyr
library("dplyr")

# Read activity labels, features, test data for X, Y, subject
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Assign column names to the table
names(X_test) <- features

# make a logical vector for filtering out the column with mean and 
# standard deviation
extract_features <- grepl("mean|std", features)
# use the vector to filter the mean and SD columns
X_test <- X_test[,extract_features]

# Adding a new column to y by assigning labels to y data and 
# assigning label to subject
y_test[,2] <- activity_labels[y_test[,1]]
names(y_test) <- c("Activity_ID", "Activity_Label")
names(subject_test) <- "subject"

# Combining X, Y and subject into a single frame
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

# Read train data for X, Y, subject
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Assign column names to the table
names(X_train) <- features

# using the already created logical vector for filtering out the column 
# with mean and standard deviation to filter the mean and SD columns
X_train <- X_train[,extract_features]

# Adding a new column to y by assigning labels to y data and 
# assigning label to subject
y_train[,2] <- activity_labels[y_train[,1]]
names(y_train) <- c("Activity_ID", "Activity_Label")
names(subject_train) <- "subject"

# Combining X, Y and subject into a single frame
train_data <- cbind(as.data.table(subject_train), y_train, X_train)

# Merging test and train data
all_data <- rbind(test_data, train_data)

id_labels <- c("subject", "Activity_ID", "Activity_Label")
data_labels <- setdiff(colnames(all_data), id_labels)
melt_data <- melt(all_data, id = id_labels, measure.vars = data_labels)

# Creating the tidy data set 
tidy_data <- dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_data.csv", sep = ",")
