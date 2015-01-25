The following steps were taken to transform/clean up the data<br>
1.Data in the following files were read into R:<br>
	..train/X_train.txt <br>
	..test/X_test.txt <br> 
	..features.txt <br>
	..test/subject_test.txt <br>
	..train/subject_train.txt <br>
	..test/y_test.txt <br>
	..train/y_train.txt <br>
	..activity_labels.txt <br>

2.Row bindings were performed on the following set of data<br>
..i. X_train, X_test (measurements data)<br> 
..ii. y_train, y_test (activity data)<br>
..iii. subject_train, subject_test (subject data)<br>

3.Data sets (i), (ii) and (iii) from step 2 were column binded to give the complete data set.<br>

4.The complete dataset from step 3 was joined with activity_labels data to give descriptive names to activities in the complete data set.<br> Before the join, activity data in the complete data set were numbers (id). <br>

5.Only the measurement columns with standard deviation and mean (plus subject and activity columns) were selected to give a subset <br>
of complete data set, which was denoted by dataSub.<br>

6.The column names of dataSub were cleaned up - i.e. removed parentheses, dashes, and the column names converted to lower case.<br>

7.An independent tidy data set (submitted) with the average of each variable for each activity and each subject was created from dataSub,<br> 
denoted by datAvg. datAvg is in a wide format (which should be acceptable as tidy as noted in the instructions). There are <br>
180 (30 subjects x 6 activities) rows, each subject doing each of 6 activities.