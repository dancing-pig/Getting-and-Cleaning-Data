# Code Book

## Introduction
The R script in the directory is used to analyze text files from accelerometers from the Samsung Galaxy S smartphone and generate a tidy data set.

## Raw Data
1. features.txt  
2. activity_labels.txt  
3. train/x_train.txt  
4. train/y_train.txt  
5. test/x_test.txt  
6. test/y_test.txt  
7. train/subject_train.txt  
8. test/subject_test.txt
9. activity_labels.txt

## Process Data
Here, I merge the test set and the train set, and mainly focus on the mean and standard error measurements. Finally, I use some descriptive names to the data set and create a tidy data set stored in tidy_data.txt.

## Result
tidy_data.txt  
1. subject: represent diffenrent subjects, range from 1 to 30.  
2. label: represent labels of 6 different activities.  
3. features: represent mean or standard error of different features.


