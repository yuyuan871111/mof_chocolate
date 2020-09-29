#### library
###################################
library(shiny)
library(DiagrammeR)
library(reticulate)
library(data.tree)
library(treemap)
library(tidyverse)
library(jsonlite)
library(magrittr)
###################################
#### source code
###################################
## set working directory for plot data (carefully to set working directory)
#setwd('<default path>')

## slider-type data input and plot functions setting (carefully to set working directory)
source("code/plot.R")
## Tidydata for decision Tree
source("code/tidydata_for_deciTree.R")
## data transformation in python
source_python("code/Class_Tree_andTodict.py")
## Decision tree function
source("code/tree_plot_general.R")
source("code/tree_plot_from_py_n1.R")
source("code/tree_plot_from_py_n2.R")
source("code/tree_plot_from_py_n3.R")
source("code/tree_plot_from_py_n4.R")

###################################
## prepare "genus to functions data" 
###################################
mygenus <- jsonlite::fromJSON("data/mygenus.JSON")
mygenus_names <- sort(names(mygenus))

##################################
## prepare the data of "functions"
##################################
# double radio-type data
functions_data_radio <- jsonlite::fromJSON("data/funcs_branched(radio_button).JSON")
functions_name_radio <- names(functions_data_radio)
# radio-type data
functions_data_radio_nobranched <- jsonlite::fromJSON("data/funcs_no_branched(radio_button).JSON")
functions_name_radio_nobranched <- names(functions_data_radio_nobranched)
# select-type
functions_data_select <- jsonlite::fromJSON("data/funcs_select.JSON")
functions_name_select <- names(functions_data_select)

## set the type of the data
Functiontype <- c(rep("radio_radio", length(functions_name_radio)), 
                  rep("radio", length(functions_name_radio_nobranched)), 
                  rep("select", length(functions_name_select)), 
                  rep("slider", length(functions_name_slider)))

## merge data/name to one list
functions_data <- c(functions_data_radio, functions_data_radio_nobranched, functions_data_select)
functions_name <- c(functions_name_radio, functions_name_radio_nobranched, 
                    functions_name_select, functions_name_slider)

## name list between Function and type
names(Functiontype) <- c(functions_name)
##################################
## prepare species data
##################################
species_data <- t(read.csv("data/TABLE3.csv", header = F))
# rename the species col (including colname)
species_data[ ,1] <- species_data[ ,1] %>% sub("\\d*\\.\\s", "",.) %>% sub("\\_.*$", "",.) %>% 
  sub("Characteristic", "SpeciesName",.)
# clean data to get rid of notes
species_data[-1,] <- species_data[-1,] %>% sub("\\(", "",.) %>% sub(".\\)", "",.) %>% sub("\\_.$", "",.)
# save the species name
species_names <- species_data[-1,1]
names(species_names) <- NULL
# write the colname and save as tibble-type table
colnames(species_data) <- species_data[1, ]
species_data <- as_tibble(species_data[-1, ])

##################################
## delete useless data
rm(list = "functions_data_radio", "functions_data_radio_nobranched", "functions_data_select",
   "functions_name_radio", "functions_name_radio_nobranched", "functions_name_select", 
   "functions_name_slider", "plot_csv")

