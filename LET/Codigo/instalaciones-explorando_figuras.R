

library(psych)


pairs.panels(instalaciones_sin_NAs[,2:4], method = "pearson",
             hist.col = "cyan", ellipses = FALSE,lm=TRUE, 
             factor=3, stars = TRUE,lwd=2 )

plot(instalaciones_sin_NAs$hospitales_psiquiatricos) # < Japon, >Tonga (archipielago compuesto de 169 islas)

plot(instalaciones_sin_NAs$unidades_de_salud)        # <	Iceland, >Gutemala y Mexico	(	tambien Cambodia y mali si no eliminamos este dato con otros datos faltates)
plot(instalaciones_sin_NAs$instalaciones_de_salud)   # < Estonia (Saint Lucia con datos faltantes), >	Afghanistan







