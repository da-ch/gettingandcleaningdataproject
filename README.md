#README

## Getting And Cleaning Data Course Project

This file describes how the run_analysis.R script works, what decisions have been made and, where appropriate, why. I've listed this under headings of the steps

######Step 0 - Read in the necessary files and set column names.

Note that this is a pre-step to the project requirements; this is a necessary pre-requisite for the cleaning, sorting and analysis that follows. 

In order for the script to read in the files, the raw data files should be saved in the working directory, in their original structure inside the "UCI HAR Dataset" directory.

######Step 1 - Merge the training and the test sets to create one data set

Firstly, we add the activity codes and subject IDs as new columns to the training and test data sets, using `cbind()`. We then combine the two sets, using `rbind()`, as they have the same set of variables.

######Step 2 - Extract only the measurements on the mean and standard deviation for each measurement

Using a `grepl()` with a regular expression, we can select only variables containing 'mean()' or 'std()' in their names. These are the variables containing the means and standard deviations for each measurement.

######Step 3 - Use descriptive activity names to name the activities in the data set

Please note that this step makes use of the `plyr` package so please ensure that package is installed. 

The `join()` function is used to add the descriptive activity names to the data set which is then subsetted and the columns reordered to tidy it up, leaving only the descriptive activity names and not the activity codes.

######Step 4 - Appropriately label the data set with descriptive variable names

A series of `gsub()` function calls is used to remove the illicit non-alphanumeric characters and then expand on the abbreviated parts of the variable names, to make them more descriptive.

######Step 5 - From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

Please note that this step makes use of the `reshape2` package so please ensure that package is installed. 

First we `melt()` the data set, specifying 'Activity' and 'Subject' as the identifier variables. This gives a long, narrow data set consisting of a row for each value by Activity, Subject and variable.

We then use `dcast()`, specifying that we want to use the mean as the aggregation function, to get a data set consisting of 180 rows (one observation for each subject doing each activity) and 68 variables (the Activity and Subject identifier variables followed by the 66 features which had recorded a mean or standard deviation). The values are the means of the recorded observations for each of the features for each activity and subject. A codebook is included in this repository as separate file.

The resultant tidy data set is then written out to a file, called 'tidyData.txt'. The following code will read the tidyData.txt file back into R:

```
data <- read.table("./tidyData.txt", header = TRUE)
View(data)
```
