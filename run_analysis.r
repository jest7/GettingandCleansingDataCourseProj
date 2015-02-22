## Set WD to the directory for the clipboard
setwd(readClipboard())

##Read in features.txt so I can use this to build column headers
headers <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

## Import and merge Test files
test_data <- read.table("X_test.txt")
test_subjects <- read.table("subject_test.txt")
test_activity <- read.table("y_test.txt")

colnames(test_data) <- headers$V2

test_data2 <- cbind(test_data, test_activity)

colnames(test_data2)[562] <- "Activity"

test_data3 <- merge(test_data2, activity_labels, by.x="Activity", by.y="V1")

colnames(test_data3)[563] <- "ActivityDesc"

test_data4 <- cbind(test_data3, test_subjects)

colnames(test_data4)[564] <- "SubjectNum"


## Import and merge training files
train_data <- read.table("X_train.txt")
train_subjects <- read.table("subject_train.txt")
train_activity <- read.table("y_train.txt")

colnames(train_data) <- headers$V2

train_data2 <- cbind(train_data, train_activity)

colnames(train_data2)[562] <- "Activity"

train_data3 <- merge(train_data2, activity_labels, by.x="Activity", by.y="V1")

colnames(train_data3)[563] <- "ActivityDesc"

train_data4 <- cbind(train_data3, train_subjects)

colnames(train_data4)[564] <- "SubjectNum"

## Combine data sets
combined_data <- rbind(test_data4, train_data4)

## Pull relevant columns
## combined_data[grepl("std|mean", names(combined_data))]

combined_data2 <- combined_data[,c("SubjectNum", "Activity", "ActivityDesc", colnames(combined_data)[grep("std|mean",colnames(combined_data))])]

## Export tidy data set
tidy_dataset <- aggregate(combined_data2, list(combined_data2$SubjectNum, combined_data2$ActivityDesc), mean)

## Clean Up tidy dataset
tidy_dataset$SubjectNum <- NULL
tidy_dataset$ActivityDesc <- NULL

colnames(tidy_dataset)[1] <- "SubjectNum"
colnames(tidy_dataset)[2] <- "ActivityDesc"

head(headers)

head(tidy_dataset)


write.table(tidy_dataset, file = "tidy_dataset.txt", row.name=FALSE)