# Getting And Cleaning Data Course Project

This file describes how the run_analysis.R script works, what decisions have been made and, where appropriate, why. I've listed this under headings of the steps

######Step 0 - Read in the necessary files.

Note that this is a pre-step to the project requirements; loading in the data is a pre-requisite for the cleaning, sorting and analysing to follow. In order for the script to read in the files, the raw data files should be saved in the working directory, in their original structure inside the "UCI HAR Dataset" directory.

######Step 1 - Merges the training and the test sets to create one data set

######Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement

######Step 3 - Uses descriptive activity names to name the activities in the data set

######Step 4 - Appropriately labels the data set with descriptive variable names

######Step 5 - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

```data <- read.table("./tidyData.txt", header = TRUE)
View(data)```
