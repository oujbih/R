library(plotly)


x = Model_SDP_Mean$Débit_CV004
y = Model_SDP_Mean$Pression_PK16
z = Model_SDP_Mean$X250µm


fig <- plot_ly(x = ~x, y = ~y, z = ~z,intensity = ~z, type = 'mesh3d')
fig %>% layout(
  scene = list(
    color ="green",
    xaxis = list(title = "Débit"),
    yaxis = list(title = "Pression_PK16"),
    zaxis = list(title = "Gros")
    )
  ) 
