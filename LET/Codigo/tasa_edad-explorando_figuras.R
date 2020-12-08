

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



tasa_suicidio_edad %>% 
  filter(tasa_suicidio_edad$pais=="Chile") %>%
  ggplot(.,aes(rango_edad,tasa_suicidio, col= sexo))+ 
  theme_minimal()+geom_point()+ geom_line(aes(group=sexo))+
  labs(x="Rango de edad", y="Tasa suicidio", title= "Tasa de suicidio en Chile durante el 2016 según sexo y rango de edad")


# PAISES CON MAYOR CANTIDAD DE PSQUIATRAS- PSICOLOGOS

tasa_suicidio_edad %>%
  filter(tasa_suicidio_edad$sexo=="Both sexes" & tasa_suicidio_edad$pais=="Poland"| tasa_suicidio_edad$pais=="Norway" & tasa_suicidio_edad$sexo=="Both sexes"| tasa_suicidio_edad$pais=="Argentina" & tasa_suicidio_edad$sexo=="Both sexes"| tasa_suicidio_edad$pais=="Costa Rica" & tasa_suicidio_edad$sexo=="Both sexes"| tasa_suicidio_edad$pais=="Israel" & tasa_suicidio_edad$sexo=="Both sexes") %>%
  ggplot(aes(rango_edad,tasa_suicidio, col= pais))+ 
  theme_minimal()+geom_point()+ geom_line(aes(group=pais))+
  labs(x="Rango de edad", y="Tasa suicidio", title= "Tasa de suicidio durante el 2016") +
  scale_color_discrete("País:", labels = c("Argentina", "Costa Rica", "Israel", "Noruega","Polonia"))



# PAISES CON MAYOR CANTIDAD DE PSQUIATRAS- PSICOLOGOS CON LOS DE MENOR CANTIDAD

tasa_suicidio_edad %>%
  filter(tasa_suicidio_edad$sexo=="Both sexes" & tasa_suicidio_edad$pais=="Poland"| tasa_suicidio_edad$pais=="Norway" & tasa_suicidio_edad$sexo=="Both sexes"| tasa_suicidio_edad$pais=="Argentina" & tasa_suicidio_edad$sexo=="Both sexes"| tasa_suicidio_edad$pais=="Costa Rica" & tasa_suicidio_edad$sexo=="Both sexes"| tasa_suicidio_edad$pais=="Israel" & tasa_suicidio_edad$sexo=="Both sexes"| tasa_suicidio_edad$pais=="Niger" & tasa_suicidio_edad$sexo=="Both sexes"| tasa_suicidio_edad$pais=="Guyana" & tasa_suicidio_edad$sexo=="Both sexes"| tasa_suicidio_edad$pais=="Guinea" & tasa_suicidio_edad$sexo=="Both sexes") %>%
  ggplot(aes(rango_edad,tasa_suicidio, col= pais))+ 
  theme_minimal()+geom_point()+ geom_line(aes(group=pais))+
  labs(x="Rango de edad", y="Tasa suicidio", title= "Tasa de suicidio contrastada con menor cantidad de psicólogos y psiquiatras durante el 2016")+
  gghighlight(pais=="Guinea" | pais=="Guyana" | pais=="Niger") 



# PAISES SIN EDAD CON MAYOR CANTIDAD DE PSQUIATRAS- PSICOLOGOS CON LOS DE MENOR CANTIDAD

# NO ME SIRVEEEEEEEEE

tasas_suicidio %>%
  filter(tasas_suicidio$sexo=="Both sexes" & tasas_suicidio$pais=="Poland"| tasas_suicidio$pais=="Norway" & tasas_suicidio$sexo=="Both sexes"| tasas_suicidio$pais=="Argentina" & tasas_suicidio$sexo=="Both sexes"| tasas_suicidio$pais=="Costa Rica" & tasas_suicidio$sexo=="Both sexes"| tasas_suicidio$pais=="Israel" & tasas_suicidio$sexo=="Both sexes"| tasas_suicidio$pais=="Niger" & tasas_suicidio$sexo=="Both sexes"| tasas_suicidio$pais=="Guyana" & tasas_suicidio$sexo=="Both sexes"| tasas_suicidio$pais=="Guinea" & tasas_suicidio$sexo=="Both sexes") %>%
  ggplot(aes(anio,tasa_suicidio, col= pais))+ 
  theme_minimal()+geom_point()+ geom_line(aes(group=pais))+
  labs(x="Rango de edad", y="Tasa suicidio", title= "Tasa de suicidio durante años")+
  gghighlight(pais=="Guinea" | pais=="Guyana" | pais=="Niger") 





