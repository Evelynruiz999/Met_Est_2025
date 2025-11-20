###############################################################################################################################
# LABORATORIO 3 
# 20/08/25
# ESRG
# DR. MARCO A. GONZALEZ TAGLE 
###############################################################################################################################

temperatura <- read.csv("~/temperatura.csv")
View(temperatura)
# Importar datos  ---------------------------------------------------------

Temp <- read.csv("temperatura", header = T)
temperatura <- read.csv("~/temperatura.csv")
Temp <- read.csv("Data/medias_mensuales", header = T)

# Graficar datos  ---------------------------------------------------------

#Ingresar datos de manera manual


# Estadísticas descriptivas  ----------------------------------------------


edad <- c(18,19,18,18,25,19,18,18,18,17,19,
          19,18,17,19,18,19,19)

#Secuencia (seq), que empiece en el 1, termine en el 18 
#y se vaya de uno en uno 
alumno <- seq(1,18,1)

info <- data.frame(alumno,edad)
info$Altura<-c(174,174,170,160,158,155,188,170,175,170,
               172,170,174,180,158,161,188,164)
boxplot(info$Altura,
        #Col es para colorear el gráfico
        col= "burlywood",
        #Main sirve para poner un título 
        main= "Clase 3 semestre")

colores= c("rosybrown4","olivedrab","ivory2")
boxplot(datos_meses,
        col=colores)
