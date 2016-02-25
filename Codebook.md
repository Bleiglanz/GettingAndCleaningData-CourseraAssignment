# Overview

The script `run_analysis.R` creates two dataframes from the following source data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Small dataset: tidy_mean


| Variable      | Type                   | Comment|
| ------------- |:-------------          | :------|
| subject_id    | int                    |  An identifier of the subject who carried out the experiment  |
| activity      | Factor (6 levels)      |    label of the activity (see below) |
| variable      | Factor (66 levels)     |    The name of the measurement e.g. *tbodyacc_mean_x* (see below) |
| mean_of_all_measurements          | numeric                |    Mean val for all measurements in the full dataset:tidy (see below)  |


# Full dataset: tidy


| Variable      | Type                   | Comment|
| ------------- |:-------------          | :------|
| subject_id    | int                    |  An identifier of the subject who carried out the experiment  |
| activity      | Factor (6 levels)      |    label of the activity (see below) |
| type          | Factor (2 levels)      |    Either "TEST" odr "TRAIN" indicating the origin of the measurement  |
| variable      | Factor (66 levels)     |    The name of the measurement e.g. *tbodyacc_mean_x* see below |
| value         | numeric                |    The values in m/s^2 are normalized and bounded within [-1,1].  |

## tidy$type


The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## tidy$activity

Experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 


* WALKING 
* WALKING_UPSTAIRS 
* WALKING_DOWNSTAIRS 
* SITTING 
* STANDING 
* LAYING 

## tidy$variable

these are the allowed variable names (measurement names) for the data
as given by 

* tbodyacc_mean_x           
* tbodyacc_mean_y           
* tbodyacc_mean_z           
* tbodyacc_std_x            
* tbodyacc_std_y           
* tbodyacc_std_z            
* tgravityacc_mean_x        
* tgravityacc_mean_y        
* tgravityacc_mean_z        
* tgravityacc_std_x        
* tgravityacc_std_y         
* tgravityacc_std_z         
* tbodyaccjerk_mean_x       
* tbodyaccjerk_mean_y       
* tbodyaccjerk_mean_z      
* tbodyaccjerk_std_x        
* tbodyaccjerk_std_y        
* tbodyaccjerk_std_z        
* tbodygyro_mean_x          
* tbodygyro_mean_y         
* tbodygyro_mean_z          
* tbodygyro_std_x           
* tbodygyro_std_y           
* tbodygyro_std_z           
* tbodygyrojerk_mean_x     
* tbodygyrojerk_mean_y      
* tbodygyrojerk_mean_z      
* tbodygyrojerk_std_x       
* tbodygyrojerk_std_y       
* tbodygyrojerk_std_z      
* tbodyaccmag_mean          
* tbodyaccmag_std           
* tgravityaccmag_mean       
* tgravityaccmag_std        
* tbodyaccjerkmag_mean     
* tbodyaccjerkmag_std       
* tbodygyromag_mean         
* tbodygyromag_std          
* tbodygyrojerkmag_mean     
* tbodygyrojerkmag_std     
* fbodyacc_mean_x           
* fbodyacc_mean_y           
* fbodyacc_mean_z           
* fbodyacc_std_x            
* fbodyacc_std_y           
* fbodyacc_std_z            
* fbodyaccjerk_mean_x       
* fbodyaccjerk_mean_y       
* fbodyaccjerk_mean_z       
* fbodyaccjerk_std_x       
* fbodyaccjerk_std_y        
* fbodyaccjerk_std_z        
* fbodygyro_mean_x          
* fbodygyro_mean_y          
* fbodygyro_mean_z         
* fbodygyro_std_x           
* fbodygyro_std_y           
* fbodygyro_std_z           
* fbodyaccmag_mean          
* fbodyaccmag_std          
* fbodybodyaccjerkmag_mean  
* fbodybodyaccjerkmag_std   
* fbodybodygyromag_mean     
* fbodybodygyromag_std      
* fbodybodygyrojerkmag_mean
* fbodybodygyrojerkmag_std 
