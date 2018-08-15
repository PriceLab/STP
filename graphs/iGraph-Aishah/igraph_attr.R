#---------------------------------------------------------------------------------------------------------------------------
                                        #family tree test 3 (one dataframe)
library(igraph)
fam <- data.frame(parent=c("ma", "ma", "mey", "miseet", "miseet","mey"),
                  child=c("aishah", "maryam", "ma","hanifah", "hassanah", "miseet"),
                  type=c("child", "child", "parent", "child", "child", "parent"),
                  stringsAsFactors=FALSE)

tree <- unique(c(fam$parent, fam$child))
tree
parent <- set_graph_attr(parent$gender, "f","f", "f", "m", "m", "m")

g <- graph.data.frame(fam)
print(g, e=TRUE, v=TRUE)
plot(g, vertex.color="skyblue",vertex.frame.color= "white", vertex.size=30)
