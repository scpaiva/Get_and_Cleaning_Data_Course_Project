<h3>Feature Selection</h3>

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. <br /> 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).<br /> 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). <br /> 

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

<ol>
<li>tBodyAcc-XYZ</li>
<li>tGravityAcc-XYZ</li>
<li>tBodyAccJerk-XYZ</li>
<li>tBodyGyro-XYZ</li>
<li>tBodyGyroJerk-XYZ</li>
<li>tBodyAccMag</li>
<li>tGravityAccMag</li>
<li>tBodyAccJerkMag</li>
<li>tBodyGyroMag</li>
<li>tBodyGyroJerkMag</li>
<li>fBodyAcc-XYZ</li>
<li>fBodyAccJerk-XYZ</li>
<li>fBodyGyro-XYZ</li>
<li>fBodyAccMag</li>
<li>fBodyAccJerkMag</li>
<li>fBodyGyroMag</li>
<li>fBodyGyroJerkMag</li>
</ol>
The set of variables that were estimated from these signals are:
<ol>
<li>mean(): Mean value;</li>
<li>std(): Standard deviation</li>
</ol>
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable: 
  <ol>
    <li>gravityMean</li>
    <li>tBodyAccMean</li>
    <li>tBodyAccJerkMean</li>
    <li>tBodyGyroMean</li>
    <li>tBodyGyroJerkMean</li>
    </ol>
The step by step to carry out the necessary actions in this project were:
<ol>
<li>Get the label of features</li>
<li>Get the data of features</li>
<li>Merges the training and the test sets to create one data set</li>
<li>Extracts only the measurements on the mean and standard deviation for each measurement</li>
<li>Get the subject</li>
<li>Get the action</li>
<li>Get the label of activity</li>
<li>Create the dataset</li>
<li>Save the dataset</li>
</ol>  
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
<ol>
<li>Subset the dataset</li>
<li>Create each row of new dataset</li>
<li>Add subject, activity id and label</li>
<li>Add average of each variable</li>
<li>Create the dataset</li>
<li>Get the attributes</li>
<li>Save the new dataset</li>
</ol>
