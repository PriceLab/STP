#---------------------------------------------------------------------------------------------------------------------------
                                        #family tree test 3 (one dataframe)
library(igraph)

nodes.family <-  data.frame(id=c(   "01", "02", "03",      "04",  "05",     "06",     "07"),
                            name=c( "ma","mey","hassanah","aishah","maryam","hanifah","miseet"),
                            gender.type= c("f","f","f","f", "f","f", "m"))

tbl.relations <- data.frame(from= c("01",    "01",     "02", "07",  "07",   "02"),
                        to=c(       "04",     "05",    "01",  "06", "03",   "07"),
                        stringsAsFactors=FALSE)
#extracts extras in data
extract.extras <- unique(c(tbl.relations$from, tbl.relations$to))

#examines data
head(nodes.family)
head(tbl.relations)

graph <- graph_from_data_frame(d=tbl.relations, vertices=nodes.family, directed=TRUE)
class(graph) #igraph
E(graph)
V(graph)


                                        #plot


plot(graph, edge.arrow.size=.2, edge.curved=0,
     vertex.color="orange",vertex.frame.color="#555555",
     vertex.label=V(graph)$name, vertex.label.color="black",
     vertex.size=30)

                                        #changing color based on gender attribute
V(graph)$gender.type
V(graph)$color = V(graph)$gender.type
V(graph)$color= gsub("f", "pink", V(graph)$color)
V(graph)$color= gsub("m", "skyblue", V(graph)$color)
plot(graph)




