#Clear the workspace.
rm(list=ls())


#Read the input file and store as a data frame and remove the blank row
football<-scan("data/football.dat" , 
        what = list(sr.no="", Team="", P="", W="", L="", D="", fr="",dummy="", ag="",Pts=""),
        skip=1,
        strip.white = TRUE,na.strings = c("","","NA"),sep="",flush = TRUE,skipNul = TRUE,
        text,comment.char = "",fill=TRUE,blank.lines.skip = TRUE)


footballdf<-as.data.frame(football)

#Data Cleanup - Remove all rows which has NA
footballdf <- na.omit(footballdf)


##Find the smallest difference between "for and "against" goals and the respective team.
footballdf$spread <- as.numeric(footballdf$fr)-as.numeric(footballdf$ag)
out <- footballdf[which(footballdf$spread == min(footballdf$spread)), ]

#Conver the output into a data frame
df2= as.data.frame(out)

#Write the result into a file
write.table(df2, file="results/football.csv")

