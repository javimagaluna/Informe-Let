
library(readxl)
library(here)

tasa_suicidio<- read.csv(here::here("Datos-sin-procesar","Age-standardized suicide rates.csv"))

tasa_suicidio_edad2016<- read.csv(here::here("Datos-sin-procesar","Crude suicide rates.csv"))

instalaciones<- read.csv(here::here("Datos-sin-procesar","Facilities.csv"))
instalaciones<-instalaciones[,-2]                      # Eliminando anio

personal_especializado<- read.csv(here::here("Datos-sin-procesar","Human Resources.csv"))
personal_especializado<- personal_especializado[,-2]   # Eliminando anio


# Cambiendo nombre de variables -------------------------------------------

names(tasa_suicidio)= c("pais", "sexo", "año_2016", "año_2015", "año_2010", "año_2000")

names(tasa_suicidio_edad2016[1])= "pais"
names(tasa_suicidio_edad2016[2])="sexo"
names(tasa_suicidio_edad2016[3])= "sobre_80"

names(instalaciones)=c("pais","hospitales_psiquiátricos","unidades_de_salud ","instalaciones_de_salud", "tratamiento_diurno", "instalaciones_residenciales")

names(personal_especializado)=c("pais","psiquiatras", "nurses", "trabajadores_sociales", "psicologos")


min(tasa_suicidio$año_2016)
max(tasa_suicidio$año_2016)










