########## debug
########################################
# table1 <- read_csv("~/Desktop/Species_selected.csv")
# table11 <- table1 %>% as.data.frame(.)
# table11 <- table11[ ,1:2]
# table11 <- column_to_rownames(table11, var = "SpeciesName")
# getFeature(table11) ->feature
# treePlot(table11) ->genus
# tree_plot_n1( genus,feature )
########################################
# plot function
tree_plot_n1 = function(genus, feature) {
  if (genus[2] != "NA") {
    allTree <- Node$new(genus[2])
    F1 <- allTree$AddChild(feature[1])
  if (genus[1] != "NA") {
    F1_p <- F1$AddChild(genus[1])
    SetNodeStyle(allTree$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    }
  if (genus[3] != "NA") {
    F1_n <- F1$AddChild(genus[3])
    }
  }
  SetGraphStyle(allTree, rankdir = "TB")
  SetEdgeStyle(allTree, arrowhead = "vee", color = "grey35", penwidth = 2)
  SetNodeStyle(allTree, style = "filled,rounded", shape = "box", fillcolor = "Blue", fontcolor = "white", 
               fontname = "helvetica", tooltip = GetDefaultTooltip, penwidth = "5px")
  return(grViz(DiagrammeR::generate_dot(ToDiagrammeRGraph(allTree))))
}
