### EJERCICIO 4 
#Tomando como base mi código anterior:
for (i in 3:6) {
  gr <- make_full_graph(i, directed = FALSE)
  cat("Número de nodos:", i, "\n")
  cat("Máximo número de conexiones para una red de", i, "nodos:", max_conex(i), "\n")
  plot(gr, main = paste("Gráfica para n =", i))
}

#Crear objeto con los layouts?
#
layouts <- c("layout_with_fr", "layout_in_circle", "layout_on_sphere",
             "layout_randomly", "layout_in_grid", "layout_with_kk", 
             "layout_as_tree", "layout_with_dh", "layout_with_lgl", 
             "layout_with_mds", "layout_with_gem") #nO LOS estpy guardando como función, no croe que sirva
#Lista?
layouts <- list ( layout_with_fr, layout_in_circle,layout_on_sphere,layout_randomly,
                layout_with_kk, layout_as_tree,layout_with_dh,layout_with_lgl,layout_with_mds,
                layout_with_gem )
#No me deja guardar la funciín vac+ia 
#Sin paréntesis no funciona
#Dejé sin la función, sin añadir objeto en paréntesis

#Caclculo para cada layour
layouts <- list ( layout_with_fr (mouse), layout_in_circle(mouse), layout_on_sphere(mouse), layout_randomly(mouse),
                  layout_with_kk(mouse), layout_as_tree(mouse),layout_with_dh(mouse),layout_with_lgl(mouse),layout_with_mds(mouse),
                  layout_with_gem(mouse) )

#Lista de nombres 
nombre_layout <- c("f-r","Circle","sphere", "randomly","k-k", "tree",
                   "d-h","lgl","mds","gem")

for (i in length(layouts)) {
  plot (mouse, layout = layouts[[i]],  #Doble corchete pq sino no funciona
        main = paste ("Layout:", nombre_layout[i])) #paste porque con cat no funciona, cat imprime en consola T_t
}
