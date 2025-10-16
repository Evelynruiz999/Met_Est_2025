# Laboratorio 7 - Segunda parte 
# 25/09/25 
# ESRG 


resp <- data.frame( 
  Tiempo <- c(12,15,17,18,20,21,22,26),
  Edad <- c(13,25,20,35,45,30,60,95)
  )

#Crear nuevas columnas con los rangos (1 a 8)

resp$Rango_Tiempo <- rank(resp$Tiempo,
                          ties.method = "first")
resp$Rango_Edad <- rank(resp$Edad,ties.method = "first")

plot(Tiempo)
plot(Edad)
plot(resp$Tiempo....c.12..15..17..18..20..21..22..26.,
     resp$Edad....c.13..25..20..35..45..30..60..95.)

resp$dif<- resp$Rango_Tiempo ~ resp$Rango_Edad
resp$dif2<- resp$dif^2
sum(resp$dif2)

cor.test(resp$Rango_Tiempo,resp$Rango_Edad, method = "spearman")
cor.test(resp$Tiempo,
         resp$Edad, method = "spearman")


#Correlación de Tau de Kendall 
#Funciona a base de coincidencias y diferencias 


tau <- data.frame(
  A = c(1,2,3,4,5,6),
  B = c(3,1,4,2,6,5)
)

cor.test(tau$A, tau$B, method= "kendall")

#Se rechaza la Hipótesis alternativa 
#No hay una correlación significativa ya que el valor de p es mayor 
#al valor de tau 


#Correlación Biserial 

set.seed(123) #Para reproductibilidad 

#Número de aprobaciones 
n <- 20 

#Generar horas de estudio (entre 1 y 10)
horas_estudio <- sample(1:18,n,replace = TRUE)

#Asignar probabilidad de aprobar en función de horas de estudio 
#A más horas, más alta probabilidad 
Resultado <- sapply(horas_estudio, function(horas){
  ifelse(runif(1) < (horas/10), "Aprobado", "Reprobado")
})

#Crear data frame 
 estudio <- data.frame(
   Estudiante=1:n,
   horas_estudio, 
   Resultado
 )

 
#Crear variable dicotómica:1 = Aprobado, 1,0)
 head(estudio)
 
#CONDICIONANTE

#Si hay una correlación significativa 
#Se usa la correlación de pearson 