Getting and Cleaning Data_project
===========

The R script contained in the file run_analysis.R goes through the following steps:
1. It reads the names of the 561 attributes
2. it reads the names of the 6 activities
3. Creates a vector containing mean or standard deviation in the name
4. The test set include the names of the features as column names. This is read into test_x.
5. test_y Contains the names of activities performed
6. test_subject containes the data about who performed the activities
7. we filter the variables containing mean and standard deviation
8. cbind merges the three sets into one
9. we follow the same steps for training dataset and create a merged dataset 
10. After this the 2 dataframes test_data and train_data  are now combined into a new dataframe test_train_data
11. Make the activity codes more understandable by changing it into a factor
12. Next the script reshapes the data frame
13. The resulting dataset is exported to the file tidy_data.