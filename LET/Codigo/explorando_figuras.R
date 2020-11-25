
library(ggplot2)
library(dplyr)
library(forcats)
library(hrbrthemes)
library(ggthemes)
library(gghighlight) 
library(countrycode)

library(corrplot)
library(ggfortify)

library(fcuk)



# Matriz correlacion instalaciones ----------------------------------------

instalacion_sinpais<- cor(instalaciones_sin_NA[,2:4])

corrplot(instalacion_sinpais, method="color",tl.col="black",type="upper",addCoef.col = "black" )


# graficos ----------------------------------------------------------------

### TASAS DE SUICIDIO SEPARADO POR SEXO ###

tasas_suicidio %>%
  filter(tasas_suicidio$sexo==" Both sexes") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>% 
  ggplot(aes(anio,tasa_suicidio, group=pais, col= pais))+ 
  theme_minimal()+
  labs( y="Tasa suicidio", title= "Tasas de suicidios", caption="Fuente: elaboración propia a partir de datos de kaggle.com")+
  geom_line()+ gghighlight(pais=="Chile") # no usar 


tasas_suicidio %>%
  filter(tasas_suicidio$sexo==" Male") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>% 
  filter(region=="South America") %>%
  ggplot(aes(anio,tasa_suicidio, group=pais, col= pais))+ 
  theme_minimal()+
  labs( y="Tasa suicidio", title= "Tasa de suicidio de hombres en Sur América", caption="Fuente: elaboración propia a partir de datos de kaggle.com")+
  geom_line()#+ gghighlight(pais=="Chile")

tasas_suicidio %>%
  filter(tasas_suicidio$sexo==" Female") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>% 
  filter(region=="South America") %>%
  ggplot(aes(anio,tasa_suicidio, group=pais, col= pais))+ 
  theme_minimal()+
  labs( y="Tasa suicidio", title= "Tasa de suicidio de mujeres en Sur América", caption="Fuente: elaboración propia a partir de datos de kaggle.com")+
  geom_line()#+ gghighlight(pais=="Chile")


tasas_suicidio %>%
  filter(tasas_suicidio$sexo==" Both sexes") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>% 
  filter(region=="South America") %>%
  ggplot(aes(anio,tasa_suicidio, group=pais, col= pais))+ 
  theme_minimal()+
  labs( y="Tasa suicidio", title= "Tasa de suicidio en Sur América", caption="Fuente: elaboración propia a partir de datos de kaggle.com")+
  geom_line()#+ gghighlight(pais=="Chile")

###------###

### TASAS DE SUICIDIO SEPARADO POR EDAD ###

tasa_suicidio_edad %>%
  filter(tasa_suicidio_edad$sexo==" Both sexes") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>% 
  ggplot(aes(rango_edad,tasa_suicidio, group=pais, col= pais))+ 
  theme_minimal()+geom_line() + gghighlight(pais=="Chile")+
  labs(x="rango de edad", y="Tasa suicidio", title= "Tasa de suicidio en 2016 según rangos de edad", caption="Fuente: elaboración propia a partir de datos de kaggle.com")


tasa_suicidio_edad %>%
  filter(tasa_suicidio_edad$sexo==" Both sexes") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>% 
  filter(region=="South America") %>%
  ggplot(aes(rango_edad,tasa_suicidio, group=pais, col= pais))+ 
  theme_minimal()+geom_line() #+ gghighlight(pais=="Suriname") 




###------###

tasas_suicidio %>%
  filter(tasas_suicidio$sexo==" Female") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>%
  filter(region=="South America") %>%
  ggplot( aes(x=pais, y=tasa_suicidio) ) +
  geom_segment( aes(x=pais ,xend=pais, y=0, yend=tasa_suicidio), color="grey") +
  geom_point(size=3, color="purple", alpha=0.5) +
  coord_flip() +
  theme_ipsum() +
  theme(
    panel.grid.minor.y = element_blank(),
    panel.grid.major.y = element_blank(),
    legend.position="none"
  ) +
  xlab("")+
  ylab("Tasa de suicidio")


tasas_suicidio %>%
  filter(tasas_suicidio$sexo==" Female") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>%
  filter(region=="South America") %>%
  ggplot( aes(x=anio, y=tasa_suicidio) ) +
  geom_bar(col="purple") +
  theme_minimal()



