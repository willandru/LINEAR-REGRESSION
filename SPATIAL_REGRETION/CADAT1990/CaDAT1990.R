library(rgdal)

list.files('CADAT1990', pattern='\\.shp$')
df_hosing= readOGR(dsn = "CADAT1990", layer="california")
