library(rgdal)
df= readOGR(dsn = "SPATIAL_REGRESSION_1_HANDS_ON", layer="NCVACO")
#list.files('SPATIAL_REGRESSION_1_HANDS_ON', pattern='\\.shp$')
names(df)
summary(df)
df$PCI = as.numeric(levels(df$PCI))[df$PCI]

spplot(df, "SALESPC")

library(spdep)
queen.neighbo.file = poly2nb(df)
rook.nb= poly2nb(df, queen=FALSE)
queen.listw = nb2listw(queen.neighbo.file)
rook.listw= nb2listw(rook.nb)

listw1= queen.listw

equation= DUI1802 ~ SALESPC + COLLENRP + BKGRTOABC + BAPTISTSP + BKGRTOMIX + ENTRECP


#RUN 4 MODELS: OLS, SLX, LagY, LagError

#-----------------------------OLS------------------------
reg1 = lm(equation, data=df)
summary(reg1)
#MORRA'S TEST: Let's see if there is any Residual Spatial Dependence in our Residuals. This test is designed for Regression Residuals.
# Tise test looks at the residuals of the model and then You givi it what kind of spatial regression matrix you want to use.
# H0: There is NO spatial correlation in the residuals
lm.morantest(reg1, listw1) #We reject H0
lm.LMtests(reg1, listw1, test = "all")

# How much our model woul imporve if we model one of thes models:
#LMerr --> Spatial Regression Model, P-value <0.05 Suggest that the model would improve the fit
#LMlag
#RLMerr: Tries to filter out some of the FP(FalsePositives) from the LMlag
#Picking the one with the lower VALUE (?)
