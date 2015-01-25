# Function that reads data from multiple txt files from accelerometers
# from the Samsung Galaxy S smartphone and generate a tidy data set.
run_analysis <- function() {
    library(plyr)

    ## Suppose that now the current directory is in UCI HAR Dataset.
    
    ## Read the text files and rename the headers.
    activity_labels <- read.table("./activity_labels.txt")
    activity_labels <- activity_labels$V2 ## Only keep activity names
    
    features <- read.table("./features.txt")
    features <- features$V2 ## Only keep feature names
    
    x_test <- read.table("./test/X_test.txt")
    y_test <- read.table("./test/Y_test.txt")
    subject_test <- read.table("./test/subject_test.txt")
    names(y_test) <- "label"
    names(subject_test) <- "subject"
    
    x_train <- read.table("./train/X_train.txt")
    y_train <- read.table("./train/Y_train.txt")
    subject_train <- read.table("./train/subject_train.txt")
    names(y_train) <- "label"
    names(subject_train) <- "subject"
    
    ## Merge test data and train data
    names(x_test) <- features
    names(x_train) <- features
    main_data <- rbind(x_test, x_train)
    
    ## Create a data set has subject and activity
    data <- rbind(data.frame(y_test, subject_test), 
                  data.frame(y_train, subject_train))
    
    ## Extract the features representing mean or standard error
    mean_std <- grep("mean|std", names(main_data))
    data <- cbind(data, main_data[mean_std])
    
    ## Modify the number of labels to corresponding activity
    data$label <- as.factor(data$label)
    data$label <- mapvalues(data$label, levels(data$label), levels(activity_labels))
    
    ## Create the final tidy data
    tidy_data <- aggregate(data, by = list(data$subject, data$label), FUN = mean)
    tidy_data <- tidy_data[, !names(tidy_data) %in% c("label", "subject")]
    names(tidy_data)[1:2] <- c("subject", "label")
    
    ## Write the tidy data to a txt file
    write.table(tidy_data, "tidy_data.txt", row.name = FALSE)
}

