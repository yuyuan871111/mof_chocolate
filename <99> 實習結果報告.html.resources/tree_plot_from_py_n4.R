library(reticulate)
library(data.tree)
library(treemap)
########這個不用打##################################################
os <- import("os")
os$chdir("C:\\Users\\menlen6205\\Desktop")
df <- read.csv("Species_selected(testn4).csv",colClasses =  'character') 
row.names(df) = df$SpeciesName
df = df[,-1]
df
####################################################################
source_python("Class_Tree_andTodict.py")
feature <- getFeature(df)
genus <- treePlot(df)
###########################test################################
genus1 <- c( "NAndan","NAdasdnn" ,                                                   
             "NAnn","NAsdann",                                                    
             "NAnsdan","NAsdasnn" ,                                                   
             "NAnasdn","B. carboniphilus",                                      
             "NAnasdn","NasdAnn",                                                    
             "NAnsdn","B. carboniphilus",                                      
             "B. carboniphilus","B. carboniphilus" ,                                     
             "NAsdnn","B. carboniphilus,B. barbaricus,B. badius,B. atrophaeus",
             "NAasdfsdfnn","NAtdfsddfsnn",                                                    
             "NAasdnn","B. atrophaeus",                                         
             "B. atrophaeus","B. atrophaeus",                                         
             "NAsdnn","B. barbaricus,B. badius,B. atrophaeus",                 
             "NAasdnn","B. barbaricus",                                         
             "B. barbaricus","B. barbaricus,B. badius",                               
             "B. badius","B. badius","NAnn")
###############################################################
tree_plot_n4 = function(genus, feature) {
  if (genus[16] != "NA") {
    allTree <- Node$new(genus[16])
    F1 <- allTree$AddChild(feature[1])
  } 
  if (genus[8] != "NA") {
    F1_p <- F1$AddChild(genus[8])
    SetNodeStyle(allTree$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    F2_1 <- F1_p$AddChild(feature[2])
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
  } 
  if (genus[24] != "NA") {
    F1_n <- F1$AddChild(genus[24])
    F2_2 <- F1_n$AddChild(feature[2])
  } 
  if (genus[4] != "NA") {
    F2_1p <- F2_1$AddChild(genus[4])
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    F3_1 <- F2_1p$AddChild(feature[3])
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    if (genus[2] != "NA") {
      F3_1p <- F3_1$AddChild(genus[2])
      SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
      F4_1 <- F3_1p$AddChild(feature[4])
      SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    }
    if (genus[6] != "NA") {
      F3_1n <- F3_1$AddChild(genus[6])
      F4_2 <- F3_1n$AddChild(feature[4])
    }
  } 
  if (genus[12] != "NA") {
    F2_1n <- F2_1$AddChild(genus[12])
    F3_2 <- F2_1n$AddChild(feature[3])
    if (genus[10] != "NA") {
      F3_2p <- F3_2$AddChild(genus[10])
      F4_3 <- F3_2p$AddChild(feature[4])
    }
    if (genus[14] != "NA") {
      F3_2n <- F3_2$AddChild(genus[14])
      F4_4 <- F3_2n$AddChild(feature[4])
    }
  }
  if (genus[20] != "NA") {
    F2_2p <- F2_2$AddChild(genus[20])
    F3_3 <- F2_2p$AddChild(feature[3])
    if (genus[18] != "NA") {
      F3_3p <- F3_3$AddChild(genus[18])
      F4_5 <- F3_3p$AddChild(feature[4])
    }
    if (genus[22] != "NA") {
      F3_3n <- F3_3$AddChild(genus[22])
      F4_6 <- F3_3n$AddChild(feature[4])
    }
  }
  if (genus[28] != "NA") {
    F2_2n <- F2_2$AddChild(genus[28]) 
    F3_4 <- F2_2n$AddChild(feature[3])
    if (genus[26] != "NA") {
      F3_4p <- F3_4$AddChild(genus[26])
      F4_7 <- F3_4p$AddChild(feature[4])
    }
    if (genus[30] != "NA") {
      F3_4n <- F3_4$AddChild(genus[30])
      F4_8 <- F3_4n$AddChild(feature[4])
    }
  }
  if (genus[1] != "NA") {
    F4_1p <- F4_1$AddChild(genus[1])
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }
  if (genus[3] != "NA") {
    F4_1n <- F4_1$AddChild(genus[3])
  }
  if (genus[5] != "NA") {
    F4_2p <- F4_2$AddChild(genus[5])
  }
  if (genus[7] != "NA") {
    F4_2n <- F4_2$AddChild(genus[7])
  }
  if (genus[9] != "NA") {
    F4_3p <- F4_3$AddChild(genus[9])
  }
  if (genus[11] != "NA") {
    F4_3n <- F4_3$AddChild(genus[11])
  }
  if (genus[13] != "NA") {
    F4_4p <- F4_4$AddChild(genus[1])
  }
  if (genus[15] != "NA") {
    F4_4n <- F4_4$AddChild(genus[3])
  }
  if (genus[17] != "NA") {
    F4_5p <- F4_5$AddChild(genus[17])
  }
  if (genus[19] != "NA") {
    F4_5n <- F4_5$AddChild(genus[19])
  }
  if (genus[21] != "NA") {
    F4_6p <- F4_6$AddChild(genus[21])
  }
  if (genus[23] != "NA") {
    F4_6n <- F4_6$AddChild(genus[23])
  }
  if (genus[25] != "NA") {
    F4_7p <- F4_7$AddChild(genus[25])
  }
  if (genus[27] != "NA") {
    F4_7n <- F4_7$AddChild(genus[27])
  }
  if (genus[29] != "NA") {
    F4_8p <- F4_8$AddChild(genus[29])
  }
  if (genus[31] != "NA") {
    F4_8n <- F4_8$AddChild(genus[31])
  }

  ####fill color to positive########
  if (genus[2] != "NA" & genus[6] != "NA") { 
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else {
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }
  if (genus[4] != "NA" & genus[12] != "NA") {
      SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
      SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px") 
      SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else {
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    if (genus[10] != "NA") {
      SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
      SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    }
    
  }
  if (genus[4] != "NA" & genus[12] != "NA" & genus[10] != "NA" & genus[14] != "NA"){ #genus[13]
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[2]]$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else if (genus[4] == "NA" & genus[12] == "NA" & genus[10] != "NA" & genus[14] != "NA") {
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else if (genus[4] != "NA" & genus[12] != "NA" & genus[10] == "NA" & genus[14] == "NA") {
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else { 
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }
  if (genus[8] != "NA" & genus[24] != "NA"){ 
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else {
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }
  if (genus[8] != "NA" & genus[24] != "NA" & genus[18] != "NA" & genus[22] != "NA"){ #genus[21]
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else if (genus[8] == "NA" & genus[24] == "NA" & genus[18] != "NA" & genus[22] != "NA") {
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else if (genus[8] != "NA" & genus[24] != "NA" & genus[18] == "NA" & genus[22] == "NA") {
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else {
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }
  if (genus[8] != "NA" & genus[24] != "NA" & genus[20] != "NA" & genus[28] != "NA"){ #genus[21]
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else if (genus[8] == "NA" & genus[24] == "NA" & genus[20] != "NA" & genus[28] != "NA") {
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else if (genus[8] != "NA" & genus[24] != "NA" & genus[20] == "NA" & genus[28] == "NA") {
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else {
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Blue", penwidth = "5px")
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }
  if (genus[8] != "NA" & genus[24] != "NA" & genus[20] != "NA" & genus[28] != "NA" & genus[26] != "NA" & genus[30] != "NA"){
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[2]]$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else if (genus[8] == "NA" & genus[24] == "NA" & genus[20] == "NA" & genus[28] == "NA" & genus[26] == "NA" & genus[30] == "NA") {
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else if (genus[8] != "NA" & genus[24] != "NA" & genus[20] == "NA" & genus[28] == "NA" & genus[26] == "NA" & genus[30] == "NA") {
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else if (genus[8] != "NA" & genus[24] != "NA" & genus[20] != "NA" & genus[28] != "NA" & genus[26] == "NA" & genus[30] == "NA") {
    SetNodeStyle(allTree$children[[1]]$children[[2]]$children[[1]]$children[[2]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else if (genus[8] == "NA" & genus[24] == "NA" & genus[20] != "NA" & genus[28] != "NA" & genus[26] != "NA" & genus[30] != "NA") {
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[2]]$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else if (genus[8] == "NA" & genus[24] == "NA" & genus[20] == "NA" & genus[28] == "NA" & genus[26] != "NA" & genus[30] != "NA") {
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[2]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }else {
    SetNodeStyle(allTree$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]]$children[[1]], fillcolor = "Firebrick", penwidth = "5px")
  }
  ###########################################################################
  SetGraphStyle(allTree, rankdir = "TB")
  SetEdgeStyle(allTree, arrowhead = "vee", color = "grey35", penwidth = 2)
  SetNodeStyle(allTree, style = "filled,rounded", shape = "box", fillcolor = "Blue", 
               fontname = "helvetica", tooltip = GetDefaultTooltip, penwidth = "5px")
  print(allTree)
}
tree_plot_n4(genus, feature)
