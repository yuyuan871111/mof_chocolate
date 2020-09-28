library(reticulate)
library(data.tree)
library(treemap)
########?€™å€‹ä?ç”¨???##################################################
os <- import("os")
os$chdir("C:\\Users\\menlen6205\\Desktop")
df <- read.csv("Species_selected(n3).csv",colClasses =  'character') 
row.names(df) = df$SpeciesName
df = df[,-1]
df
####################################################################
source_python("Class_Tree_andTodict.py")

to_dict(df)
feature <- getFeature(df)
getGenus(df)
genus <- treePlot(df)
#########test##########
genus1 <- c( "NA00","NA00",                                                    
             "jdowijdo","B. carboniphilus",                                     
              "B. carboniphilus", "B. carboniphilus",                                      
             "NA00","B. carboniphilus,B. barbaricus,B. badius,B. atrophaeus",
              "B. atrophaeus","B. atrophaeus",                                         
              "NA00","B. barbaricus,B. badius,B. atrophaeus",                 
              "B. badius","B. barbaricus,B. badius","B. barbaricus")    
###################
tree_plot_n3 = function(genus, feature) {
  if (genus[8] != "NA") {
    allTree <- Node$new(genus[8])
    F1 <- allTree$AddChild(feature[1])
  } 
  if (genus[4] != "NA") {
    F1_p <- F1$AddChild(genus[4])
    SetNodeStyle(allTree$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    F2_1 <- F1_p$AddChild(feature[2])
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
  } 
  if (genus[12] != "NA") {
    F1_n <- F1$AddChild(genus[12])
    F2_2 <- F1_n$AddChild(feature[2])
  } 
  if (genus[2] != "NA") {
    F2_1p <- F2_1$AddChild(genus[2])
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    F3_1 <- F2_1p$AddChild(feature[3])
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    if (genus[1] != "NA") {
      F3_1p <- F3_1$AddChild(genus[1])
      SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    }
    if (genus[3] != "NA") {
      F3_1n <- F3_1$AddChild(genus[3])
    }
  } 
  if (genus[6] != "NA") {
    F2_1n <- F2_1$AddChild(genus[6])
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    F3_2 <- F2_1n$AddChild(feature[3])
    if (genus[5] != "NA") {
      F3_2p <- F3_2$AddChild(genus[5])
    }
    if (genus[7] != "NA") {
      F3_2n <- F3_2$AddChild(genus[7])
    }
  }
  if (genus[10] != "NA") {
    F2_2p <- F2_2$AddChild(genus[10])
    F3_3 <- F2_2p$AddChild(feature[3])
    if (genus[9] != "NA") {
      F3_3p <- F3_3$AddChild(genus[9])
      SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    }
    if (genus[11] != "NA") {
      F3_3n <- F3_3$AddChild(genus[11])
    }
  }
  if (genus[14] != "NA") {
    F2_2n <- F2_2$AddChild(genus[14]) 
    F3_4 <- F2_2n$AddChild(feature[3])
    if (genus[13] != "NA") {
      F3_4p <- F3_4$AddChild(genus[13])
    }
    if (genus[15] != "NA") {
      F3_4n <- F3_4$AddChild(genus[15])
    }
    if (genus[2] != "NA" & genus[6] != "NA"){
      SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    }else {
      SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    }
    if (genus[4] != "NA" & genus[12] != "NA"){
      SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
      SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    }else{
      SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
      SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    }
    if (genus[10] != "NA" & genus[14] != "NA"){
      SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    }else {
      SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    }
  }
  SetGraphStyle(allTree, rankdir = "TB")
  SetEdgeStyle(allTree, arrowhead = "vee", color = "grey35", penwidth = 2)
  SetNodeStyle(allTree, style = "filled,rounded", shape = "box", fillcolor = "Blue", 
               fontname = "helvetica", tooltip = GetDefaultTooltip, penwidth = "5px")
  plot(allTree)
}
tree_plot_n3(genus1, feature)

