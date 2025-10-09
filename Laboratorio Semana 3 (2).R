#Laboratorio Semana 3 - Segunda parte 

dbh <- c(16.5, 25.3, 22.1, 17.2, 16.1, 8.1, 34.3, 5.4, 5.7, 11.2, 24.1,
         14.5, 7.7, 15.6, 15.9, 10, 17.5, 20.5, 7.8, 27.3,
         9.7, 6.5, 23.4, 8.2, 28.5, 10.4, 11.5, 14.3, 17.2, 16.8)

trees <- trees


prof_url_2 <- paste0("https://repodatos.atdt.gob.mx/api_update/senasica/",
                     "actividades_inspeccion_movilizacion/",
                     "29_actividades-inspeccion-movilizacion.csv")
senasica <- read.csv(prof_url_2)
head(senasica)

library(readr)
repodatos <- read_csv("repodatos.csv")
View(repodatos)

# Descargar paquete repmis Miscellaneous Tools for Reproducible Research para
# descargar datos en R:source_data, usando la opción de Tools 
# y posteriormente Install packages, se busca repmis en el buscador

library(repmis) 
conjunto <- source_data("https://www.dropbox.com/s/hmsf07bbayxv6m3/cuadro1.csv?dl=1")

# Mostrar las primeras seis filas de la BD, utilizando el comando head(conjunto)
head(conjunto)

library(readr)
inventario <- read_csv("cuadro1.csv")

head (inventario)

# Acomodar los conjuntos de datos para acomodar parcelas, son 7 datos 
# por parcela, 3 parcelas en total

parcelas <- gl(3,7)
parcelas

#se agrego una cifra de dbh para completar los 21 datos
trees <- seq(1,21)
dbh <- c(16.5, 25.3, 22.1, 17.2, 16.1, 8.1, 34.3, 5.4, 5.7, 11.2, 9.7, 6.5, 23.4, 
         8.2, 28.5, 10.4, 11.5, 14.3, 17.2, 16.8,18.4)

trees <- data.frame(trees,dbh,parcelas)
View(trees)
trees

# Agrega el vector dbh como nueva columna en el data frame trees
trees$dbh <- dbh

#Para poder tener acceso a cada columna debemos siempre especificar la base de datos
#seguido por $ y el nombre de la columna a trabajar.

mean(trees$dbh)
sd(trees$dbh)

#SELECCIÓN MEDIANTE RESTRICCIONES 

#El uso de restricciones sirve para obtener una muestra bajo ciertas condiciones restrictivas de la base
#de datos trees y es por ejemplo, una operación útil en el manejo de información de los inventarios
#forestales.

#Indica la sumatoria de los individuos en el objeto tree con un dbh < a 10
sum(trees$dbh < 10)

#Indica los individuos que son inferiores al diámetro (dbh< 10 cm)
#Para esto se hace uso de la funciónwhich que no regresara cuales individuos son los que posen
# tal restricción
which(trees$dbh < 10)

#Otra función: excluir los diámetros de alguna parcela determinada, ejemplo, la parcela 2 
trees.13 <- trees[!(trees$parcela=="2"),]
trees.13

#SELECCIÓN DE UNA SUBMUESTRA 
#Una submuestra se puede obtener de cualquier base de datos que este disponible en R mediante la
#función subset [Crawley, 2007]. Por ejemplo queremos obtener solo los diámetros iguales o menores
#a 10 cm y deseamos guardarla en un objeto que se denominará trees.1.

trees.1 <- subset(trees, dbh <= 10)
head(trees.1)

#El objeto trees.1 contiene 9 observaciones obtenidas mediante la restricción (subset(trees,
#dbh <=10)) de los diámetros iguales o menores a 10 cm de la base de datos original trees.
#Ahora tenemos dos base de datos: trees y trees.1

mean(trees$dbh)
mean(trees.1$dbh)

#Histogramas 

colors()

hist(trees$dbh, 
     main= "Muestra original trees",
     xlab= "Diámetro a la altura del pecho (cm)",
     ylab="Frecuencia",
     col="midnightblue",
     border= "skyblue",
     lwd= 3)

hist(trees.1$dbh, 
     main= "dbh < 10 cm. trees.1",
     xlab= "Diámetro a la altura del pecho (cm)",
     ylab="Frecuencia",
     col="violetred1",
     border= "violetred3",
     lwd= 3)


# PARTE 3: REPRESENTACIÓN GRÁFICA 
mamiferos <- read.csv("https://www.openintro.org/data/csv/mammals.csv")
hist(mamiferos$total_sleep)

#Con las siguientes funciones editamos y personalizamos nuestro histograma 
hist(mamiferos$total_sleep,
     xlim= c(0,20), ylim = c(0,14),
     main = "Total de horas sueño de las 39 especies", 
     xlab = "Horas sueño",
     ylab = "Frecuencia",
     las = 1,
     col = "cadetblue")
colors()

#Xlim: cambiar los límites de "x" y "y" 
#main: Total de horas sueño de las 39 especies
#xlab:Cambiar eje de las x
#ylab:Cambiar eje de las y
#las = 1, # Cambiar orientación de y
#col= cambiar color del gráfico 


data("chickwts")
head(chickwts[c(1:2,42:43, 62:64), ])

#Acomodar datos en columnas 

feeds <- table(chickwts$feed)
feeds

#Los datos fueron acomodados en una tabla de frecuencias 
#(Tipo de alimentación y la cantidad de pollos alimentados por cada tipo)
barplot(feeds)

#Ordenar de forma decreciente las barras 

tipos_alimentacion <- c("soybean", "casein", "linseed", "sunflower", "meatmeal", "horsebean")
cantidad_pollos <- c(14, 12, 12, 12,11,10)

ordenados <- order(cantidad_pollos, decreasing = TRUE)
tipos_alimentacion <- tipos_alimentacion[ordenados]
cantidad_pollos <- cantidad_pollos[ordenados]

par(mar = c(8, 5, 4, 2)) #Función para ajustar márgenes 

#Barplot vertical 

barplot(cantidad_pollos, 
        names.arg = tipos_alimentacion, 
        col = "thistle", 
        main = "Cantidad de pollos alimentados por Tipo de alimentación",
        xlab = "Tipos de alimentación",
        ylab = "Cantidad de pollos",
        width = 0.5, #Función para reducir el ancho de las barras 
        cex.names = 0.9) #Función para editar el tamaño de las etiquetas del gráfico
 
# FIGURA 10 
# Barplot horizontal 

tipos_alimentacion <- c("soybean", "casein", "linseed", "sunflower", "meatmeal", "horsebean")
cantidad_pollos <- c(14, 12, 12, 12,11,10)

ordenados <- order(cantidad_pollos, decreasing = TRUE)
tipos_alimentacion <- tipos_alimentacion[ordenados]
cantidad_pollos <- cantidad_pollos[ordenados] 


row.names(feeds)

barplot(feeds[order(feeds, decreasing = TRUE)],
        names.arg = c("casein",    "horsebean", "linseed",
                      "meatmeal",  "soybean", "sunflower"), horiz = TRUE,
        col = "thistle",
        xlab = substitute(paste(bold("Número de pollos"))),
        ylab = substitute(paste(bold("Alimentación de los pollos"))))

