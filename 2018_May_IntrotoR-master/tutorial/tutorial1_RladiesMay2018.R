# Introduction to R #
# Rladies meetup May 24th 
# questions? amsterdam@rladies.org // ilsepit@gmail.com

############################################  SHORTCUTS  ############################################  

# this is a comment. Any symbols following '#' are for humans only. The interpreter will not use them.
# if you want to comment out an entire block of code: ctrl + shift + C

# running a line of code :    ctrl + enter 
# running the entire script:  ctrl + shift + enter

# more Rstudio shortcuts: https://support.rstudio.com/hc/en-us/articles/200711853-Keyboard-Shortcuts

# ?help function will help you get an idea of how to use functions

########################################  R as calculator  #########################################  

# let's do some calculations:

# add 4 and 5
4 + 5

# divide 30 by 4


# use the modulus


# use exponentiation


############################################  Variables  #############################################  

# you can assign values to variables using '<-' or '='. 
# in R, object names are case sensitive and cannot start with a number or _
# object names can contain letters, numbers, _ and .

# assign 30 to the variable x
x = 30
x <- 30

# print out x
x = 5

# divide x by 5
x / 5

# if you assign a new value to x, the old value is lost
x = # fill out
  
# add one to x and save as x
x = x + 1

# multiply x by 5 and save as y
y = 
  
# print out x


# now, imagine you want to organize your day in the most efficient way
hours_in_a_day = 24
hours_of_sleep = #fill out

#calculate hours awake by substracting hours_of_sleep from hours_in_a_day
hours_awake = 

#print hours_awake



########################################  Types of Data  #########################################  

# Set my_numeric to be 12
my_numeric = 

# Set my_character to be "R-ladies"
my_character = 

# Set my_logical to be FALSE
my_logical = 

# check the class of a variable
?class
class(hours_in_a_day)
class(my_logical)

########################################  Vectors  #########################################  
# you can create a vector of data using the function c()
?c

# vector of weekdays
weekdays_vector = c('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday')

# vector of hours per day
?rep
hours_per_weekday_vector = rep(hours_in_a_day,7)
print(hours_per_weekday_vector)

# vector of hours of sleep per day
hours_sleep_per_weekday_vector = 


# vector of hours working per day
hours_work_per_weekday_vector = c(4,8,8,8,6,0,0)

# vector of other things you do on each weekday (e.g. sports, dinner)
hours_other_per_weekday_vector = c(...)

# total number of hours in a week
?sum
hours_per_week = sum(hours_per_weekday_vector)
print(hours_per_week)

# total number of hours worked in a week
work_hours_per_week = 

# total number of hours other in a week
other_hours_per_week = 
  
########################################  Data Frames  #########################################  
# let's combine these vectors into a data frame
?data.frame
my_week_df = data.frame(weekdays_vector,
                        hours_per_weekday_vector,
                        hours_sleep_per_weekday_vector,
                        hours_work_per_weekday_vector,
                        hours_other_per_weekday_vector)

# check out the dataframe
View(my_week_df)

# check out the first rows in your df
?head
head(my_week_df, n = 3)

# let's rename the columns
colnames(my_week_df) #before adjusted
colnames(my_week_df) = c('day','total_hours','sleep_hours','work_hours','other_hours')
colnames(my_week_df) #after adjusted
# select data to look at it
# indexing works like this : data[row,column]

# if you want to select columns
my_week_df$sleep_hours
my_week_df['sleep_hours']
my_week_df[,'sleep_hours']
my_week_df[,2]

# if you want to select rows
my_week_df[2,]
rownames(my_week_df)
my_week_df['2',]

# select only weekend rows
my_weekend_df = my_week_df[is.element(my_week_df$day, c('Saturday','Sunday')),]
my_weekend_df

# select specific columns
my_week_df[,c(1,3:4)]


# calculate free hours in a day 
# it is possible to do matrix algebra;
# e.g. subtract columns from eachother
my_week_df$free_hours = my_week_df$total_hours - my_week_df$sleep_hours - my_week_df$work_hours - my_week_df$other_hours
head(my_week_df)

# see whether you have time to see a movie on a day
movie_time = 3
my_week_df$free_hours >= movie_time

# make a new column which indicates whether you have time to see a movie
my_week_df$time_to_see_movie_bool = my_week_df$free_hours >= movie_time

# look at which day you have time to see a movie
# select only the column for day and time to see a movie
my_week_df[...]

  
# look at dataframe
View(my_week_df)

########################################  Plotting  #########################################  
plot(my_week_df$day,my_week_df$free_hours)
?plot

# correct the order of the days
my_week_df$day
class(my_week_df$day)
my_week_df$day = factor(my_week_df$day, levels = weekdays_vector, ordered = T)

# look at options in plotting
?plot

# make sure there is a line running through the week
plot(my_week_df$day,my_week_df$free_hours) 
lines(my_week_df$day,my_week_df$free_hours)

# add a title to the plot (check ?plot to find out how)


# plot the amount of hours work per day
barplot(my_week_df$work_hours)

# adjust the y-axis of the barplot to display a maximum of 24 hours


###############################  Save the file for further use  ################################

file_loc = '...' #the directory where you want to save the file
file_name = 'my_week_with_Rladies.csv' #make sure you add the '.csv'!

file_loc_and_name = paste0(file_loc, '/', file_name)

# my personal preference: add the date (and perhaps time) to the file name
Sys.Date()
?paste0
file_loc_and_name = paste0(file_loc, '/', Sys.Date(), file_name)

# save the file
write.csv(my_week_df, file_loc_and_name)

