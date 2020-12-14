
library(psych)


pairs.panels(instalaciones_sin_NAs[,2:4], method = "pearson",
             hist.col = "cyan", ellipses = FALSE,lm=TRUE, 
             factor=3, stars = TRUE,lwd=2 )
cor(instalaciones_sin_NAs[,2:4])

plot(instalaciones_sin_NAs$hospitales_psiquiatricos) # < Japón, >Tonga (archipiélago compuesto de 169 islas)

plot(instalaciones_sin_NAs$unidades_de_salud)        # <	Iceland, >Gutemala y México	(	también Cambodia y mali si no eliminamos este dato con otros datos faltantes)
plot(instalaciones_sin_NAs$instalaciones_de_salud)   # < Estonia (Saint Lucia con datos faltantes), >	Afghanistan


plot(instalaciones_sin_NAs)


instalaciones_sin_NAs %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>%
  filter(region=="South America") %>%
  ggplot( aes(x=pais, y=hospitales_psiquiatricos) ) +
  geom_segment( aes(x=pais ,xend=pais, y=0, yend=hospitales_psiquiatricos), color="grey") +
  geom_point(size=3, color="purple", alpha=0.5) +
  coord_flip() +
  theme_ipsum() +
  theme(
    panel.grid.minor.y = element_blank(),
    panel.grid.major.y = element_blank(),
    legend.position="none"
  ) +
  xlab("")+
  ylab("Hospitales")

---

instalaciones_sin_NAs %>%
  filter(instalaciones_sin_NAs$hospitales_psiquiatricos>0.9 | instalaciones_sin_NAs$unidades_de_salud> 0.9 |instalaciones_sin_NAs$instalaciones_de_salud>5) %>%
  ggplot(., aes(x=pais, y=hospitales_psiquiatricos,col= pais)) + theme_minimal()+geom_point()

instalaciones_cambio<- gather(instalaciones_sin_NAs,Establecimiento,Tasa,-1)

instalaciones_cambio %>%
  filter(instalaciones_cambio$Establecimiento=="hospitales_psiquiatricos" &instalaciones_cambio$Tasa>0.9| instalaciones_cambio$Establecimiento== "unidades_de_salud"& instalaciones_cambio$Tasa>0.9 |instalaciones_cambio$Establecimiento=="instalaciones_de_salud" & instalaciones_cambio$Tasa>5) %>%
  ggplot(., aes(x=pais, y=Tasa,fill= Establecimiento)) + theme_minimal()+ geom_bar(stat="identity", position=position_dodge())

# comparando --------------------------------------------------------------

ggplot(instalaciones_sin_NAs, aes(hospitales_psiquiatricos, unidades_de_salud))+geom_point(alpha=0.5, col="purple4")+ theme_minimal()+ labs( y="Psiquiatras", title="Relación entre Hospitales psiquiatricos y unidades de salud mental en hospitales generales en 2016 a nivel mundial")















