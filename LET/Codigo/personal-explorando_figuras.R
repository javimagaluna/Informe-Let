
library(psych)

summary(personal_especializado)
attach(personal_especializado)

plot(psiquiatras, pch=20)          # < Noruega, > Chad
plot(nurses,pch=20)                # < Turquía, > Colombia
plot(trabajadores_sociales,pch=20) # < Mónaco, > Guatemala
plot(psicologos,pch=20)            # < Argentina,> Guyana	

nrow(personal_especializado)

cor(personal$psicologos, personal$psiquiatras)
attach(personal)

p<- cbind( as.numeric(psicologos), as.numeric(psiquiatras))

pairs.panels(p, method = "pearson",
             hist.col = "cyan", ellipses = FALSE,lm=TRUE, 
             factor=3, stars = TRUE,lwd=2 )

hist(psicologos)
hist(psiquiatras)

ggplot(personal, aes(psicologos, psiquiatras))+geom_point(alpha=0.5, col="purple4")+ theme_minimal()+ labs(x="Psicólogos", y="Psiquiatras", title="Relación entre psiquiatras y psicólogos en 2016 a nivel mundial")+ xlim(c(0,20))+ ylim(c(0,20))


# psiquiatras : Noruega 48.040, Mónaco 31.326, Polonia 24.176
# psicologos : 	Argentina 222.572, Costa Rica 142.018, Israel	88.089
personal[46,1]<-"Mónaco"
personal[53,1]<-"Noruega"
personal[57,1]<-"Polonia"

max_psi<- personal%>%filter(personal$psiquiatras>24 |personal$psicologos>88)

ggplot(personal, aes(psicologos, psiquiatras))+geom_point(alpha=0.5, col="purple4")+ theme_minimal()+ labs(x="Psicólogos", y="Psiquiatras", title="Relación entre psiquiatras y psicólogos en 2016 a nivel mundial")+
  ggrepel::geom_label_repel(aes(label = pais), data = max_psi)

# COMPARANDO TASAS DE PAISES

sum(personal_psi$psiquiatras<1)/104









