library(reticulate)
library(data.tree)
library(treemap)
########test##################################################
os <- import("os")
os$chdir("C:\\Users\\menlen6205\\Desktop")
df <- read.csv("Species_selected(n2).csv",colClasses =  'character') 
row.names(df) = df$SpeciesName
df = df[,-1]
df
####################################################################
source_python("Class_Tree_andTodict.py")

to_dict(df)
feature <- getFeature(df)
getGenus(df)
genus <- treePlot(df)
###test######
genus1 <- c("NA","B. carboniphilus,B. badius,B. atrophaeus","B. carboniphilus,B. badius",
            "B. carboniphilus,B. barbaricus,B. badius,B. atrophaeus","NA","B. barbaricus",                                         
            "B. barbaricus")
##############

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
    
tree_plot_n2(genus, feature)
