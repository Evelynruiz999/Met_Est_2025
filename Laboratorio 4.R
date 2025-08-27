# Pruebas de t
# caso de muestras independientes 
# ESRG 
# 27/08/25

#Importar datos de Índice de calidad 
calidad <- read.csv("CalidadDePlantulas.csv", header = T)

#Función as.factor para que lo tome como un factor, para que lo tome 
# como dos grupos --> Ctrl y Fert
calidad$Tratamiento <- as.factor(calidad$Tratamiento)

colores <- c("burlywood", "burlywood4")
boxplot(calidad$IE ~ calidad$Tratamiento, 
        col= colores,
        xlab= "Tratamientos", 
        ylab= "Índice de calidad",
        ylim= c(0.4,1.2), 
        main="Vivero Iturbide")

#Estadistica descriptiva 

#tapply sirve para obtener un valor cuando tenemos 
# varios grupos 

tapply(calidad$IE,calidad$Tratamiento,mean)
#Respuesta: IE 0.7676190 TRATAMIENTO  0.9066667  

tapply(calidad$IE, calidad$Tratamiento, var)
#Respuesta: IE 0.01329905 TRATAMIENTO 0.03238333 
#Se observa que la varianza del grupo fert es 3 veces más 
#grande que el grupo Control (Ctrl)

#Revisar el comportamiento de los datos 

#Primero se debe correr el paquete que instalamos 
library(ggplot2)
ggplot(calidad, aes(x=IE, color=Tratamiento))+
  geom_density()
# La línea roja son los datos de ctrl, la azul es la de fertilizante
# esto solo nos indica como se comportan los datos

