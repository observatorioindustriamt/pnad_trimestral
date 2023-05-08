###### Rendimentos ###### 
# A verificação dos rendimentos na PNADc são das variaveis "VD4019" e "VD4020" que registram os rendimentos habituais e efetivos, respectivamente. #

#Rendimentos habituais para todas unidades da federação. 
svyby(~VD4019, ~UF, dadosPNADc20224, svymean, na.rm = T)

#Rendimentos efetivos para todas unidades da federação. 
svyby(~VD4020, ~UF, dadosPNADc20224, svymean, na.rm = T)

#Redimento habitual médio por sexo em Mato Grosso 
svymean(~VD4019, subset(dadosPNADmt20224, V2007 == "Mulher")  , na.rm = T)
svymean(~VD4019, subset(dadosPNADmt20224, V2007 == "Homem")  , na.rm = T)

#Redimento habitual médio por sexo na Baixada Cuiabana 
svymean(~VD4019, subset(dadosPNADBaixadaCba20224, V2007 == "Mulher")  , na.rm = T)
svymean(~VD4019, subset(dadosPNADBaixadaCba20224, V2007 == "Homem")  , na.rm = T)

#Redimento habitual médio por sexo em Cuiabá
svymean(~VD4019, subset(dadosPNADCCba20224, V2007 == "Mulher")  , na.rm = T)
svymean(~VD4019, subset(dadosPNADCCba20224, V2007 == "Homem")  , na.rm = T)

#Redimentos habituais por grau de instrução em Mato Grosso
svyby(~VD4019, ~VD3004, dadosPNADCmt20224, svymean, na.rm=TRUE)

#Redimentos habituais por raça/etnia em Mato Grosso
svyby(~VD4019, ~V2010, dadosPNADCmt20224, svymean, na.rm=TRUE)

#Redimentos habituais por sexo em Mato Grosso
svyby(~VD4019, ~V2007, dadosPNADCmt20224, svymean, na.rm=TRUE)

#Redimentos habituais por setor econômico em Mato Grosso
svyby(~VD4019, ~VD4010, dadosPNADCmt20224, svymean, na.rm=TRUE)

#Redimentos habituais por ocupações em Mato Grosso
svyby(~VD4019, ~VD4011, dadosPNADCmt20224, svymean, na.rm=TRUE)

# Quartis de Rendimentos Habituais #  
svyquantile(~VD4019, dadosPNADcmt20224, quantiles = c(.1,.25,.5,.75,.9), na.rm = T)

# Mediana dos Rendimentos Habituais #
svyquantile(~VD4019, dadosPNADcmt20224, quantiles = .5, na.rm = T)

