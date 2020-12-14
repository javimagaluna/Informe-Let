

# CORRELACION  ------------------------------------------------------------

# correlación psiquiatras con suicidios en 2016

sui<- data.frame(pais=anio2016$pais, tasa=anio2016$tasa_suicidio)

personal_psi$pais
sui$pais

dos_bases<-Reduce(merge, list(sui,personal_psi))

cor(dos_bases$tasa,dos_bases$psiquiatras)
plot(dos_bases$tasa,dos_bases$psiquiatras)


# correlación psicólogos con suicidios en 2016

per_psi<-personal_especializado%>% filter(is.na(personal_especializado$psicologos)==FALSE)

per_psi<- data.frame(pais=per_psi$pais,psicologos=per_psi$psicologos)

dos_bases_psicol<-Reduce(merge, list(sui,per_psi))

cor(dos_bases_psicol$tasa,dos_bases_psicol$psicologos)
plot(dos_bases_psicol$tasa,dos_bases_psicol$psicologos)  #asociación negativa


# ambas

datos<-Reduce(merge, list(sui,personal,instalaciones_sin_NAs))
datos<- datos[,-4]
datos<- datos[,-4]

datos<-Reduce(merge, list(sui,personal_especializado,instalaciones_sin_NAs))
summary(datos)

cor(datos[,2:7])


# regresión
regresion<-lm(tasa~.-pais, datos)
summary(regresion)

plot(regresion$fitted.values,datos$tasa)
plot(regresion)


# edades













