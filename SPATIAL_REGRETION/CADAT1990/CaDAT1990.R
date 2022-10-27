library(rgdal)

list.files('SHAPES', pattern='\\.shp$')
df_hosing= readOGR(dsn = "CADAT1990", layer="california")
