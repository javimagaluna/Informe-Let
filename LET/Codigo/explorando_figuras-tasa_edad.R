
library(psych)


ggplot(tasas_suicidio, aes(tasa_suicidio, anio))+geom_point(alpha=0.5, col="purple4")+ theme_minimal()+ labs(x="tasa", y="años", title=" en 2016 a nivel mundial")

tasa_ambos<- tasa_suicidio %>% filter(tasa_suicidio$sexo==" Both sexes") # tasa_suicidio: base original con nombres cambiados.

pairs.panels(tasa_ambos[,3:6], method = "pearson", ellipses = FALSE,
             lm=TRUE, lwd=2,density=FALSE,alpha=.05,
             digits =3)


plot(anio2000$tasa_suicidio, anio2010$tasa_suicidio)


panel.cor <- function(x, y, digits=3, prefix="", cex.cor)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r <- abs(cor(x, y))
  txt <- format(c(r, 0.123456789), digits=digits)[1]
  txt <- paste(prefix, txt, sep="")
  if(missing(cex.cor)) cex <- 3
  text(0.5, 0.5, txt, cex = cex * r)
}

panel.reg <- function (x, y) 
{
  points(x, y, pch=19)
  abline(lm(y ~ x), lwd=2, col="purple")
}


pairs(tasa_ambos[,3:6],labels=c("Año 2016","Año 2015","Año 2010","Año 2000"),upper.panel = panel.reg, lower.panel = panel.cor, main="Relación entre tasas de suicidio según año")










