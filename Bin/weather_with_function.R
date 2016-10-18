#Clear the workspace
rm(list=ls())

#Source the Global function
source("bin/common_functions.R")

filename= "data/weather.dat"
colnms <- list(Dy="",MxT="", MnT="", AvT="", HDDay="", AvDP="", hrp="", TPcpn="", WxType="", PDir="", AvSp="", Dir="", MxS="", SkyC="", MxR="", MnR="", AvSLP="")

##CAll the function to load the file and save in a data frame 
weatherdf=loadfile(filename,colnms)

## Data Clean p - REmove special characters if any from the data.
weatherdf[] <- lapply(weatherdf,as.character)
weatherdf[] <- sapply(weatherdf[], function(col) {
  as.integer(sub("[*]$", "", col))
})
weatherdf[,2] <- as.numeric(as.character(weatherdf[,2]))
weatherdf[,3] <- as.numeric(as.character(weatherdf[,3]))

##CAll the function to find the Temp Spread
out<- spread(weatherdf,"MxT","MnT")


#Conver the output into a data frame
df3= as.data.frame(out)

#Write the result into a file
write.table(df3, file="results/weather_with_function.csv")


