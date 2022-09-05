df <- read.csv('positivosCOVID_BOGOTA.csv')
head(df)

unique((df$Recuperado))

n=nrow(df)

hist(df$Edad, breaks = sqrt(n))            
summary(df)
