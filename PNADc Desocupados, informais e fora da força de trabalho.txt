#Dada a natureza e dinâmica do mercado de trabalho de Mato Grosso, atualmente o projeto se dedica nas análises com o escopo em desocupados, informais e pessoas fora da força de trabalho. Abaixo os cruzamentos realizados#

##### Ocupados e Desocupados ##### 
#Totais
svytotal(~ VD4002, dadosPNADCmt20224, na.rm = TRUE)
svytotal(~ VD4002, PNADCBaixadaCba20224, na.rm = TRUE)
svytotal(~ VD4002, PNADCCba20224, na.rm = TRUE)

#Mato Grosso por genero e etnia em semestres 
svyby(~ VD4002,~ interaction(V2007, V2010), dadosPNADCmt20224, na.rm = T, svytotal)
#Mato Grosso por genero e grau de instrução em semestres 
svyby(~ VD4002, ~ interaction(V2007, VD3004), dadosPNADCmt20224, na.rm = T, svytotal)

#Baixada Cuiabana por genero e etnia em semestres 
svyby(~ VD4002,~ interaction(V2007, V2010), PNADCBaixadaCba20224, na.rm = T, svytotal)
#Baixada Cuiabana por genero e grau de instrução em semestres 
svyby(~ VD4002, ~ interaction(V2007, VD3004), PNADCBaixadaCba20224, na.rm = T, svytotal)

#Cuiaba por genero e etnia em semestres 
svyby(~ VD4002,~ interaction(V2007, V2010), PNADCCba20224, na.rm = T, svytotal)
#Cuiaba por genero e grau de instrução em semestres 
svyby(~ VD4002, ~ interaction(V2007, VD3004), PNADCCba20224, na.rm = T, svytotal)


##### Formais e Informais #####
#Totais
svytotal(~ informalidade, dadosPNADCmt20224, na.rm = TRUE)
svytotal(~ informalidade, PNADCBaixadaCba20224, na.rm = TRUE)
svytotal(~ informalidade, PNADCCba20224, na.rm = TRUE)

#Mato Grosso por genero e etnia em semestres 
svyby(~ informalidade,~ interaction(V2007, V2010), dadosPNADCmt20224, na.rm = T, svytotal)
#Mato Grosso por genero e grau de instrução em semestres 
svyby(~ informalidade, ~ interaction(V2007, VD3004), dadosPNADCmt20224, na.rm = T, svytotal)

#Baixada Cuiabana por genero e etnia em semestres 
svyby(~ informalidade,~ interaction(V2007, V2010), PNADCBaixadaCba20224, na.rm = T, svytotal)
#Baixada Cuiabana por genero e grau de instrução em semestres 
svyby(~ informalidade, ~ interaction(V2007, VD3004), PNADCBaixadaCba20224, na.rm = T, svytotal)

#Cuiaba por genero e etnia em semestres  
svyby(~ informalidade,~ interaction(V2007, V2010), PNADCCba20224, na.rm = T, svytotal)
#Cuiaba por genero e grau de instrução em semestres 
svyby(~ informalidade, ~ interaction(V2007, VD3004), PNADCCba20224, na.rm = T, svytotal)


##### Pessoas fora da força de trabalho #####
#Totais
svytotal(~ VD4001, dadosPNADc20224, na.rm = TRUE)
svytotal(~ VD4001, dadosPNADCmt20224, na.rm = TRUE)
svytotal(~ VD4001, PNADCBaixadaCba20224, na.rm = TRUE)
svytotal(~ VD4001, PNADCCba20224, na.rm = TRUE)

#Pessoas fora da força de trabalho: motivos para nao ter procurado emprego#
#Totais
svytotal(~ VD4030, dadosPNADc20224, na.rm = TRUE)
svytotal(~ VD4030, dadosPNADCmt20224, na.rm = TRUE)
svytotal(~ VD4030, PNADCBaixadaCba20224, na.rm = TRUE)
svytotal(~ VD4030, PNADCCba20224, na.rm = TRUE)

#mt por genero e etnia  
svyby(~ VD4030,~ interaction(V2007, V2010), dadosPNADCmt20224, na.rm = T, svytotal)
#mt por genero e grau de instrucao  
svyby(~ VD4030, ~ interaction(V2007, VD3004), dadosPNADCmt20224, na.rm = T, svytotal)

#baixada por genero e etnia em semestres  
svyby(~ VD4030,~ interaction(V2007, V2010), PNADCBaixadaCba20224, na.rm = T, svytotal)
#baixada por genero e grau de instrucao  
svyby(~ VD4030, ~ interaction(V2007, VD3004), PNADCBaixadaCba20224, na.rm = T, svytotal)

#cuiaba por genero e etnia em semestres  
svyby(~ VD4030,~ interaction(V2007, V2010), PNADCCba20224, na.rm = T, svytotal)
#baixada por genero e grau de instrucao  
svyby(~ VD4030, ~ interaction(V2007, VD3004), PNADCCba20224, na.rm = T, svytotal)



