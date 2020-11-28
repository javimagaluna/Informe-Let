
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



# graficos ----------------------------------------------------------------

### TASAS DE SUICIDIO SEPARADO POR SEXO ###

tasas_suicidio %>%
  filter(tasas_suicidio$sexo=="Both sexes") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>% 
  ggplot(aes(anio,tasa_suicidio, group=pais, col=pais))+ 
  theme_minimal()+
  labs( y="Tasa suicidio", title= "Tasas de suicidios", caption="Fuente: elaboración propia a partir de datos de kaggle.com")+
  geom_line()+ gghighlight(pais=="Chile") # no usar 


tasas_suicidio %>%
  filter(tasas_suicidio$sexo=="Male") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>% 
  filter(region=="South America") %>%
  ggplot(aes(anio,tasa_suicidio, group=pais, col= pais))+ 
  theme_minimal()+
  labs( y="Tasa suicidio", title= "Tasa de suicidio de hombres en Sur América", caption="Fuente: elaboración propia a partir de datos de kaggle.com")+
  geom_line()#+ gghighlight(pais=="Chile")

tasas_suicidio %>%
  filter(tasas_suicidio$sexo=="Female") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>% 
  filter(region=="South America") %>%
  ggplot(aes(anio,tasa_suicidio, group=pais, col= pais))+ 
  theme_minimal()+
  labs( y="Tasa suicidio", title= "Tasa de suicidio de mujeres en Sur América", caption="Fuente: elaboración propia a partir de datos de kaggle.com")+
  geom_line()#+ gghighlight(pais=="Chile")


tasas_suicidio %>%
  filter(tasas_suicidio$sexo=="Both sexes") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>% 
  filter(region=="South America") %>%
  ggplot(.,aes(anio,tasa_suicidio, group=pais, col= pais))+ 
  theme_minimal()+ geom_line()+
  labs( y="Tasa suicidio", title= "Tasa de suicidio en Sur América", caption="Fuente: elaboración propia a partir de datos de kaggle.com") 
#+ gghighlight(pais=="Chile")



ggplot(tasas_suicidio,aes(anio,tasa_suicidio, group=pais, col= pais))+ 
  theme_minimal()+
  labs( y="Tasa suicidio", title= "Tasa de suicidio en Sur América", caption="Fuente: elaboración propia a partir de datos de kaggle.com")+geom_line()


t<-tasas_suicidio %>% filter(tasas_suicidio$sexo==" Both sexes")


###------###

### TASAS DE SUICIDIO SEPARADO POR EDAD ###

tasa_suicidio_edad %>%
  filter(tasa_suicidio_edad$sexo=="Both sexes") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "continent")) %>% 
  ggplot(., aes(rango_edad,tasa_suicidio, group=region, col= region))+ 
  theme_minimal()+ geom_point() +
  labs(x="Rango de edad", y="Tasa suicidio", title= "Tasa de suicidio por continente en 2016 según rangos de edad", caption="Fuente: elaboración propia a partir de datos de kaggle.com")


tasa_suicidio_edad %>%
  filter(tasa_suicidio_edad$sexo=="Both sexes") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "continent")) %>% 
  ggplot(., aes(rango_edad,tasa_suicidio, group=pais, col= pais))+ 
  theme_minimal()+ geom_line() +
  labs(x="Rango de edad", y="Tasa suicidio", title= "Tasa de suicidio por continente en 2016 según rangos de edad", caption="Fuente: elaboración propia a partir de datos de kaggle.com") + gghighlight(pais=="Chile") 



tasa_suicidio_edad %>%
  filter(tasa_suicidio_edad$sexo=="Both sexes") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>% 
  filter(region=="South America") %>%
  ggplot(.,aes(rango_edad,tasa_suicidio, group=pais, col= pais))+ 
  theme_minimal()+geom_line()+ labs(x="Rango de edad", y="Tasa suicidio", title= "Tasa de suicidio en América del Sur durante el 2016 según rangos de edad", caption="Fuente: elaboración propia a partir de datos de kaggle.com")
  #+ gghighlight(pais=="Suriname") 



tasa_suicidio_edad %>%
  filter(tasa_suicidio_edad$sexo=="Female") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>% 
  filter(region=="South America") %>%
  ggplot(.,aes(rango_edad,tasa_suicidio, group=pais, col= pais))+ 
  theme_minimal()+geom_line()+ labs(x="Rango de edad", y="Tasa suicidio", title= "Tasa de suicidio de mujeres en América del Sur durante el 2016 según rango de edad")
#+ gghighlight(pais=="Suriname") 


tasa_suicidio_edad %>%
  filter(tasa_suicidio_edad$sexo=="Male") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>% 
  filter(region=="South America") %>%
  ggplot(.,aes(rango_edad,tasa_suicidio, group=pais, col= pais))+ 
  theme_minimal()+geom_line()+ labs(x="Rango de edad", y="Tasa suicidio", title= "Tasa de suicidio de hombres en América del Sur durante el 2016 según rango de edad")
#+ gghighlight(pais=="Suriname") 


tasa_suicidio_edad %>%
  filter(tasa_suicidio_edad$sexo!="Both sexes") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>% 
  filter(region=="South America") %>%
  ggplot(.,aes(rango_edad,tasa_suicidio))+ 
  theme_minimal()+geom_line()+ labs(x="Rango de edad", y="Tasa suicidio", title= "Tasa de suicidio en América del Sur durante el 2016 según rango de edad")




tasa_suicidio_edad %>%
  filter(tasa_suicidio_edad$sexo=="Both sexes") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>% 
  filter(region=="Southern Europe") %>%
  ggplot(.,aes(rango_edad,tasa_suicidio, group=pais, col= pais))+ 
  theme_minimal()+geom_line()+
  labs(x="Rango de edad", y="Tasa suicidio", title= "Tasa de suicidio en Europa del sur durante el 2016 según rangos de edad", caption="Fuente: elaboración propia a partir de datos de kaggle.com")#+ gghighlight(pais=="Suriname") 


###------###

tasas_suicidio %>%
  filter(tasas_suicidio$sexo=="Female") %>%
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
  filter(tasas_suicidio$sexo=="Female") %>%
  mutate(region=countrycode(sourcevar=pais, origin="country.name", destination= "region23")) %>%
  filter(region=="South America") %>%
  ggplot( aes(x=anio, y=tasa_suicidio) ) +
  geom_bar(col="purple") +
  theme_minimal()



# jugando un poco ---------------------------------------------------------

library(mapdata)
library(maps)
library(ggrepel)
library(ls)

t_S<-tasas_suicidio%>% 
  filter(tasas_suicidio$sexo=="Both sexes")


options(scipen = 999) # para evitar la anotación científica 

mapa_mundo <- map_data("world")

mapa_mundo %>%
  ggplot() +
  geom_polygon(aes( x= long, y = lat, group = group),
               fill = "grey80",
               color = "white") +
  geom_point(data= tasas_suicidio, aes(tasa_suicidio),
             stroke = T) +
  scale_size_continuous(name = " ") +
  ggtitle( "Casos acumulados") +
  theme_map()


