

summary(personal_especializado)
attach(personal_especializado)

plot(psiquiatras, pch=20)          # < Noruega, > Chad
plot(nurses,pch=20)                # < Turquia, > Colombia
plot(trabajadores_sociales,pch=20) # < Monaco, > Guatemala
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

