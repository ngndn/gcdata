library(dplyr)
#Load data
#TODO: allow path argument can be passed via command line or through source
#TODO: or make path become an environment variable

#Path to UCI Har Dataset, remember to put "/" at the end
#e.g "/home/user/UCI HAR Dataset/"
path <- ""

x_train <- read.table(paste(path, "train/X_train.txt", sep = ""))
y_train <- read.table(paste(path, "train//y_train.txt", sep = ""))
subject_train <- read.table(paste(path, "train//subject_train.txt", sep = ""))
x_test <- read.table(paste(path, "test//X_test.txt", sep = ""))
y_test <- read.table(paste(path, "test//y_test.txt", sep = ""))
subject_test <- read.table(paste(path, "test//subject_test.txt", sep = ""))
features <- read.table(paste(path, "features.txt", sep = ""))$V2
names(x_train) <- features
names(x_test) <- features
x_train <- x_train[, !duplicated(names(x_train))]
x_test <- x_test[, !duplicated(names(x_test))]
x_train <- mutate(x_train, activity = y_train$V1, subject = subject_train$V1)
x_test <- mutate(x_test, activity = y_test$V1, subject = subject_test$V1)

#1. Merge two data set into one
data <- rbind(x_train, x_test)

#2. Select only measurements about mean and std
data <- select(data, contains("-mean"), contains("std"), activity, subject)

#4. Change varible names to a more comprehensive format
names(data) <- gsub("\\(\\)", "", names(data))
names(data) <- gsub("-", "_", names(data))
names(data) <- sub("^t", "time", names(data))
names(data) <- sub("^f", "freq", names(data))
activities <- read.table(paste(path, "activity_labels.txt", sep = ""))$V2

#3. Change the activities' name to a more comprehensive format
for (i in 1:6) {data$activity[data$activity == i] = toString(activities[i])}

#5. Create new data set
new_data <- data %>% group_by(subject, activity) %>% summarise_each(funs(mean))
write.table(new_data, "new_data.txt", row.name=FALSE)