# Lê o arquivo .txt como se fosse um CSV (com separador vírgula)
dados <- read.csv(file.choose(), header = TRUE, sep = ",")

dados


# Como já temos o peso, usamos xtabs para somar os pesos corretamente
matriz_inc <- xtabs(weight ~ from + to, data = dados)

# Visualiza a matriz de incidência
print(matriz_inc)

#Cada linha é um artista que fez a conexão
#Cada coluna é o artista que recebeu a conexão
#Os valores indicam o número de conexões (peso)

#Operando Matrizes

s <- matriz_inc %*% t(matriz_inc) #Matriz similaridade

s

diag(s)<-0 #diagonal igual a zero

s

c <- t(matriz_inc) %*% matriz_inc #matriz coocorrencia

c

diag(c)<-0 #diagonal igual a zero

c

#Visualização do grafo

#Instale se necessário com: install.packages('igraph')
#library('igraph')

grafo_inc<-graph_from_incidence_matrix(matriz_inc, directed = T, mode="out", weighted = T) 

grafo_sim <- graph_from_adjacency_matrix(s, weighted = T, mode = "undirected")

grafo_co <- graph_from_adjacency_matrix(c, weighted = T, mode = "undirected")

#Plots

plot(grafo_inc, edge.width=E(grafo_inc)$weight, edge.arrow.size=0.1)

plot(grafo_sim, edge.width=E(grafo_sim)$weight)

plot(grafo_co, edge.width=E(grafo_co)$weight)

#metricas Topológicas

V(grafo_sim) #identifica os vértices

length(V(grafo_sim)) #contagem do número de vértices

E(grafo_sim) #identifica as ligações

ecount(grafo_sim) #contagem do número de arestas

degree(grafo_sim) #Graus de vértice

mean(degree(grafo_sim)) #Grau médio

E(grafo_sim)$weight #pesos do grafo

mean(E(grafo_sim)$weight) #força de conectividade média

edge_density(grafo_sim, loops = FALSE) #Densidade da rede

