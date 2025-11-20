# EXAMEN FINAL 
# EVELYN S. RUIZ GALARZA 
# 20/11/25 
# DR. MARCO TAGLE 


datos_ej3 <- read.csv("Ejercicio_3.csv")
head(datos_ej3)
View(datos_ej3)

# Media, mediana, desviación estándar, mínimo, máximo

# DENSIDAD ARBUSTIVA 
mean(datos_ej3$Densidad_Arbustiva_indha)
median(datos_ej3$Densidad_Arbustiva_indha)
sd(datos_ej3$Densidad_Arbustiva_indha)
min(datos_ej3$Densidad_Arbustiva_indha)
max(datos_ej3$Densidad_Arbustiva_indha)

# COBERTURA VEGETAL 
mean(datos_ej3$Cobertura_pct)
median(datos_ej3$Cobertura_pct)
sd(datos_ej3$Cobertura_pct)
min(datos_ej3$Cobertura_pct)
max(datos_ej3$Cobertura_pct)

# Para poder seleccionar el método de correlación que se usará, se requiere 
# primero si la distribución de mis datos es normal o no

# Si la distribución de mis datos NO es normal = Método de Spearman 
# Si la distribución de mis datos es normal = Método de Pearsons 

shapiro.test(datos_ej3$Densidad_Arbustiva_indha)
# p value= 0.635 
shapiro.test(datos_ej3$Cobertura_pct)
# p value= 0.3588 

# Mis datos siguen una distribución normal así que se selecciona el 
# Método de Pearsons para realizar la correlación

cor.test(datos_ej3$Densidad_Arbustiva_indha, datos_ej3$Cobertura_pct,
         method="pearson")

# Valor de r= -0.09084653  

# Este valor tan bajo y negativo nos indica una relación muy débil, casi nula 

# El signo negativo nos indica que hay una leve disminución de la 
# cobertura vegetal cuando la densidad arbustiva aumenta 

# Diagrama de dispersión con la línea de regresión

plot(datos_ej3$Densidad_Arbustiva_indha, 
     datos_ej3$Cobertura_pct,
     main = "Relación entre Densidad y Cobertura",
     xlab = "Densidad Arbustiva (individuos/hectárea)",         
     ylab = "Cobertura Vegetal (%)",                             
     pch = 19,                                               
     col = "darkgreen")                                         
modelo_lineal <- lm(Cobertura_pct ~ Densidad_Arbustiva_indha, data = datos_ej3)
abline(modelo_lineal, col = "red", lwd = 2) # 'lwd' es el grosor de la línea










