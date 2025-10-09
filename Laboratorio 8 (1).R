resp <- data.frame( 
  Velocidad <- c(2,3,5,9,14,24,29,34),
  Abundancia  <- c(6,3,5,23,16,12,48,43)
)

resp$Rango_velocidad <- rank(resp$Velocidad,
                             ties.method = "first")
resp$Rango_Abundancia <- rank(resp$Abundancia, 
                              ties.method = "first")
plot(Velocidad)
plot(Abundancia)
plot(resp$Velocidad,
     resp$Abundancia,
     main = "Diagrama de dispersión",
     xlab = "Velocidad de la corriente",
     ylab = "Abundancia de Efímeras",
     pch = 19,      
     col = "olivedrab")

#Es estadisticamente significativa la correlación? 
#Se rechaza la H0 o la H1? 
#H0=No existe una correlación entre la velocidad del arroyo 
#y la abundancia de efímeras
#H1=“Existe una correlación positiva entre la velocidad de los arroyos
#y la abundancia de efímeras 

resp$dif<- resp$Rango_velocidad ~ 
  resp$Rango_Abundancia
resp$dif2<- resp$dif^2
sum(resp$dif2)

cor.test(resp$Rango_velocidad,
         resp$Rango_Abundancia,
         method = "spearman")

cor.test(resp$Velocidad....c.2..3..5..9..14..24..29..34.,
         resp$Abundancia....c.6..3..5..23..16..12..48..43.,
         method = "spearman")
