library(plyr)
library(dplyr)
library(purrr)
library(magrittr)
library(readr)
library(ggplot2)
library(tidyr)


#################################################
# 載入重新命名的資料
setwd('C:\\Users\\hsingcheng\\Desktop\\81\\genus_data-new')
rename_data = list.files()
rename_data

###############################################

# 儲存資料
data_list = rename_data %>% map(.,read_csv)
#改名的函數
f = function(mytable){
  names(mytable)[1] = "Characteristic"
  return(mytable)
}
data_list %<>% lapply(.,f) 
names(data_list) = rename_data

#################################################

charac_reference = data_list %>% map(function(x) x[,1])
#集合名稱用的函數
cbind_names = function(table_names){
  cbind(charac_reference[[table_names]],table_names)
}

charac_reference = rename_data %>% map(cbind_names) %>% Reduce(function(...){bind_rows(...)},.)
charac_reference[,2]
as.data.frame(charac_reference,colClass = 'character')
names(charac_reference) = c('charac','table')
write.csv(charac_reference,file = 'C:\\Users\\hsingcheng\\Desktop\\8 6\\charac_reference.csv',row.names = F)
#################################################

charac_names = charac_reference %>% distinct(.,charac)
# 消弭重複值得到未重複之功能名稱。
charac_names = as.vector(t(charac_names))

#################################################
#合併各個檔案 data_df 表示儲存特徵的df
myfunction1 = function(character){
  tables = 
    charac_reference %>%
    filter(charac == character) %>% pull('table')
  
  myfunction2 = function(table_parmeter){
    tmp = data_list[[table_parmeter]] %>% filter(Characteristic == character)
    return(tmp)
  }
  tmp2 = as.vector(tables) %>% map(myfunction2)  
  tmp2 = Reduce(function(...){left_join(...)},tmp2)
  return(tmp2)
}
data_df = charac_names %>% map(myfunction1)
names(data_df) = charac_names

oupfunction = function(charac_names){
  write.csv(data_df[[charac_names]],paste('C:\\Users\\hsingcheng\\Desktop\\8 6\\charac_to_genus\\',
                                          charac_names,'.csv',sep = ''))
}

charac_names %>% map(oupfunction)
#################################################
colnames(data_df[['Metabolism']])[-1]
data_for_joint = data_df[['Metabolism']] %>% gather(key = genus,value = measure,colnames(data_df[['Metabolism']])[-1])
data_for_joint %>% 



