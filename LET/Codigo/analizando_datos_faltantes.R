
# Analizando datos faltantes ----------------------------------------------
n<- length(instalaciones$pais) #cantidad de países


## instalaciones medicas ##

summary(instalaciones)

# Las variables tratamiento_diurno, instalaciones residenciales poseen 61 y 67 datos faltantes, es decir, más de la mitad de los datos, por lo que eliminaremos estas variables.

instalaciones<- instalaciones[,-5]
instalaciones<- instalaciones[,-5]

summary(instalaciones)


paises_con_NA<-c(instalaciones[is.na(instalaciones$hospitales_psiquiatricos)==TRUE,1],instalaciones[is.na(instalaciones$unidades_de_salud)==TRUE,1],instalaciones[is.na(instalaciones$instalaciones_de_salud)==TRUE,1])


instalaciones_SH<-instalaciones%>%
  filter(is.na(instalaciones$hospitales_psiquiatricos)==FALSE)

instalaciones_SU<-instalaciones_SH%>%
  filter(is.na(instalaciones_SH$unidades_de_salud)==FALSE)

instalaciones_SIU<-instalaciones_SU%>%
  filter(is.na(instalaciones_SU$instalaciones_de_salud)==FALSE)


## personal_especializado ##

summary(personal_especializado)

personal_psi<-personal_especializado%>%
  filter(is.na(personal_especializado$psiquiatras)==FALSE)

personal<-personal_psi%>%
  filter(is.na(personal_psi$psicologos)==FALSE)












