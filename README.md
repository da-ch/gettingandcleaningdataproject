# Getting And Cleaning Data Course Project

This file describes how the run_analysis.R script works, what decisions have been made and, where appropriate, why. I've listed this under headings of the steps

######Step 0 - Read in the necessary files and set column names.

Note that this is a pre-step to the project requirements; this is a necessary pre-requisite for the cleaning, sorting and analysis that follows. 

In order for the script to read in the files, the raw data files should be saved in the working directory, in their original structure inside the "UCI HAR Dataset" directory.

######Step 1 - Merge the training and the test sets to create one data set

Firstly, we add the activity codes and subject IDs as new columns to the training and test data sets, using `cbind()`. We then combine the two sets, using `rbind()`, as they have the same set of variables.

######Step 2 - Extract only the measurements on the mean and standard deviation for each measurement

######Step 3 - Use descriptive activity names to name the activities in the data set

######Step 4 - Appropriately label the data set with descriptive variable names

######Step 5 - From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

The following code will read the tidyData.txt file back into R:

```data <- read.table("./tidyData.txt", header = TRUE)

View(data)```
