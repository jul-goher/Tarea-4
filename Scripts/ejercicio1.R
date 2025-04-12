#Ejercicio 1
# Gráficas

ag <-  make_graph(edges = c(1,7, 2,1, 2,3, 3,5, 4,2, 4,8, 6,4, 6,9, 6,10), directed = FALSE)
bg <- make_graph (edges = c (2,1, 3,1, 4,1, 5,1, 6,1, 7,4, 8,4, 9,4, 10,8), directed = TRUE )
cg <- make_full_graph (10, directed = FALSE)
dg <- make_graph (edges = c (1,3, 1,8, 2,4, 2,5, 2,6, 2,10, 3,10, 4,1, 4,2, 4,3, 4,6, 4,9, 4,10, 5,1, 5,7, 5,10, 6,3, 6,8, 6,9, 7,1, 7,8, 8,7, 8,9, 8,10, 9,2, 9,3, 9,6, 9,10, 10,1, 10,5, 10,6, 10,9))
eg <- make_graph (edges = c(1,10, 2,7, 3,1, 3,7, 5,7, 6,4, 7,1, 7,8, 8,6, 8,9, 8,10, 9,10, 10,4), directed = FALSE)
fg <- make_graph(edges = c(1,2, 1,3, 2,4, 2,5, 3,6, 3,7, 4,8, 4,9, 5,10), directed = TRUE)

#Propiedades 
prop_graf <- function(grafica) {
  num_nodos <- vcount(grafica)
  num_conexiones <- ecount(grafica)
  grados <- degree(grafica, mode = "all")
  promedio_grado <- mean(grados)
  distribucion_grado <- degree_distribution(grafica, mode = "all")
  densidad <- edge_density(grafica)
  diametro <- diameter(grafica)
  nodos_distantes <- get.diameter(grafica)
  cc <- transitivity(grafica, type = "local")
  
  cat("Nodos:", num_nodos, "\n")
  cat("Conexiones:", num_conexiones, "\n")
  cat("Promedio degree:", promedio_grado, "\n")
  cat("Densidad:", densidad, "\n")
  cat("Diámetro:", diametro, "\n")
  cat("Nodos distantes:", nodos_distantes, "\n")
  cat("Coeficiente de clusterización:", cc, "\n")
}

#Evaluar gráficas

#Gráfico A
prop_graf(ag)
  #Matrices por separado
m_ag <- as.matrix(as_adjacency_matrix(ag))
m_ag
md_ag <- distances(ag)
md_ag
#A excepción de los nodos distantes, matrices y datos coinciden


#Gráfico B
prop_graf(bg)
#Matrices por separado
m_bg <- as.matrix(as_adjacency_matrix(bg))
m_bg
md_bg <- distances(bg)
md_bg
#A excepción del diámetro y densidad, las matrices y demás datos coinciden 


#Gráfico C
prop_graf(cg)
#Matrices por separado
m_cg <- as.matrix(as_adjacency_matrix(cg))
m_cg
md_cg <- distances(cg)
md_cg
#Datos coinciden completamente


#Gráfico D
prop_graf(dg)
#Matrices por separado
m_dg <- as.matrix(as_adjacency_matrix(dg))
m_dg
md_dg <- distances(dg)
md_dg
#A excepción del coeficiente de clusterización, varían los datos pertenecientes a prop_graf
#Matriz de adyacencia igual, diferencias en matriz de distancia


#Gráfico E
prop_graf(eg)
#Matrices por separado
m_eg <- as.matrix(as_adjacency_matrix(eg))
m_eg
md_eg <- distances(eg)
md_eg
#Datos iguales

#Gráfico F
prop_graf(fg)
#Matrices por separado
m_fg <- as.matrix(as_adjacency_matrix(fg))
m_fg
md_fg <- distances(fg)
md_fg
#Datos totalmente distintos
