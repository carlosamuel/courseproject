#README FILE

## R Script

###The R script names run_analysis.r is the script used to generate the output tidy file required, it works with the following steps:
*Read the info form the txt files for both test and train sets
*Reads the variable names from the features file
*Changes the default names (V1, V2, etc) to all the data
*Merges all the data into one single data frame
*The it selects the names of variables that refer to a mean or a std dev usign regular expressions to create a vector with the names
*After, it actually subset the already delected variables and the subject and activity
*Then it checks and changes the activity number id for a character one
* Groups the data by the required variables (subject and activity)
*Generates the output text file

