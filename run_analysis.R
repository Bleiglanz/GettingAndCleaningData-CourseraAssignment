

#requires reshape2 and dplyr

library(reshape2)
library(dplyr)


#this function creates a tidy dataset for "train" or "test" data

getPart <- function(trainOrtest) {
  
  if(!(trainOrtest=="train" || trainOrtest=="test")){
    stop("argument must be either 'train' or 'test'")
  }
  
  #getting and cleaning data, note that we assume "UCI HAR Dataset" is a subdirectory of the current dir
  dirname <- "UCI HAR Dataset"
  if(!dir.exists(dirname)){
    stop("data directory not found")
  }

    #create the file names
  s_file <- paste("subject_",trainOrtest,".txt",sep="") 
  
  x_file <- paste("x_",trainOrtest,".txt",sep="")
  
  y_file <- paste("y_",trainOrtest,".txt",sep="")

  #dictionary for number<->activityname
  activity_labels <- c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")
  
  #read the list of the features
  features <- read.table(file.path(dirname,"features.txt"),header=FALSE,col.names=c("id","featurename"))
  
  #clean up the names
  features$featurenameclean = tolower(gsub("\\(|\\)|-|,","_",features$featurename))
  features$featurenameclean = gsub("_+$","",features$featurenameclean) #remove underscores at the end
  features$featurenameclean = gsub("_{2,}","_",features$featurenameclean) #remove underscores (two or more) to one
  
  #find all names with mean and std
  relevant_features = features$featurenameclean[grep("_mean_|_std_|_mean$|_std$",features$featurenameclean)]

  #reading the subjects
  s_df <- read.table(file.path(dirname,trainOrtest,s_file),header=FALSE,col.names=c("subject_id"))
  
  #reading the mesurements
  x_df <- read.table(file.path(dirname,trainOrtest,x_file),header=FALSE,col.names=features$featurenameclean)
  
  #reding the labels
  y_df <- read.table(file.path(dirname,trainOrtest,y_file),header=FALSE,col.names=c("activity_code"))
  
  #putting it all together
  temp_set <- data.frame(subject_id=s_df,activity=activity_labels[y_df$activity_code])
  
  temp_set$type = as.factor(toupper(trainOrtest)) #not sure, but put in to indicate the source "TEST" or "TRAIN"
  
  temp_set <- cbind(temp_set,x_df[,relevant_features]) 
  
  #final melt to extract the feature names to variables
  result <- melt(temp_set,id=c("subject_id","activity","type"),measure.vars=relevant_features)
}

tidy <- rbind(getPart("train"),getPart("test"))

tidy_mean <- tidy %>% group_by(subject_id,activity,variable) %>% summarise_each(funs(mean(., na.rm=TRUE)), value)

names(tidy_mean)[4]="mean_of_all_measurements"

write.table(tidy_mean,file="tidy_mean.txt",row.names = FALSE)
