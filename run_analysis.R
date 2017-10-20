# Getting and Cleaning Data Course Project
# Peer-graded Assignment

# start with reading the features table, used below to assign names to Training and Test data
features  <- read.table("features.txt")   
 
# Training Data 

print ("Loading Training Data")  

# build a table with training data (t_train), combining columns from various Training data files 
X_train <- read.table("train/X_train.txt")   
# Appropriately labels the Training data set with descriptive variable names.
names(X_train)<- features[,2]
y_train <- read.table("train/y_train.txt", col.names = c("activity_code"))   
subject_train <- read.table("train/subject_train.txt", col.names = c("subject_code"))   
t_train  <- cbind(subject_train, y_train, X_train)

# Test Data 

print ("Loading Test Data")  

# build a table with test data (t_test), combining columns from various Test data files  
X_test <- read.table("test/X_test.txt")   
# Appropriately labels the Test data set with descriptive variable names.
names(X_test)<- features[,2]
y_test <- read.table("test/y_test.txt", col.names = c("activity_code"))   
subject_test <- read.table("test/subject_test.txt", col.names = c("subject_code"))   
t_test  <- cbind(subject_test, y_test, X_test)

print ("Merging Data")  

# Merge (rbind) the training and the test sets to create one data set.
t <- rbind(t_train, t_test)

# Extracts only the measurements on the mean and standard deviation for each measurement. 
# as well as the activity and subject_code columns
t1 <- t[, grepl("mean\\(\\)|std\\(\\)|activity|subject_code" , names(t))]
 
# Uses descriptive activity names to name the activities in the data set
# mapping activity_code to activity_labels is provided by table in file activity_labels.txt
activity_labels  <- read.table("activity_labels.txt", col.names = c("activity_code", "activity"))   
t2 <- merge(t1, activity_labels, by.x = "activity_code",  by.y = "activity_code" )
 
# remove activity_code, no longer needed
t3 <- t2[, names(t2) != "activity_code"]

print ("Calculate Averages by subject and activity")  

# group by subject_code and activity
t4 <- t3 %>% group_by(subject_code, activity)

# compute mean on these groups
tidy_data <- t4 %>% summarise_all(mean)

fname <- "tidy_data.txt"
print(paste0("Save result to ASCII file:  ", fname))
write.table(tidy_data,  file= fname, row.name=FALSE)

 
