library(reticulate)
library(data.tree)
library(treemap)
########?€™å€‹ä?ç”¨???##################################################
os <- import("os")
os$chdir("C:\\Users\\menlen6205\\Desktop")
df <- read.csv("Species_selected(n1).csv",colClasses =  'character', header = F)
as.data.frame(df) ->df
colnames(df) <- df[1,]
df = df[-1,]
row.names(df) = df$SpeciesName
df = df[ -1]
df
####################################################################
source_python("Class_Tree_andTodict.py")

to_dict(df)
feature <- getFeature(df)
getGenus(df)
genus <- treePlot(df)

tree_plot_n1 = function(genus, feature) {
  if (genus[2] != "NA") {
    allTree <- Node$new(genus[2])
    F1 <- allTree$AddChild(feature[1])
  if (genus[1] != "NA") {
    F1_p <- F1$AddChild(genus[1])
    SetNodeStyle(allTree$children[[1]]$children[[1]], fillcolor = "Red2", penwidth = "5px")
    }
  if (genus[3] != "NA") {
    F1_n <- F1$AddChild(genus[3])
    }
  }
  SetGraphStyle(allTree, rankdir = "TB")
  SetEdgeStyle(allTree, arrowhead = "vee", color = "grey35", penwidth = 2)
  SetNodeStyle(allTree, style = "filled,rounded", shape = "box", fillcolor = "navyblue", fontcolor = "white", 
               fontname = "helvetica", tooltip = GetDefaultTooltip, penwidth = "5px")
  plot(allTree)
}
tree_plot_n1(genus, feature)
