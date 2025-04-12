#### Ejericico 6
##Gráficas
library(igraph)
library(igraphdata)
#Erdos-Rényi
g_er <- sample_gnp (100, p = 0.3)
#Scale-free, 
g_ba <- sample_pa (100 , directed = FALSE)

##Fincion
comparacion <- function (graf) {
  g_prom <- degree(graf, mode = "local")
  sapply ( graf, function(promedio) degree(graf, mode = "local")/degree(graf, mode = "local") )
  cc <- transitivy(graf, mode = "local")
  diam <- diameter(graf)
  d_distrib <- degree_distribution(graf)
  paste()
}


#Función 2
comparacion <- function(graf) {
  g_prom <- mean (degree (graf, mode = "total"))
  g_dist <- degree_distribution(graf) 
  cc <- transitivity(graf, type = "average") #supongo que en este caso el promedio e smejor que el local 
  diam <- diameter(graf)

  cat("Grado promedio:", g_prom, "\n")
  cat("Distribución de grados:", g_dist, "\n")
  cat("CC promedio:", cc, "\n")
  cat("Diámetro:", diam, "\n")
}

comparacion(g_er)
comparacion(g_ba)
