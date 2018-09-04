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
   test_graphWithNodeNumericAttributes()
   test_makeRandom5String()
   test_makeRandom150String()
   test_charactersAttribute()

} # runTests
#----------------------------------------------------------------------------------------------------
test_createEmptyTestGraph <- function()
{
    printf("--- test_createEmptyGraph")

    g <- createTestGraph()        # an empty graph, always a good place to start

    checkEquals(length(V(g)), 0)
    checkEquals(length(E(g)), 0)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_1NodeTestGraph <- function()
{
    printf("--- test_1NodeTestGraph")

    g <- createTestGraph(1)        # 1 node graph

    checkEquals(length(V(g)), 1)
    checkEquals(length(E(g)), 0)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_15NodeTestGraph <- function()
{
    printf("--- test_15NodeTestGraph")

    g <- createTestGraph(15)        # 15 node graph

    checkEquals(length(V(g)), 15)
    checkEquals(length(E(g)), 0)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_4Node2EdgesTestGraph <- function()
{
    printf("--- test_4Node2EdgesTestGraph")

    g <- createTestGraph(4,2)        # 4 node 2 edge graph

    checkEquals(length(V(g)), 4)
    checkEquals(length(E(g)), 2)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_graphWithNodeNumericAttributes <- function()
{
   printf("--- test_graphWithNodeNumericAttributes")

   g <- createTestGraph(1, 0, nodeAttributes=list(age="numeric"))

   checkEquals(length(V(g)), 1)
   age.noa <- vertex_attr(g, "age")
   checkEquals(length(age.noa), 1)

   checkTrue(is.numeric(age.noa))

} # test_addNodeAttributes
#----------------------------------------------------------------------------------------------------
test_makeRandom5String <- function()
{
    printf("--- test_makeRandom5String")

    random.string <- makeRandomString(5) #test 5 characters
    checkEquals(nchar(random.string), 5)
}
#----------------------------------------------------------------------------------------------------
test_makeRandom150String <- function()
{
    printf("--- test_makeRandom150String")

    random.string_2 <- makeRandomString(150) #test 150 characters
    checkEquals(nchar(random.string_2), 150)
}
#----------------------------------------------------------------------------------------------------
test_charactersAttribute <- function()
{
    printf("--- test_charactersAttribute")

    g <- createTestGraph(4, 0, nodeAttributes=list(string="character"))

    checkEquals(length(V(g)), 4)
    string.noa <- vertex_attr(g, "string")
    checkEquals(length(string.noa), 4)

} #test_samplingLetters


