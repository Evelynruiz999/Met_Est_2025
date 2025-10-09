# LABORATORIO 1: Empezar a trabajar con datos en R 


# Primer contacto con la consola de R
#Uso de R como calculadora científica 

# Gastos totales 
300 + 240 + 1527 + 400 + 1500 + 1833 
# Resultado de la operación [1] 5800 

# Asignación de variables y el valor de cada una 
celular <- 300 
transporte <- 240 
comestibles <- 1527 
gimnasio <- 400 
alquiler <- 1500
otros <- 1833 

# Valor total de gastos por semestre y anualmente 
total <-celular+transporte+comestibles+gimnasio+alquiler+otros
semestre <- total*5
anual <- total*10 

#Otras funciones 

# Valor absoluto 
abs(10)
abs (-4)

# Raíz cuadrada 
sqrt(9)

# Logaritmo natural 
log(2)

2*9
4+5 # también se puede colocar un comentario 

# Cuidar el uso de mayúsculas y minúsculas para obtener un resultado correcto 
celular <-300 
Celular <--300
CELULAR <-8000 

celular+Celular 
CELULAR-celular 

# Help - Ayuda 
help (abs)
help (mean)
?abs
?mean

# Para buscar funciones relacionadas asociadas a una palabra clave (algo complementario)
help.search("absolute")

# Crear un vector 
gastos <- c(celular = 300, transporte = 150, comestibles = 400, 
            gimnasio = 200, alquiler = 1000, otros = 250)


# Crear un diagrama de barra de gastos con la función de barplot 
barplot(gastos)
barplot

# Se ordenan los datos de manera decreciente con la función de sort 
?sort
sort(gastos, decreasing = TRUE)

# Se crea una variable con nuestros datos ordenados para generar un nuevo barplot 
gastos_ord <- sort(gastos, decreasing = TRUE)
barplot(gastos_ord)


# Editar el barplot para agregar el nombre de las variables en el gráfico  
gastos_ord <- sort(gastos, decreasing = TRUE)
barplot(gastos_ord,
        main = "Gastos mensuales",
        names.arg = names(gastos_ord),
        col = "hotpink")
        