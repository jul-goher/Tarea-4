
library(igraph)
karate <- make_graph("Zachary")

## ¿Cuántos nodos y conexiones tiene?
plot(karate, main = "Red")

## ¿Quiénes son los nodos y cuál es la regla de conexión?
karate
#IGRAPH fcc9838 U--- 34 78 -- Zachary
#Indica una red U - undirected (no dirigida) de 34 nodos
#

## ¿Qué tan densa es la red?
edge_density(karate)

##¿Cómo obtienes la matriz de adyacencia?
adj_mat <- as.matrix (get.adjacency (karate) )
adj_mat

## Calcula y gráfica la distribución de conectividades

#Calculo de distribución de conectividades
degree(karate)
#Gráfica
dist_con <- hist(degree(karate), col="seagreen", main = "Distribución del grado")
dist_con

##Calcula el diámetro, la matriz de distancias y la distancia promedio
diameter(karate)

mean_distance(karate)

##Encuentra la trayectoria de los nodos más alejados.

##Existen nodos con coefeiciente de clusterización 1. ¿Qué significa?


##Mide, con al menos tres medidas de centralidad, los nodos más importantes

