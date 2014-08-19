
This information is for the TidyDataSet.txt dataset file. This dataset is a tidy subset dataset of the orginal dataset "Human Activity Recognition Using Smartphones Dataset" 
taken from the UCI Machine Learning Repository. The original data set had multiple different files broken into training and testing categories for 30 different subjects 
engaging in 6 different activities. Multipled data point were taken from these subjects with original file contain 561 different variables (measurements). The files were 
combined and subset so that only variables with the words "mean" or "std" (standard deviation) in their name were considered, condensing the variables to 86.  Those 
variables were averaged by subject and activity creating 180 observations of the aforementioned 86 variables. 

Descriptions of the variables can be found in the Codebook.txt
The Run_Analysis.R contains the R-Code for consdensing the original dataset into its final form, along with descriptions of each set in the process.





Files:
1) README.txt
2) Codebook.txt
3) TidyDataSet.txt
4) Run_Analysis.R

