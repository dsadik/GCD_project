## The following 2 lines read the features and activities from the two tables
features <- read.table("./UCI HAR Dataset/features.txt",as.is=TRUE)  
activity <- read.table("./UCI HAR Dataset/activity_labels.txt")

## The following line defines a vector that contains the mean or standard deviation
msdvector <- grep("[Mm]ean|std",features$V2)

test_x <- read.table("./UCI HAR Dataset/test/X_test.txt",col.names=features$V2)	
test_y <- read.table("./UCI HAR Dataset/test/Y_test.txt")	
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
colnames(test_subject) <- "Subject"
colnames(test_y) <- "Activity"
test_x <- test_x[,msdvector]	
test_data <- cbind(test_subject,test_y,test_x)		
rm(test_x)								
rm(test_y)							
rm(test_subject)							

train_x <- read.table("./UCI HAR Dataset/train/X_train.txt",col.names=features$V2)
train_y <- read.table("./UCI HAR Dataset/train/Y_train.txt")
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt")
colnames(train_subject) <- "Subject"
colnames(train_y) <- "Activity"
train_x <- train_x[,msdvector]	
train_data <- cbind(train_subject,train_y,train_x)		
rm(train_x)								
rm(train_y)								
rm(train_subject)							

test_train_data <- rbind(test_data,train_data)					
rm(test_data)									
rm(train_data)								

test_train_data$Activity <- factor(test_train_data$Activity,levels=activity$V1,labels=activity$V2) 

tidy_data <- melt(test_train_data,id.vars=c("Activity","Subject"))
f_tidy <- dcast(tidy_data, Activity + Subject ~ variable, mean)
rm(tidy_data)

fileUrl <- "./tidy_data.csv" 
write.csv(f_tidy, fileUrl, row.names=FALSE)