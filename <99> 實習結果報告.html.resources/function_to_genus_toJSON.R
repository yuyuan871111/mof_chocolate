###function to genus(branched)###
library(jsonlite)
mygenus <- jsonlite::fromJSON("mygenus.JSON")
mygenus_names <- sort(names(mygenus))

functions_data_filename <- list.files("C:\\Users\\menlen6205\\Desktop\\branched\\brached(radio_botton)",".JSON")
functions_data_filepath <- paste("C:\\Users\\menlen6205\\Desktop\\branched\\brached(radio_botton)", functions_data_filename, sep = "\\")
functions_name <- sub(".JSON", "", functions_data_filename)
functions_data <- lapply(functions_data_filepath, function(x){
jsonlite::fromJSON
    gsub("varable", "variable", paste("[",jsonlite::fromJSON(x),"]"))
})
names(functions_data) <- functions_name
write(toJSON(functions_data, pretty = T), file = "C:\\Users\\menlen6205\\Desktop\\branched\\brached(radio_botton)\\branched(radio_botton).JSON")

###function to genus(no branched and select)###
library(jsonlite)
functions_data_filename <- list.files("C:\\Users\\menlen6205\\Desktop\\select\\JSON",".JSON")
functions_data_filepath <- paste("C:\\Users\\menlen6205\\Desktop\\select\\JSON", functions_data_filename, sep = "\\")
functions_name <- sub(".JSON", "", functions_data_filename)
functions_data <- sapply(functions_data_filepath, function(x){jsonlite::fromJSON(paste("[",jsonlite::fromJSON(x),"]"))})
names(functions_data) <- functions_name

write(toJSON(functions_data, pretty = T), file = "C:\\Users\\menlen6205\\Desktop\\select\\JSON\\select.JSON")