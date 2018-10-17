# In this assignment you will learn how to load the and process data files in R.
# All comments that starts with ? invite you to write a piece of code.

# This is not the best practice, we use it only for this tutorial!
# Input the working directory to the folder with the R file and data files
current_dir = "..."
setwd(current_dir)

# Read a very tiny csv file and check the output
filename = "tiny_file.csv"
tiny_file = read.table(file.path(current_dir, filename, fsep="/"))

# ? Check what is inside the variable tiny_file

# ? The file reading didn't do well. Let's fix it! Check ?read.table
tiny_file = ...

# ? Confirm the reading was fine this time

# Now we move to a more complicated example: titanic dataset. Let's try to play with it!  
# More information can be found here: https://www.kaggle.com/c/titanic 
titanic_filename = "titanic_train_ch.txt"
titanic_df = read.table(file.path(current_dir, titanic_filename, fsep="/"))

# Most of the time data files are messy and we need to figure out how to handle it.
# ? Fix reading error by checking out the file header and separator used in this dataset. You also probably need to change the file itself as well.
?read.table
titanic_df = ...

# ? Check the first 20 values of the data frame 
# Tip: head(...)

# ? The file is actually a csv file, for which it is better to use read.csv function. 
# Try it with just filename as a parameter in read.csv and compare the output with read.table
titanic_df = ...

# ? Check the dimensions of the data frame 
# Tip: dim(..) 

# Checking the classes of the columns. You don't need to understand apply function for now, just run this line. 
# If you are interested, you can check what apply function does by running ?apply
apply(titanic_df, 2, class)
# As you can see, all of the column have character class, even though you expect e.g. the Age column to be a number (numeric class in R).

# ? Specify column name for the 3rd column if you haven't change it in the file beforehand.
# Tip: colnames(...)[1] = "..."

# ? There are two very informative functions which you can use for data frames: summary and str. Try it out!

# Table function allows to build a contingency table for several variables. 
# This may sounds vague, but it's actually easy. 
# Try to run the line below which will build a table with Survived vs Sex counts.
table(titanic_df$Sex, titanic_df$Survived)

# ? Build the table for Sex vs Embarked

# Check out how plot function handles different data types
plot(as.numeric(titanic_df$Fare), xlab='passenger', ylab='fare')
# ? use plot function for Sex column and compare to the previous plot
# ? use plot function for one of the tables we created before and compare to the previous plots

# ? Build a histogram for column Age
# Tip: use function hist() 

# Selecting only females from the data frame
female = titanic_df[titanic_df$Sex == 'female', ]

# ? Select only males 

# ? Build a boxplot for age of the passengers, separately for males and females
# Tip: use function boxplot()

# ? Calculate the number of survivors 
# Tip: sum(...)

# ? Calculate average age of all passengersu using mean() function.
# Tip: mean(). Keep in mind that you need to handle empty values somehow.

# ? Read "titanic_test.csv" and merge it with the titanic_df data set you already have, using function merge().
# As you will figure out soon, the columns in these two data files are different. 
# Tip: you can exclude one column from the data frame by: titanic_df[, !names(titanic_df) %in% c(column_to_exclude)]
titanic_test_set = ...
titanic_df_full= rbind(..., titanic_test_set)

# ? Calculate the correlation coefficient between Age and Fare in the new (full) data set.
# Tip: cor(). Keep in mind that you still need to handle the missing data. 
# Also check the data type expected by cor function. 
# To change the data type, you can use function as.numeric() for the whole column.

# ? Build a box plot with Age on y axis and Survived and Sex variables (combined) on x axis for titanic_df dataset.
# Tip: use a formula notation with ~ in a boxplot function
boxplot(...~... + ...)

# As you spotted, we are missing the column Survived in the 2nd file. 
# Full information on survived passengers can be found in titanic_survived.csv. 
# Read the file and use merge function to merge the new data with the previous data frame
titanic_survivors = ...
titanic_df_full_surv = merge(titanic_df_full, titanic_survivors, by="PassengerId")

# ? Check if your previous boxplot has changed with the new portion of data.
boxplot(...~... + ...)

# Make a final conclusion how age and sex influenced the sirvivability of the passengers in titanic wreck.