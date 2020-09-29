## debug
########################################
# table1 <- read_csv("~/Desktop/Species_selected.csv")
# table11 <- table1 %>% as.data.frame(.)
# table11 <- table11[ ,1:3]
# table11 <- column_to_rownames(table11, var = "SpeciesName")
# 
# getFeature(table11) ->feature
# treePlot(table11) ->genus
# tree_plot_n2(genus, feature)
########################################
# plot function
tree_plot_n2 = function(genus, feature) {
  if (genus[4] != "NA") {
    allTree <- Node$new(genus[4])
    F1 <- allTree$AddChild(feature[1])
  } 
  if (genus[2] != "NA") {
    F1_p <- F1$AddChild(genus[2])
    SetNodeStyle(allTree$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    F2_1 <- F1_p$AddChild(feature[2])
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    if (genus[1] != "NA") {
      F2_1p <- F2_1$AddChild(genus[1])
      SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    }
    if (genus[3] != "NA") {
      F2_1n <- F2_1$AddChild(genus[3])
      }
  }
  if (genus[6] != "NA") {
    F1_n <- F1$AddChild(genus[6]) 
    F2_2 <- F1_n$AddChild(feature[2])
    if (genus[5] != "NA") {
      F2_2p <- F2_2$AddChild(genus[5])}
    if (genus[7] != "NA") {
      F2_2n <- F2_2$AddChild(genus[7])}
  }
  if (genus[2] != "NA" & genus[6] != "NA"){
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else {
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    }
  SetGraphStyle(allTree, rankdir = "TB")
  SetEdgeStyle(allTree, arrowhead = "vee", color = "grey35", penwidth = 2)
  SetNodeStyle(allTree, style = "filled,rounded", shape = "box", fillcolor = "Blue", 
               fontname = "helvetica", tooltip = GetDefaultTooltip, penwidth = "5px")
  plot(allTree)
  }
