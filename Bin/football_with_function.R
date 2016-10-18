#Clear the workspace.
rm(list=ls())

#Source the Global function
source("common_functions.R")


filename <- "data/football.dat"
colnms <- list(sr.no="", Team="", P="", W="", L="", D="", fr="",dummy="", ag="",Pts="")

##CAll the function to load the file and save in a data frame 
footballdf <- loadfile(filename,colnms)

#Data Cleanup - Remove all rows which has NA
footballdf <- na.omit(footballdf)

##Call the function to calculate the spread
out <- spread(footballdf, "fr", "ag")

#Convert the output into a data frame
df2= as.data.frame(out)

#Write the result into a file
write.table(df2, file="results/football_with_function.csv")

