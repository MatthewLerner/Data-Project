Act <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#Reads all necessary Tables

X<- rbind(X_test, X_train)
Y<- rbind(y_test, y_train)
subject<- rbind(subject_test, subject_train)
#Combines the Test and Train files, for X, Y(activity) and subject, respectively.

features <- as.vector(features[,2])
colnames(X) <- features
colnames(Y) <- c("Activity")
colnames(subject) <- c("Subject")
#Condenses features down into a vector. 
#Features is then applied as the column names for X.
#Column names given for Y(activity), and Subject.

X2 <- X[, grepl("[Mm]ean|[Ss][Tt][Dd]", colnames(X))] 
#Subset X to only columns that are means or standard deviations

Z <-cbind(subject,Y,X2)
#Adds the Subject and Activity columns to the X Data Frame

Z$Activity <- gsub(1, "Walking", Z$Activity)
Z$Activity <- gsub(2, "Walking Upstairs", Z$Activity)
Z$Activity <- gsub(3, "Walking Downstairs", Z$Activity)
Z$Activity <- gsub(4, "Sitting", Z$Activity)
Z$Activity <- gsub(5, "Standing", Z$Activity)
Z$Activity <- gsub(6, "Laying", Z$Activity)
# Changes the activity number to its corresponding activity in text

library(reshape2)
#Opens the reshape2 pacakage

Z2 <- melt(Z, id = colnames(Z[,c(1:2)]), measure.vars = colnames(Z[,c(3:86)]))
#Brings on all mesured variables into a single column, with the former column names as labels in another column.  
#Subject and Activity still have their own columns

Z3 <-dcast(Z2, Subject + Activity ~ variable, mean)
#The mean of every column based on Subject and Activity

write.table(Z3, file = "./TidyDataSet.txt", row.names = FALSE)
#Creates a text file based on our Tidy Data Set, Z3
