
# paquetes ----------------------------------------------------------------

library(readxl)
library(here)
library(tidyr)

# -------------------------------------------------------------------------


tasa_suicidio<- read.csv(here::here("Datos-sin-procesar","Age-standardized suicide rates.csv"))

tasa_suicidio_edad2016<- read.csv(here::here("Datos-sin-procesar","Crude suicide rates.csv"))

instalaciones<- read.csv(here::here("Datos-sin-procesar","Facilities.csv"))
instalaciones<-instalaciones[,-2]                      # Eliminando anio

personal_especializado<- read.csv(here::here("Datos-sin-procesar","Human Resources.csv"))
personal_especializado<- personal_especializado[,-2]   # Eliminando anio


# Cambiando nombre de variables -------------------------------------------

names(tasa_suicidio)= c("pais", "sexo", "x2016", "x2015", "x2010", "x2000")

names(tasa_suicidio)= c("pais", "sexo", 2016, 2015, 2010, 2000)

names(tasa_suicidio_edad2016)= c("Pais", "Sexo","Sobre 80","70 a 79","60 a 69","50 a 59","40 a 49","30 a 39","20 a 29","10 a 19")

names(instalaciones)=c("pais","hospitales_psiquiatricos","unidades_de_salud ","instalaciones_de_salud", "tratamiento_diurno", "instalaciones_residenciales")

names(personal_especializado)=c("pais","psiquiatras", "nurses", "trabajadores_sociales", "psicologos")


# tasas de suicidio -------------------------------------------------------

tasa_suicidio<- gather(tasa_suicidio,"anio","tasa_suicidio",-1,-2)

tasa_suicidio$anio<- as.numeric(tasa_suicidio$anio)


# tasa suicidio por edad --------------------------------------------------

tasa_suicidio_edad<- gather(tasa_suicidio_edad2016,"Rango_edad","Tasa_suicidio",-1,-2)


# personal especializado --------------------------------------------------








