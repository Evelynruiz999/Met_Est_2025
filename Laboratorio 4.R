###################################################################################################################
# LABORATORIO 4 
# Pruebas de t
# Caso de muestras independientes 
# ESRG 
# 27/08/25
# DR. MARCO A. GONZALEZ TAGLE 
#################################################################################################################

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

#Función tapply, mean= promedio
tapply(calidad$IE,calidad$Tratamiento,mean)
#Respuesta: Ctrl 0.7676190 Fert  0.9066667  

#Función tapply, var= varianza
tapply(calidad$IE, calidad$Tratamiento, var)
#Respuesta: Ctrl 0.01329905 Fert 0.03238333 
#Se observa que la varianza del grupo fert es 3 veces más 
#grande que el grupo Control (Ctrl)

#Revisar el comportamiento de los datos 

#Primero se debe correr el paquete que instalamos 
library(ggplot2)
ggplot(calidad, aes(x=IE, color=Tratamiento))+
  geom_density()
# La línea roja son los datos de ctrl, la azul es la de fertilizante
# esto solo nos indica como se comportan los datos

#Función tapply, sd= desviación estándar
tapply(calidad$IE, calidad$Tratamiento, sd)
#Resultado Ctrl 0.1153215 Fert 0.1799537

#Separar los datos por tratamiento usando subset

df_ctlr <- subset(calidad, Tratamiento == "Ctrl")
df_fert <- subset(calidad, Tratamiento == "Fert")

#qqnorm  es un gráfico que nos ayudará 
#a revisar la normalidad de los datos

#Función para que la ventana de gráficas permita que nos 
#aparezca dos gráficos par(mfrow) 
#Una fila con dos columnas (1,2)

par(mfrow=c(1,2))
qqnorm(df_ctlr$IE); qqline(df_ctlr$IE)
qqnorm(df_fert$IE); qqline(df_fert$IE)
par(mfrow=c(1,1)) #para que vuelva a mostrarse un solo gráfico

#Normalidad de los datos (prueba Shapiro)

shapiro.test(df_ctlr$IE)

#Respuesta: data:  df_ctlr$IE
#W = 0.9532, p-value = 0.3908

shapiro.test(df_fert$IE)
#Respuesta: data:  df_Fert$IE
#W = 0.95339, p-value = 0.3941

#Los datos si tienen normalidad, ya que el p-value es 
#mayor a 0.05 

#Revisar homogeneidad de varianzas (criterio)
var.test(calidad$IE ~ calidad$Tratamiento)
#Respuesta: p-value = 0.05304
#Aunque es un resultado un tanto mayor, sigue contando con normalidad 

#Ahora ya contamos con los tres criterios para realizar una prueba de t student 
# Criterios: 
# 1- Distribución normal de los datos 
# 2- Homogeneidad de varianzas 
# 3- Más de 30 datos 

#Aplicar la prueba de t, varianzas iguales 
# dos colas = two sided 

t.test(calidad$IE ~ calidad$Tratamiento, 
       var.equal=T,
       alternative="two.sided")
#Respuesta: mean in group Ctrl mean in group Fert 
#              0.7676190          0.9066667       
# alternative hypothesis: true difference in means
# between group Ctrl and group Fert is not equal to 0
# Se acepta la hipotesis alternativa y se rechaza la hipotesis nula 
#ya que las medias son diferentes a 0 

#Intervalo de confianza 
#-0.23331192 -0.04478332

#Resultado de la diferencia de las medias
# 0.7676190 - 0.9066667
#[1] -0.1390477

#La diferencia esta fuera del intervalo de confianza, lo que solo 
# nos confirma más que es una hipótesis alternativa 
#Si no entra en el intervalo de confianza es H1 (alternativa)
#Si esta dentro del intervalo es H0 (nula)

#Determinar ahora si el efecto del fertilizante fue alto, medio o bajo 
# Se determina con el Tamaño de efecto (Cohen´s)

cohens_efecto <- function(x,y) {
  n1 <- length(x); n2 <- length(y)
  s1 <- sd(x); s2 <- sd(y)
  sp <- sqrt(((n1-1)* s1^2 + (n2-1)* s2^2)/(n1+n2 - 2))
  (mean(x)- mean(y))/sp
}

d_cal <- cohens_efecto(df_ctlr$IE, df_fert$IE)

cohens_efecto(df_ctlr$IE, df_fert$IE)

#Respuesta = -0.9200347 
#El tamaño del efecto es grande por lo que se puede concluir que 
#el efecto del fertilizante tiene un gran impacto en las plantulas 
