# pre-deal with the data of genera
setwd("C:\\Users\\menlen6205\\Desktop\\genus_files")
thefilename <- list.files()
gname1 <- sub(".csv", "", thefilename) #create genus name
library(jsonlite)

mygenus_data_RdtoJs <- lapply(thefilename, function(x){
  df1 <- read.table(x, sep = ",", encoding = "utf-8", stringsAsFactors = F)
  names(df1) <- df1[1,]
  return(df1[-1, ]) #read 153 genus data(csv) as dataftame list
})
names(mygenus_data_RdtoJs) <- gname1 #name dataframe in list
mygenus_data_JSON <- jsonlite::toJSON(mygenus_data_RdtoJs, pretty = T) #to json
write(mygenus_data_JSON, "mygenus.JSON") # output file
