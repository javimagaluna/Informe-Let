

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



tasa_suicidio_edad %>% filter(tasa_suicidio_edad$pais=="Chile") %>%
  ggplot(.,aes(rango_edad,tasa_suicidio, col= sexo))+ 
  theme_minimal()+geom_point()+ geom_line(aes(group=sexo))+
  labs(x="Rango de edad", y="Tasa suicidio", title= "Tasa de suicidio en Chile durante el 2016 según sexo y rango de edad")
























