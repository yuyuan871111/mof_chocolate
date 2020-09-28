# debug
########################################
# table1 <- read_csv("~/Desktop/Species_selected.csv")
# table11 <- table1 %>% as.data.frame(.)
# table11 <- table11[ ,1:6]
# table11 <- column_to_rownames(table11, var = "SpeciesName")
# tree_plot_general(table11)
########################################

# plot function
tree_plot_general <- function(df_temp){
  df_temp <- rownames_to_column(df_temp, var = "SpeciesName")
  features_names <- colnames(df_temp)[-1]
  df_output <- df_temp[1]
  species_names <- as.list(df_output)[[1]]
  df_middle <- gather(df_temp, features_names, key = "features", value = "values") %>% 
    unite(., features, values, col = "Features", sep = ":")
  
  for(i in c(1:length(species_names))){
    df_output$pathString[i] <- filter(df_middle, SpeciesName == species_names[[i]])$Features %>%
      paste(., collapse = "/") %>% paste("Features", ., species_names[[i]], sep = "/") 
  }
  tree <- as.Node(df_output)
  SetNodeStyle(tree, style = "filled,rounded", shape = "box", fillcolor = "Green", fontcolor = "black", 
               fontname = "helvetica", tooltip = GetDefaultTooltip, penwidth = "5px")
  return(grViz(DiagrammeR::generate_dot(ToDiagrammeRGraph(tree))))
}
