#MATRIZES

# Documentação de uma função: os comandos help(função) ?função abrem a aba help com a documentação da função
#exemplo com a função matrix

help(matrix)
?matrix

# CONSTRUINDO MATRIZES
#A função matrix cria uma matriz a partir de um conjunto de valores fornecidos

# o exemplo a seguir armazena os valores, mas não estabelece linhas e colunas
matriz_1 <- matrix(1:10) # função padrão

matriz_1

#para estabelecer linhas e colunas usamos a função da seguinte forma:

matriz_2 <- matrix(data = 1:10, nrow = 5, ncol = 2, byrow = FALSE) 
#data: vetor de dados opcional/nrow: número de linhas/ncol: número de colunas 
#byrow=FALSE matriz preenchida por coluna / byrow = TRUE matriz preenchida por linhas

matriz_2

#para inserir valores determinados nos termos da matriz precisamos criar um vetor c()
matriz_3 <- matrix(data = c(0,1,2,3,4,5,6,7,8,9) , nrow = 5, ncol = 2, byrow = FALSE,
                   dimnames = NULL) 
matriz_3

#Para definir os rótulos da matriz usamos dinames=list(nome_linha,nome_coluna)
matriz_4 <- matrix(data = c(0,1,2,3) , nrow = 2, ncol = 2, byrow = FALSE,
                   dimnames = list(
                     c("linha1","linha2"),
                     c("coluna1","coluna2")
                   )
                   )
matriz_4

#CRIANDO MATRIZES A PARTIR DE VETORES COM rbind() e cbind()
#rbind(): empilha vetores um embaixo do outro (linhas)
#cbind(): cola vetores lado a lado (colunas)

vetor_1 <- c(1, 3, 5, 7)    # criando vetor_1

vetor_2 <- c(9, 11, 13, 15) # criando vetor_2

matriz_5 <- rbind(vetor_1, vetor_2) # juntando vetores com linhas

matriz_5

matriz_6 <- cbind(vetor_1, vetor_2) # juntando vetores com colunas

matriz_6

#TRANSFORMANDO UM VETOR EM MATRIZ usando as.matrix

matriz_7 <-as.matrix(vetor_1) #transformando um vetor em matriz

matriz_7

#ALTERAR ELEMENTO DA MATRIZ: nomematriz[linha,coluna]<-valor que será alterado no elemento linha,coluna
matriz_6[1,2]<-100 #substitui um elemento: Ex: linha 1 e coluna 2 recebe 100

matriz_6

#trocar elementos sob uma condição: 
matriz_2[matriz_2==8]<-0 

matriz_2

#OPERAÇÃO ENTRE MATRIZES

#Soma
matriz_2+matriz_3

#Subtração
matriz_2-matriz_3

#Multiplicação por escalar
5*matriz_2

#Multiplicação entre matrizes
matriz_2 %*% matriz_4

#Transpor matriz
t(matriz_2)

#determinante

matriz_7 <- matrix(data = 1:16, nrow = 4, ncol = 4)
matriz_7

det(matriz_7)

# dimensao da matriz

dim(matriz_7)

# número de colunas

ncol(matriz_7)

# número de linhas

nrow(matriz_7)

# termos da diagonal principal da matriz

diag(matriz_7)

#manipulando a diagonal - mudando valores da diagonal principal

diag(matriz_7)<-0 #insere ZERO na diagonal da matriz

matriz_7

#Unindo matrizes


matriz_2
matriz_3

rbind(matriz_2, matriz_3) # unindo matrizes pelas linhas


cbind(matriz_2, matriz_3) # unindo matrizes pelas colunas
