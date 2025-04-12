
library (igraph)
karate <- make_graph("Zachary")

#Pregunta 2
g <- make_empty_graph ( n= 10, directed = TRUE)

conex <- sample(1:10, 50, replace = TRUE) #para 25 conexiones necesito 50 números, porque van en pares
conex

#Pregunta 3
max_conex <- function (x) { #x representa el número de nodos
  max <- (x*(x-1))/2
  return (max) #Hubiera estado mejor dejar la función para que trabajara con un vector de nodos
}

#le pedía a la IA que les pusiera coma entre los 50 números para volverlos a guardar en el vector
conex <- c(7, 6, 10, 2, 7, 2, 6, 5, 8, 10, 4, 9, 10, 6, 4, 7, 2, 7, 3, 2, 6, 9, 5, 5, 6, 2, 3, 10, 7, 3, 5, 4, 4, 4, 10, 9, 2, 3, 3, 1, 5, 9, 1, 5, 5, 10, 3, 2, 10, 1)
g <- add_edges (g, conex)
plot(g, main = "Red dirigida")

mean(degree(g, mode = "in"))
mean(degree(g, mode = "out"))

#Ciclos for para gráficas
for (i in 3:6) {
  gr <- make_full_graph(i, directed = FALSE)
  cat("Número de nodos:", i, "\n")
  cat("Máximo número de conexiones para una red de", i, "nodos:", max_conex(i), "\n")
  plot(gr, main = paste("Gráfica para n =", i))
}






####EJERCICIO GRÁFICAS 






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
adj_mat <- as.matrix (get.adjacency (karate) )
adj_mat <- as.matrix (get.adjacency (karate) )
adj_mat
mean_distance(karate)

## Encuentra la trayectoria de los nodos más alejados.
#sort ((get_diameter (karate)), decreasing = TRUE )}
diameter (karate)

################ EJERCICIO 2

#Cargar la red 
g2 <-read.csv("Data/adjacency_matrix.csv")
rownames(g2)<-g2[,1]
g2<-g2[,-1]
g2<-as.matrix(g2)
diag(g2)<-0
red < -graph_from_adjacency_matrix(g2)

#FUNCIÓN
amigos_de_amigos <- function (persona) {
  sus_amigos <- neighbors(red, persona, mode = "out")
  num_amigos <- length(sus_amigos)
  #Del ejemplo en la práctica sapply(networks, function(g) transitivity(g, type = "global"))
  amigos_de_amigos <- sapply ( sus_amigos, function(ami) length(neighbors (red, ami, mode = "out")) )
  
  
  cat ("Amigos de la persona:", num_amigos, "\n")
  cat ("Amigos de sus amigos:", amigos_de_amigos, "\n")
  
}

#Comprobar la función

amigos_de_amigos("JULIETA")
amigos_de_amigos("TRINIDAD")
amigos_de_amigos("ISABEL")
amigos_de_amigos("BLANCA")

#2DA FUNCIÓN 
trayectoria_larga <- function (persona1, persona2) {
  #Calcular los trayectos
  trayectos <- all_simple_paths (red, from = persona1, to =persona2, mode = "all" )
  #Añado all porque in y out no los calcula
  #Calcular la longitud de los paths
  long_trayectos <- sapply (trayectos, function (tray) length (tray) - 1 )
  #Añadí el -1 porque lo que da es el número de nodos, si se resta 1 da la conexión entre estos
  max_trayecto <- trayectos[[which.max(long_trayectos)]]
  #Trayectos guarda la secunia de nodos y long_trayectos la longitud
  max_long <- max(long_trayectos)
  
  cat("Máximo trayecto:", paste(max_trayecto, collapse = " -> "), "\n")
  cat ("Longitud máxima:", max_long)
  
}

trayectoria_larga ("JULIETA", "BLANCA")


###### EJERCICIO 3

delecion_sucesiva <- function (grafica, num_deleciones) {
  dist_inicial <-  mean_distance(grafica)
  dist_final <- num_deleciones
  graf_modif <- grafica
  
  for (i in 1:num_deleciones) { 
    #Sample de los nodos, al azar
    #En vez de 
    samp <- sample (1:(length (graf_modif)), 1, replace = FALSE)
    #deleciones
    graf_modif <- delete_vertices (graf_modif, samp)
    #Guardar deleciones
  }
  
  dist_final <- mean_distance(graf_modif)
  
  cat ("Distancia promedio inicial:", dist_inicial, "\n")
  cat ("Distancia promedio final:", dist_final)
}

ye2 <- yeast

delecion_sucesiva(ye2, 300)

##Función de elimar proteínas más conectadas 


delecion_conect <- function (grafica, num_deleciones) {
  graf_modif <- grafica   #gráfica inicial para irle haciendo las iteraciones
  dist_inicial <- mean_distance(grafica)
  #Definir los nodos (proteínas) más conectadas según el degree total 
  prot_conect <- degree(graf_modif, mode = "total") 
  #elegir el nodo más conectado
  nodo_mas_conectado <- which.max(prot_conect)
  
  for (i in 1:num_deleciones) { 
    graf_modif <- delete_vertices (graf_modif, nodo_mas_conectado)
  }
  
  dist_final <- mean_distance (graf_modif)
  
  cat ("Distancia promedio inicial:", dist_inicial, "\n")
  cat ("Distancia promedio final:", dist_final)
}

delecion_conect (ye2, 300)


#Supongo que cambio por Vcount???
for (i in 1:num_deleciones) {
  if (vcount(graf_modif) <= 1) #no tiene sentido
  #Lo que quiero hacer:
  prot_conect <- degree(graf_modif, mode = "total")
  nodo_mas_conectado <- which.max(prot_conect)
  
  graf_modif <- delete_vertices(graf_modif, nodo_mas_conectado)
  }

##Promedio CC
prom_cc <- mean(transitivity(yeast,type = "local")) #salemn valores NaN
#remover NaN: 
na.omit(prom_cc) #no puede porque prom_cc es numérico 
class(prom_cc)

#Recalcular:
#Volver a seleccionar 
y_cc <- transitivity(yeast,type = "local")
prom_cc <- mean(y_cc, na.rm = TRUE) 
prom_cc

yeast




