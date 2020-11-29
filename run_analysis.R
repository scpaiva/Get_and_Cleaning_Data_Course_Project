#foldTest <- "E:/UCI HAR Dataset/test"
#foldTrain <- "E:/UCI HAR Dataset/train"
#iSignals <- "Inertial Signals"
fold <- "E:/UCI HAR Dataset"

#Get the label of features
fileOfFeatures <- read.table(paste(fold, "/features.txt", sep = ""))
labelOfFeatures <-fileOfFeatures[,2]

#Get the data of features
xTrain <- read.table("E:/UCI HAR Dataset/train/X_train.txt")
xTest <- read.table("E:/UCI HAR Dataset/test/X_test.txt")
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




subject <- read.table("E:/UCI HAR Dataset/test/subject_test.txt")
x <- read.table("E:/UCI HAR Dataset/test/X_test.txt")
y <- read.table("E:/UCI HAR Dataset/test/y_test.txt")

