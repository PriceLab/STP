#test_utils.R: tests for the 3 utilitiy functions, using igraph
library(RUnit)
library(igraph)
#----------------------------------------------------------------------------------------------------
source("utils.R")
#----------------------------------------------------------------------------------------------------
runTests <- function()
{
   test_createEmptyTestGraph()
   test_1NodeTestGraph()
   test_15NodeTestGraph()
   test_4Node2EdgesTestGraph()
   test_5Node2EdgesTestGraph_withAttr()

} # runTests
#----------------------------------------------------------------------------------------------------
test_createEmptyTestGraph <- function()
{
   printf("---------------test_createEmptyTestGraph")
   g <- createTestGraph()        # an empty graph, always a good place to start
   checkEquals(length(V(g)), 0)
   checkEquals(length(E(g)), 0)


} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_1NodeTestGraph <- function()
{
    printf("---------------test_1NodeTestGraphh")
    g <- createTestGraph(1)        # 1 node graph
    checkEquals(length(V(g)), 1)
    checkEquals(length(E(g)), 0)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_15NodeTestGraph <- function()
{
    printf("---------------test_15NodeTestGraph")
    g <- createTestGraph(15)        # 15 node graph
    checkEquals(length(V(g)), 15)
    checkEquals(length(E(g)), 0)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_4Node2EdgesTestGraph <- function()
{
    printf("---------------4Node2EdgesTestGraph")
    g <- createTestGraph(4,2)        # 4 node 2 edge graph
    checkEquals(length(V(g)), 4)
    checkEquals(length(E(g)), 2)
} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_5Node2EdgesTestGraph_withAttr<- function()
{
    printf("---------------5Node2EdgesTestGraph_withAttr")
    g <- createTestGraph(5,2, c("red", "white", "blue", "yellow", "black"), c("one", "two"))
    checkEquals(length(V(g)), 5)              # 5 nodes, 2edge graph. with attributes
    checkEquals(length(E(g)), 2)
} # test_createGraphs
#----------------------------------------------------------------------------------------------------


