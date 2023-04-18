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


#Rendimento médio habitual por setor em Mato Grosso 
svymean(~VD4019, subset(dadosPNADcmt20224, VD4010 == "Construção")  , na.rm = T)
svymean(~VD4019, subset(dadosPNADcmt20224, VD4010 == "Indústria geral")  , na.rm = T)
svymean(~VD4019, subset(dadosPNADcmt20224, VD4010 == "Agricultura, pecuária, produção florestal, pesca e aquicultura ",na.rm = T))
svymean(~VD4019, subset(dadosPNADcmt20224, VD4010 == "Indústria geral")  , na.rm = T)


# Quartis de Rendimentos Habituais #  
svyquantile(~VD4019, dadosPNADcmt20224, quantiles = c(.1,.25,.5,.75,.9), na.rm = T)

# Mediana dos Rendimentos Habituais #
svyquantile(~VD4019, dadosPNADcmt20224, quantiles = .5, na.rm = T)

