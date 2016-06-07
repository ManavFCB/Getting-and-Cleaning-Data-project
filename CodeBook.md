#Raw Data Collection

The Raw Data are collected from the accelerometer of the Samsung Galaxy S smartphone.


#Data Transformation
##1.Merge Training and Data Sets
The train and test set are xtrain and xtest.Subject id datasets are subjecttrain and subjecttest.
The activity sets are ytrain and ytest.

##2.Extracting mean and standard deviation
The mean and standard deviation were extracted from the merged dataset
and were stored in an intermediate dataset.

##3.Activity Name Description
The activity column is included in the intermediate dataset.The values in the column are
looked up in the activity_labels.txt

##4.Labelling Variable Names
The original variables are changed.The commas,parentheses,
dashes are all removed to provide description.

##5.Writing to dataset
The final dataset is written to a file tidy_data.txt

#Variables

The variables used are:
1.Body Acceleration	            2.TimeDomain.BodyAcceleration.XYZ	        3.FrequencyDomain.BodyAcceleration.XYZ
4.Gravity Acceleration	            5.TimeDomain.GravityAcceleration.XYZ	
6.Body Acceleration Jerk	    7.TimeDomain.BodyAccelerationJerk.XYZ	8.FrequencyDomain.BodyAccelerationJerk.XYZ
9.Body Angular Speed	            10.TimeDomain.BodyAngularSpeed.XYZ	        11.FrequencyDomain.BodyAngularSpeed.XYZ
12.Body Angular Acceleration	    13.TimeDomain.BodyAngularAcceleration.XYZ	
14.Body Acceleration Magnitude	    15.TimeDomain.BodyAccelerationMagnitude	16.FrequencyDomain.BodyAccelerationMagnitude
17.Gravity Acceleration Magnitude   18.TimeDomain.GravityAccelerationMagnitude	
19.Body Acceleration Jerk Magnitude 20.TimeDomain.BodyAccelerationJerkMagnitude	21.FrequencyDomain.BodyAccelerationJerkMagnitude
22.Body Angular Speed Magnitude	    23.TimeDomain.BodyAngularSpeedMagnitude	24.FrequencyDomain.BodyAngularSpeedMagnitude
25.Body Angular AccelerationMagnitu 26.TimeDomain.BodyAngularAccelerationMagnitude FrequencyDomain.BodyAngularAccelerationMagnitude
XYZ-They are used to represent the three directions X,Y,Z of the Cartesian System