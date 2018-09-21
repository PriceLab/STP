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
   test_charactersAttribute()
   test_makeRandomString()
   test_randomLogicals()
   test_randomLogicals_monteCarlo()
   test_logicalAttribute()
   test_edge_numericAttribute()
   test_edge_characterAttribute()
   test_edge_logicalAttribute()

} # runTests
#----------------------------------------------------------------------------------------------------
test_createEmptyTestGraph <- function()
{
    print("--- test_createEmptyGraph")

    g <- createTestGraph()        # an empty graph, always a good place to start

    checkEquals(length(V(g)), 0)
    checkEquals(length(E(g)), 0)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_1NodeTestGraph <- function()
{
    print("--- test_1NodeTestGraph")

    g <- createTestGraph(1)        # 1 node graph

    checkEquals(length(V(g)), 1)
    checkEquals(length(E(g)), 0)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_15NodeTestGraph <- function()
{
    print("--- test_15NodeTestGraph")

    g <- createTestGraph(15)        # 15 node graph

    checkEquals(length(V(g)), 15)
    checkEquals(length(E(g)), 0)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_4Node2EdgesTestGraph <- function()
{
    print("--- test_4Node2EdgesTestGraph")

    g <- createTestGraph(4,2)        # 4 node 2 edge graph

    checkEquals(length(V(g)), 4)
    checkEquals(length(E(g)), 2)

} # test_createGraphs
#----------------------------------------------------------------------------------------------------
test_graphWithNodeNumericAttributes <- function()
{
   print("--- test_graphWithNodeNumericAttributes")

   g <- createTestGraph(1, 0, nodeAttributes=list(age="numeric"))

   checkEquals(length(V(g)), 1)
   age.noa <- vertex_attr(g, "age")
   checkEquals(length(age.noa), 1)

   checkTrue(is.numeric(age.noa))

} # test_addNodeAttributes
#----------------------------------------------------------------------------------------------------
test_charactersAttribute <- function()
{
    print("--- test_charactersAttribute")

    g <- createTestGraph(4, 0, nodeAttributes=list(string="character"))

    checkEquals(length(V(g)), 4)
    string.noa <- vertex_attr(g, "string")
    checkEquals(length(string.noa), 4)

} # test_samplingLetters
#----------------------------------------------------------------------------------------------------
test_makeRandomString <- function()
{
    print("--- test_makeRandomString")

    requested.lengths <- c(2,6,4,1,7)
    random.strings <- makeRandomString(requested.lengths)
    checkEquals(length(random.strings), 5)
    actual.lengths <- unlist(lapply(random.strings, nchar))
    checkEquals(actual.lengths, requested.lengths)

} # test_makeRandomString
#----------------------------------------------------------------------------------------------------
test_randomLogicals <- function()
{
    print("--- test_randomLogicals")

    set.seed(29)
    random.logical <- generateRandomLogicals(50)
    true.elements <- which(random.logical)
    checkTrue(length(true.elements) >  20)
    checkTrue(length(true.elements) < 30)

} # test_randomLogicals
#----------------------------------------------------------------------------------------------------
test_randomLogicals_monteCarlo <- function()
{
    print("--- test_randomLogicals_monteCarlo")

    max.repititions <- 10
    results <- vector(mode="numeric", length= max.repititions)
    set.seed(67)

    for (i in 1:max.repititions){
        random.logical <- generateRandomLogicals(200)
        results[i] <- mean(round(runif(n=200, min=1, max=200)))
        } # for i

    average_results <- mean(results)

    checkTrue(average_results < 110)
    checkTrue(average_results > 90)

} # test_randomLogicals_montecarlo
#----------------------------------------------------------------------------------------------------
test_logicalAttribute <- function()
{
    print("--- test_logicalAttribute")

    g <- createTestGraph(4, 0, nodeAttributes=list(logical="logical"))
    checkEquals(length(V(g)), 4)
    logical.noa <- vertex_attr(g, "logical")
    checkEquals(length(logical.noa), 4)

} # test_logicalAttribute
#----------------------------------------------------------------------------------------------------
test_edge_logicalAttribute <- function()
{
    print("--- test_edge_logicalAttribute")

    g <- createTestGraph(8, 4, nodeAttributes=list(logical="logical"), edgeAttributes=list(TF="logical"))

    checkEquals(length(E(g)), 4)
    logical.edge <- edge_attr(g, "TF")
    checkEquals(length(logical.edge), 4)

    checkTrue(is.logical(logical.edge))

} # test_edge_logicalAttribute
#----------------------------------------------------------------------------------------------------
test_edge_characterAttribute <- function()
{
    print("--- test_edge_characterAttribute")

    g <- createTestGraph(8, 4, nodeAttributes=list(logical="logical"), edgeAttributes=list(letters="character"))

    checkEquals(length(E(g)), 4)
    character.edge <- edge_attr(g, "letters")
    checkEquals(length(character.edge), 4)

    checkTrue(is.character(character.edge))

} # test_edge_characterAttribute
#----------------------------------------------------------------------------------------------------
test_edge_numericAttribute <- function()
{
    print("--- test_edge_numericAttribute")

    g <- createTestGraph(8, 4, nodeAttributes=list(logical="logical"), edgeAttributes=list(numbers="numeric"))

    checkEquals(length(E(g)), 4)
    num.edge <- edge_attr(g, "numbers")
    checkEquals(length(num.edge), 4)

    checkTrue(is.numeric(num.edge))

} # test_edge_characterAttribute
#----------------------------------------------------------------------------------------------------
