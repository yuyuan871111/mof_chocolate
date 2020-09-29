import pandas
def to_dict(df):
    featureN = list(df.columns)
    newdict = {}
    newlist = []
    for fName in featureN:
        X_for_P = []
        Y_for_N = []
        for name in list(df.index):
            newdict2 = {}
            if type(df.loc[name][fName]) == str:                                        
                if df.loc[name][fName][0] == "+":                                           
                    X_for_P.append(name)
                if df.loc[name][fName][0] == "-":                                           
                    Y_for_N.append(name)
            newdict2 = {fName:{"+":X_for_P, "-":Y_for_N}}
        newlist.append(newdict2)
    return newlist

def getFeature(df):
    featureName = list(df.columns)
    return featureName

def getGenus(df):
    Genus_name = list(df.index)
    return Genus_name
	
from collections import deque
class TreeNode :
    data  = None
    left  = None
    right = None
    def __init__(self,data, left = None ,right = None) :
        self.data  = data
        self.left  = left
        self.right = right

class Tree :
    overallRoot = None
    datalist    = None
    def __init__(self,genera,fig):
        self.overallRoot = TreeNode(genera)
        self.datalist    = list()
        parents = [self.overallRoot]
        child3 = list()
        count  = 0
        while True:
            if count  == len(fig):
                break
            child1  = list()
            child2  = list()
            tmp1 = parents.pop()
            n    = tmp1
            tmp2 = deque(tmp1.data)
            while len(tmp2) != 0:
                tmp = tmp2.popleft()
                if tmp in fig[count]['+'] :
                    child1.append(tmp)
                else:
                    child2.append(tmp)
            n.left  = TreeNode(child1)
            n.right = TreeNode(child2)
            child3.append(n.right)
            child3.append(n.left)
            if len(parents) != 0 :
                continue
            else:
                count+=1
                parents,child3 = child3,parents
				
    def printQ(self,root):
        if (root != None):
            self.printQ(root.left)
            if len(root.data) != 0:
                self.datalist.append(','.join(root.data))
            else:
                self.datalist.append('NA')
            self.printQ(root.right)
			
    def printT(self):
        self.printQ(self.overallRoot)
    
def treePlot(df):
	dict_list = to_dict(df)
	dict_newList = []
	for i in list(range(len(getFeature(df)))):
		dict_newList.append(dict_list[i][getFeature(df)[i]])
	x = Tree(getGenus(df),dict_newList)
	x.printT()
	return x.datalist