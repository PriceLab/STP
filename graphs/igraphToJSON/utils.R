# utils.R:  utilitiy functions using igraph
#------------------------------------------------------------------------------------------------------------------------
# retun an igraph instance with the specified number of nodes, edges and attributes
# name nodes in the style "node1", "node2", ...
# name edges similarly: "edge1", "edge2"
# create edges by randomly choosing pairs of nodes to connect:
#   nodes <- paste("node", 1:5, sep="")
#   nodePairs <- nodes[sample(length(nodes), 2)]
#   nodeAttribues and edgeAttributes will each be a simple list of named attributes to create,
#     each with a random value, for instance
#          edge.attribute.1 <- 100 * runif(1)   # a numeric attribute
#          edge.attribute.2 <- LETTERS[sample(1:26, 1)]
createTestGraph <- function(numberOfNodes=0, numberOfEdges=0, nodeAttributes=list(), edgeAttributes=list())
{

} # createTestGraph
#------------------------------------------------------------------------------------------------------------------------

