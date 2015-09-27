#Read in training files
trainingSet <- read.table("./UCI HAR Dataset/train/X_train.txt")
trainingLabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
trainingSubjects <- read.table("./UCI HAR Dataset/train/subject_train.txt")
#Read in test files
testSet <- read.table("./UCI HAR Dataset/test/X_test.txt")
testLabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
testSubjects <- read.table("./UCI HAR Dataset/test/subject_test.txt")
#Read in features and activity_labels files 
features <- read.table("./UCI HAR Dataset/features.txt")
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Set column names
names(trainingSubjects) <- c("Subject")
names(testSubjects) <- c("Subject")
names(trainingSet) <- features[,2]
names(testSet) <- features[,2]
names(trainingLabels) <- c("Activity")
names(testLabels) <- c("Activity")
names(activityLabels) <- c("Activity","ActivityName")

#Step 1
#Merge data
#Add activities and subjects to results
training <- cbind(trainingLabels,trainingSubjects,trainingSet)
test <- cbind(testLabels,testSubjects,testSet)
#Combine training and test data 
fullSet <- rbind(training,test)

#Step 2
#Select only means and standard deviations
fullSetMeanStd <- fullSet[,grepl("Activity|Subject|mean[()]|std[()]",names(fullSet))]

#Step 3
#Add descriptive activity names
library(plyr)
labelledFullSetMeanStd <- join(fullSetMeanStd,activityLabels)
tidierDataSet <- labelledFullSetMeanStd[,c(ncol(labelledFullSetMeanStd),2:(ncol(labelledFullSetMeanStd)-1))]

#Step 4
#Remove non-alphanumeric characters
names(tidierDataSet) <- gsub("[()]|[-]","",names(tidierDataSet))
#Replace exisiting variable names with more descriptive variable names
names(tidierDataSet)[1] <- "Activity"
names(tidierDataSet) <- gsub("Acc","Acceleration",names(tidierDataSet))
names(tidierDataSet) <- gsub("Mag","Magnitude",names(tidierDataSet))
names(tidierDataSet) <- gsub("std","StandardDeviation",names(tidierDataSet))
names(tidierDataSet) <- gsub("mean","Mean",names(tidierDataSet))
names(tidierDataSet)[3:42] <- sub("t","Time",names(tidierDataSet)[3:42])
names(tidierDataSet)[43:68] <- gsub("f","Frequency",names(tidierDataSet)[43:68])
names(tidierDataSet) <- gsub("BodyBody","Body",names(tidierDataSet))

#Step 5
library(reshape2)
meltedData <- melt(tidierDataSet,id=c("Activity","Subject"))
tidyData <- dcast(meltedData, Activity + Subject ~ variable, mean)
#Write to text file
write.table(tidyData, file="./tidyData.txt", row.names=FALSE)