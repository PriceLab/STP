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

} # runTests
#----------------------------------------------------------------------------------------------------
test_createEmptyTestGraph <- function()
{

   g <- createTestGraph()        # an empty graph, always a good place to start
   checkEquals(length(V(g)), 0)
   checkEquals(length(E(g)), 0)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_1NodeTestGraph <- function()
{

   g <- createTestGraph(1)        # 1 node graph
    checkEquals(length(V(g)), 1)
    checkEquals(length(E(g)), 0)
p
} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_15NodeTestGraph <- function()
{

   g <- createTestGraph(15)        # 5 node graph
    checkEquals(length(V(g)), 15)
    checkEquals(length(E(g)), 0)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_4Node2EdgesTestGraph <- function()
{

   g <- createTestGraph(4,2)        # 5 node graph
    checkEquals(length(V(g)), 4)
    checkEquals(length(E(g)), 2)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------


