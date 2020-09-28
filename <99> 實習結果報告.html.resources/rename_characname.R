##############################
rename_data = read.csv('C:\\Users\\hsingcheng\\Desktop\\88\\charac_reference2.ex.CSV',header = T,colClass = 'character')   #重新命名的資料
setwd('C:\\Users\\hsingcheng\\Desktop\\81\\genus_data-new')
mycsv      = list.files()
mycsv[5]
############重新命名特徵#################

myfunction_rename2.0 = function(myfile){
  data = read.csv(myfile,header = T,colClass = 'character')
  tmp  = rename_data[rename_data[,1] == myfile,]       
  
  myfunction2 = function(charac_names){
    data[,1][data[,1] == charac_names] = tmp[tmp[,2] == charac_names,6]
  }
  data[,1] = sapply(data[,1],myfunction2)
  write.csv(data,file = paste('C:\\Users\\hsingcheng\\Desktop\\88\\renames.2.0\\',myfile,sep = ''),row.names = F)
  return(data)
}

#############################
lapply(mycsv,myfunction_rename2.0)
#############################




##########debug_code######################
mycsv[24]
rename_data %>% filter(.,table == 'Bergey_page1230.pdf_TABLE 241.csv')
data = read.csv('Bergey_page1230.pdf_TABLE 241.csv',header = T,colClass = 'character')
tmp  = rename_data %>% filter(table == 'Bergey_page1230.pdf_TABLE 241.csv') 

#################################
data[,1][data[,1] == 'Cell dimensions(um)'] 
tmp[tmp[,2] == 'Cell dimensions(um)',6]
data[,1]
###################################
myfunction2 = function(charac_names){
  data[,1][data[,1] == charac_names] = tmp[tmp[,2] == charac_names,6]
}
sapply(data[,1],myfunction2)
