#Clear the workspace.
rm(list=ls())


#Read the input file and store as a data frame
weather<-scan("data/weather.dat",
        what = list(Dy="",MxT="", MnT="", AvT="", HDDay="", AvDP="", hrp="", TPcpn="", WxType="", PDir="", AvSp="", Dir="", MxS="", SkyC="", MxR="", MnR="", AvSLP=""),
        skip=1,
        strip.white = TRUE,na.strings = c("","","NA"),sep="",flush = TRUE,skipNul = TRUE,
        text,comment.char = "",fill=TRUE,blank.lines.skip = TRUE)

weatherdf=as.data.frame(weather)

## Data Clean p - REmove special characters if any from the data.
weatherdf[] <- lapply(weatherdf,as.character)
weatherdf[] <- sapply(weatherdf[], function(col) {
  as.integer(sub("[*]$", "", col))
})
weatherdf[,2] <- as.numeric(as.character(weatherdf[,2]))
weatherdf[,3] <- as.numeric(as.character(weatherdf[,3]))




#Find the row which has smallest Temp Spread    
weatherdf$spread= as.numeric(weatherdf$MxT)-as.numeric(weatherdf$MnT)
out <- weatherdf[which(weatherdf$spread == min(weatherdf$spread)), ]


#Conver the output into a data frame
df3= as.data.frame(out)

#Write the result into a file
write.table(df3, file="results/weather.csv")


