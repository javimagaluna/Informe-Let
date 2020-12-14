

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


tasa_suicidio_edad %>% 
  filter(tasa_suicidio_edad$pais=="Chile") %>%
  ggplot(., aes(tasa_suicidio))+ 
  theme_minimal()+ geom_density(aes(x= tasa_suicidio, fill=sexo), position = "identity", alpha = 0.5)+ labs(x="Rango de edad", y="Tasa suicidio", title= "Tasa de suicidio en Chile durante el 2016 según sexo y rango de edad")


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




# SEXO --------------------------------------------------------------------

t_f<- tasas_suicidio%>% filter(tasas_suicidio$sexo=="Female" & tasas_suicidio$anio==2016)
t_f<-t_f[,-2]
t_f<-t_f[,-2]

t_m<- tasas_suicidio%>% filter(tasas_suicidio$sexo=="Male"& tasas_suicidio$anio==2016)
t_m<-t_m[,-2]
t_m<-t_m[,-2]

plot(t_f$tasa_suicidio, t_m$tasa_suicidio)
abline(0,1, lwd=2, col="purple")

tasa_2016_FM<-data.frame(tasa_femenino=t_f, tasa_masculino=t_m)
tasa_2016_FM<- tasa_2016_FM[,-3]

names(tasa_2016_FM)<- c("pais","tasa_femenino", "tasa_masculino" )

# Gráfico fav <3

ggplot(tasa_2016_FM, aes(tasa_femenino, tasa_masculino))+ geom_point(aes(group=pais, col=pais))+
  theme_minimal() + geom_abline(intercept=0, slope=1)+
  gghighlight(pais=="Lesotho"| pais== "Nigeria"  | pais=="Belarus" | pais=="Côte d'Ivoire"| pais=="Equatorial Guinea"| pais== "Guyana" | pais== "Kazakhstan" | pais=="Latvia" | pais=="Lithuania" | pais=="Russian Federation"| pais=="Suriname"| pais== "Ukraine"| pais=="Liberia"| pais=="China" | pais=="Barbados" | pais=="Pakistan")+ labs(x="Femenino", y="Masculino", title="Tasa de suicidio: sexo masculino v/s  sexo femenino")

#| pais=="Uganda"
tasa_2016_FM$pais[tasa_2016_FM$tasa_femenino>15]
tasa_2016_FM$pais[tasa_2016_FM$tasa_masculino>30]



# EDAD --------------------------------------------------------------------

tasa_ambos_edad<-tasa_suicidio_edad%>%filter(tasa_suicidio_edad$sexo=="Both sexes")

promedios<-c()

t<-tasa_ambos_edad%>% filter(tasa_ambos_edad$rango_edad=="10to19")
promedios<-c(promedios,mean(t$tasa_suicidio))

t<-tasa_ambos_edad%>% filter(tasa_ambos_edad$rango_edad=="20to29")
promedios<-c(promedios,mean(t$tasa_suicidio))

t<-tasa_ambos_edad%>% filter(tasa_ambos_edad$rango_edad=="30to39")
promedios<-c(promedios,mean(t$tasa_suicidio))

t<-tasa_ambos_edad%>% filter(tasa_ambos_edad$rango_edad=="40to49")
promedios<-c(promedios,mean(t$tasa_suicidio))

t<-tasa_ambos_edad%>% filter(tasa_ambos_edad$rango_edad=="50to59")
promedios<-c(promedios,mean(t$tasa_suicidio))

t<-tasa_ambos_edad%>% filter(tasa_ambos_edad$rango_edad=="60to69")
promedios<-c(promedios,mean(t$tasa_suicidio))

t<-tasa_ambos_edad%>% filter(tasa_ambos_edad$rango_edad=="70to79")
promedios<-c(promedios,mean(t$tasa_suicidio))

t<-tasa_ambos_edad%>% filter(tasa_ambos_edad$rango_edad=="sobre_80")
promedios<-c(promedios,mean(t$tasa_suicidio))

promedios_edades_mundo<- data.frame(Rango=c("10 a 19","20 a 29","30 a 39","40 a 49","50 a 59","60 a 69","70 a 79","Sobre 80"),Tasa_promedio=promedios)

promedios_edades_mundo%>% ggplot(., aes(Rango, Tasa_promedio, fill=Rango))+ geom_bar(stat="identity", position=position_dodge())+
  labs(x="Rango de edad", y="Tasa suicidio promedio", title =" Promedio de tasas de suicidio mundiales según rango de edad durante 2016")+ theme_minimal()+ scale_fill_brewer(palette = "Paired")+ coord_flip() 

