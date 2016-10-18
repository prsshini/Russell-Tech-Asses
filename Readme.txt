Download R and Rstudio to run the R programs.

R can be downloaded at:
https://cran.r-project.org/bin/windows/base/

RStudio can be downloaded at:
https://www.rstudio.com/products/rstudio/download3/

Folder Structure:
--------------------
Main  ---> Contains all the main programs. 
Data  ---> Contails the data files
Tests ---> contains the test scripts. 
Results ---> Contains all the results from main programs and test scripts.


To Run:
--------

1. Open RStudio
2. Set ur working Dir to "Main" (From Menu, Session --> set Working Directory --> Choose Directory")
3. Run any program to find the desired results.
4. All the results will be saved in "results" folder.


Exercise 1: 
weather.R
---------
Loads the weather.dat file and calculate the temperate spread and write the result (day/s which has smallest temperature spred) to "weather.csv" file(results dir)


Exercise 2: 
Football.R
---------
Loads the football.dat file and find the name of the team who has smallest difference in "for" and "against" goals and write the result to "football.csv" file(results dir)


Exercise 3: 

Load_file.R
------------
Common function to load the file and return as a dataframe

Spread_Function.R
-----------------
Common Function to find the row which has smallest difference of given 2 columns.

Using above 2 common functions, weather.R and football.R are written as 2 smaller programs Viz., weather_with_function.R and football_with_function.R


Unite Test Cases:
----------------
test.R
------
Unit Test cases to test Spread_Function.R

Run_test.R
----------
Testsuite to run all the test cases in test.R

