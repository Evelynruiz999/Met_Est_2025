#########################################################################
#Laboratorio Semana 3 - Segunda parte 
##########################################################################

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
inventario <- read_csv(cuadro1.csv)
