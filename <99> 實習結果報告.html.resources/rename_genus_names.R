#rename_genus
setwd('C:\\Users\\hsingcheng\\Desktop\\810\\renames3.0')
rename_data = list.files()

#############################################################

#collect the names of genus
all_genus_names = rename_data %>% map(function(x) names(data_list[[x]])[-1])
names(all_genus_names) = rename_data
all_genus_names = rename_data %>% map(function(table) cbind(table,all_genus_names[[table]])) %>%
  Reduce(function(...){rbind(...)},.)
colnames(all_genus_names) = c('table','genus')
all_genus_names
#output all_genus_names files and read_csv to change data structure
write.csv(all_genus_names,file = 'C:\\Users\\hsingcheng\\Desktop\\8 7\\all_genus_names.csv',row.names = F)
genus_names_df  = read_csv('C:\\Users\\hsingcheng\\Desktop\\81\\genus.names.csv',col_names = F)
############################################################

all_genus_names = read_csv('C:\\Users\\hsingcheng\\Desktop\\8 7\\all_genus_names.csv')
colnames(genus_names_df) = c('renames_genus','genus','table')

renames_data = left_join(all_genus_names,genus_names_df)
data_list2 = rename_data %>% map(.,read_csv,col_names = F)
names(data_list2) = rename_data

###########################################################
#d = function(x){
#  renames_data[x,2] == renames_data[x,3]
#}
#renames_data2 = renames_data %>% filter(!is.na(renames_genus))
############################################################

#motify the names of genus
myfunction3 = function(table_name){
  tmp = renames_data2 %>% 
          filter(table == table_name) 
  #改名還是只能用原始做法 
  for(mygenus in tmp$genus){
  data_tmp = data_list2[[table_name]][1,]
  tmp2     = tmp %>% filter(genus == mygenus)
    data_list2[[table_name]][1,][,which(data_tmp == tmp2$genus)] =  tmp2$renames_genus
  }
  return(data_list2[[table_name]])
}
data_list2[['Bergey_page1036.pdf_TABLE_187. Chara.csv']]

renames_data3 = renames_data2 %>% distinct(.,table)
data_list2 = lapply(as.vector(t(renames_data3)), myfunction3) 
names(data_list2) = rename_data

###########################################################
#去除NA的菌屬
na_data = renames_data %>% filter(is.na(renames_genus)) %>% cbind(.,par = 1:length(.$genus))
na_data = split(na_data,na_data$par)
na_data

#myfunction5 = function(na_list){
#  data_tmp = data_list2[[na_list$table]][1,]
#  tmp3     = data_list2[[na_list$table]][,-which(data_tmp == na_list$genus)]
#  data_list2[[na_list$table]] = tmp3
#  return(data_list2)
#}
#不得已
for(na_list in na_data){
  data_tmp = data_list2[[na_list$table]][1,]
  tmp3     = data_list2[[na_list$table]][,-which(data_tmp == na_list$genus)]
  data_list2[[na_list$table]] = tmp3
}
###########################################################
oupfuc = function(table){
  write_csv(data_list2[[table]],paste('C:\\Users\\hsingcheng\\Desktop\\810\\renames3.1','\\',table,sep = ''),col_names = F)
}
rename_data %>% map(.,oupfuc)
 


