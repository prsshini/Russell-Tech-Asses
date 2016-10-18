###Common Functions to load file and calculate the spread for weather.dat and football.dat


loadfile <- function(fn,colnms)
{
  df<-scan(fn, 
           what = colnms,
           skip=1,
           strip.white = TRUE,na.strings = c("","","NA"),sep="",flush = TRUE,skipNul = TRUE,
           text,comment.char = "",fill=TRUE,blank.lines.skip = TRUE)
  
  return(as.data.frame(df))
  
}



spread <- function(df, Mx, Mn)
{
  
  tryCatch(
    
    if (is.numeric(Mx) || is.numeric(Mn))
    {
      writeLines("Argument cannot be a number")
    }
    
  )
  
  df$spread= as.numeric(df[[Mx]])-as.numeric(df[[Mn]])
  out <- df[which(df$spread == min(df$spread)), ]
  return(list(out))
}



