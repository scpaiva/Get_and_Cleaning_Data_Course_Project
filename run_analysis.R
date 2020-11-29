#foldTest <- "E:/UCI HAR Dataset/test"
#foldTrain <- "E:/UCI HAR Dataset/train"
#iSignals <- "Inertial Signals"
fold <- "E:/UCI HAR Dataset"

#Get the label of features
fileOfFeatures <- read.table(paste(fold, "/features.txt", sep = ""))
labelOfFeatures <-fileOfFeatures[,2]

#Get the data of features
var <- "X"
xTrain <- read.table(paste(fold, "/train/", var, "_train.txt", sep = ""))
xTest <- read.table(paste(fold, "/test/", var, "_test.txt", sep = ""))

#Merges the training and the test sets to create one data set
x <- rbind(xTrain, xTest)
colnames(x) <- labelOfFeatures

#Extracts only the measurements on the mean and standard deviation 
#for each measurement

# ----OR    WITH meanFreq()
subfeatures <- labelOfFeatures[which(grepl("mean", labelOfFeatures) |
                                       grepl("std", labelOfFeatures))]

# ----OR    WITHOUT meanFreq()
subfeatures <- labelOfFeatures[which(grepl("mean[^F]", labelOfFeatures) |
                                       grepl("std", labelOfFeatures))]
xSubfeatures <- x[subfeatures]

var <- "subject"
subjectTrain  <- read.table(paste(fold, "/train/", var, "_train.txt", sep = ""))
subjectTest <- read.table(paste(fold, "/test/", var, "_test.txt", sep = ""))
subject <- rbind(subjectTrain, subjectTest)

var <- "y"
yTrain <- read.table(paste(fold, "/train/", var, "_train.txt", sep = ""))
yTest <- read.table(paste(fold, "/test/", var, "_test.txt", sep = ""))
y <- rbind(yTrain, yTest)
y <- unlist(y)

#Get the label of activity
activity_labels <- read.table(paste(fold, "/activity_labels.txt", sep = ""))
activity <- activity_labels[y,]$V2

dataset <- cbind(subject, y, activity, xSubfeatures)
colnames(dataset)[1] <- "subject"

write.csv(paste(fold, "/dataset_MEAN-STD.CSV", sep = ""))

#From the data set in step 4, creates a second, independent tidy data set with the 
#average of each variable for each activity and each subject

for(i in 1:nrow(activity_labels)){
  for(j in 1:30){ # 30 = number of participants
    
    #Subset the dataset
    data <- dataset[which(dataset$subject == j & dataset$y == i),]
    
    #Create each row of new dataset
    #Add subject, activity id and label
    d <- cbind(j, i, data[1,]$activity)
    
    #Add average of each variable
    for(k in 4:ncol(data)){
      d <- cbind(d, mean(data[,k]))
    }
    d <- data.frame(d)
    #Create the dataset
    if(i == 1 & j == 1){
      newDataset <- d
    }else{
      newDataset <- rbind(newDataset, d)
    }
  }
}
colnames(newDataset) <- names(dataset)
write.csv(paste(fold, "/NEW_dataset_MEAN-STD.CSV", sep = ""))
