# Utilizando a biblioteca "visNetwork"

install.packages('visNetwork')
library(visNetwork)

# Coventer objeto igraph para objeto VIS
#a função toVisNetworkData() transforma o grafo igraph em uma lista com dois elementos: nodes (nós) e edges (arestas)
#os grafos devem ser construídos anteriormente com o igraph

vis_inc <- toVisNetworkData(grafo_inc) #grafo da matriz de incidência

vis_sim <- toVisNetworkData(grafo_sim) #grafo da matriz de similaridade

vis_co <- toVisNetworkData(grafo_co) #grafo da matriz de coocorrência

#Construindo grafos

# 1º - identificações dos nós (criando uma tabela (data frame) com os nós)
#id: identificador do nó
#label: nome visível, rótulo (exemplo:beyonce)

node_inc<-data.frame("id"=vis_inc$nodes$id, "label"=vis_inc$nodes$label)

node_sim<-data.frame("id"=vis_sim$nodes$id, "label"=vis_sim$nodes$label)

node_co<-data.frame("id"=vis_co$nodes$id, "label"=vis_co$nodes$label)


# 2º identificando ligações

#ligações FROM -> TO - matriz de incidencia

links_inc<-as.data.frame(vis_inc$edges) 

#ligações matriz de adjacencia

links_sim<-as.data.frame(vis_sim$edges) 

links_co<-as.data.frame(vis_co$edges) 


#Atribuindo pesos
#A função visNetwork() usa a coluna width para definir a espessura da aresta.
#Aqui estamos apenas renomeando a terceira coluna (que guarda os pesos) para width

colnames(links_inc)[3]<-'width'

colnames(links_sim)[3]<-'width'

colnames(links_co)[3]<-'width'


#plot Matriz Incidencia

#highlightNearest = TRUE: destaca os nós conectados ao passar o mouse
#nodesIdSelection = TRUE: adiciona um menu de seleção de nós
#arrows = "to": desenha setas nas ligações (para grafos direcionados)
#layout_with_fr: algoritmo de organização dos nós

visNetwork(node_inc, links_inc) %>% 
  visOptions(highlightNearest = TRUE, nodesIdSelection = TRUE) %>%
  visEdges(arrows = "to") %>%  #somente se for direcionado!
  visIgraphLayout(layout ="layout_with_fr")


#plot Matriz Similaridade

visNetwork(node_sim, links_sim) %>% 
  visOptions(highlightNearest = TRUE, nodesIdSelection = TRUE) %>%
  visIgraphLayout(layout ="layout_with_fr")

#plot Matriz Coocorrencia

visNetwork(node_co, links_co) %>% 
  visOptions(nodesIdSelection = TRUE) %>%
  visIgraphLayout(layout ="layout_with_fr")

