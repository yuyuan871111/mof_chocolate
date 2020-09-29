##################################
### merge the selected genera data 
genus_tidy_data = function(genera){
  # get data (list)
  data_tmp = mygenus[genera]
  # add new column "genus name" avoid 'full_join' going wrong
  name_func = function(genus_name){
    data_tmp[[genus_name]] %>% mutate("Genus name" = genus_name)
  }
  data_tmp = genera %>% map(.,name_func)
  names(data_tmp) = genera
  # merge data and put "genus name" to first column
  data_tmp = data_tmp %>%
    Reduce(function(...){full_join(...)},.) %>%
    select_if(., function(col) sum(!is.na(col)) != 1 ) %>%
    column_to_rownames(., var = "Genus name") %>%
    rownames_to_column(., var = "Genus name")
}

##################################
### filter the selected species data and clean data
# filter function
filter_species <- function(each_species){
  each_table <- species_data %>% filter(., SpeciesName == each_species)
}
# form a wanted data table
species_tidy_data <- function(species){
  # filter (list)
  data_temp <- species %>% map(., filter_species ) %>% 
    # merge data
    Reduce(function(...){bind_rows(...)},.) %>% 
    # get rid of 'NA'
    select_if(., function(col) sum(!is.na(col)) == length(species)) %>% 
    # get rid of the value existing words but not loss species name
    select_if(., function(col) sum(grepl("\\w", col)) == 0 || sum(grepl("\\w", col)) == length(species) ) %>% 
    # get rid of the features existing same values between selected features 
    select_if(., function(col) sum(grepl("\\+", col)) != length(species) && sum(grepl("\\-", col)) != length(species) )
}





