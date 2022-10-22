url='data.txt'
df <- read.table(url, sep = '\t',header = TRUE)
head(df)
cor(df)
library('GGally')
str(df)
summary(df)
ggpairs(df, ggplot2::aes(colour=Sex), progress = FALSE)
