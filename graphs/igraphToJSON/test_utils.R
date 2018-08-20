#test_utils.R: tests for the 3 utilitiy functions, using igraph
library(RUnit)
library(igraph)
#----------------------------------------------------------------------------------------------------
source("utils.R")
#----------------------------------------------------------------------------------------------------
runTests <- function()
{
   test_createTestGraphs()

} # runTests
#----------------------------------------------------------------------------------------------------
test_createTestGraphs <- function()
{

   g <- createTestGraph()        # an empty graph, always a good place to start
   checkEquals(length(V(g)), 0)
   checkEquals(length(E(g)), 0)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------

