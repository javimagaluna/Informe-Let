
library(psych)


ggplot(tasas_suicidio, aes(tasa_suicidio, anio))+geom_point(alpha=0.5, col="purple4")+ theme_minimal()+ labs(x="tasa", y="años", title=" en 2016 a nivel mundial")

tasa_ambos<- tasa_suicidio %>% filter(tasa_suicidio$sexo==" Both sexes") # tasa_suicidio: base original con nombres cambiados.

pairs.panels(tasa_ambos[,3:6], method = "pearson",
             hist.col = "cyan", ellipses = FALSE,lm=TRUE, 
             factor=3, lwd=2 )


plot(anio2000$tasa_suicidio, anio2010$tasa_suicidio)


pairs(tasa_ambos[,3:6], lower.panel=NULL,labels=c("2016","2015","2010","2000"), pch=19, cex=0.8)












