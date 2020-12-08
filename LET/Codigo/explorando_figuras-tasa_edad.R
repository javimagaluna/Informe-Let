
library(psych)


ggplot(tasas_suicidio, aes(tasa_suicidio, anio))+geom_point(alpha=0.5, col="purple4")+ theme_minimal()+ labs(x="tasa", y="años", title=" en 2016 a nivel mundial")

tasa_ambos<- tasa_suicidio %>% filter(tasa_suicidio$sexo==" Both sexes") # tasa_suicidio: base original con nombres cambiados.

pairs.panels(tasa_ambos[,3:6], method = "pearson",
             hist.col = "cyan", ellipses = FALSE,lm=TRUE, 
             factor=3, lwd=2 )


t<-tasa_ambos[,3:6]

uwu<-corPlot(t, cex = 1.2)
plot(uwu$clust)















