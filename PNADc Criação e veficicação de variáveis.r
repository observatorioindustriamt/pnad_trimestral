###### Importante variável na análise da forma de trabalho é a Informalidade. É criado pelo IBGE uma proxy com as condicionais abaixo na criação do indicador.#####

#Criando Informalidade para Brasil:
dadosPNADc20224$variables <- transform(dadosPNADCmt20221$variables, informalidade=as.factor(ifelse(is.na(VD4009),NA,
                                                                                                     ifelse(VD4009=="Empregado no setor privado sem carteira de trabalho assinada"|VD4009=="Trabalhador doméstico sem carteira de trabalho assinada"|(VD4009=="Empregador"&V4019=="Não")|(VD4009=="Conta-própria"&V4019=="Não")|VD4009=="Trabalhador familiar auxiliar","Pessoas na informalidade","Pessoas na formalidade"))))



#Criando Informalidade para Mato Grosso:
dadosPNADCmt20224$variables <- transform(dadosPNADCmt20222$variables, informalidade=as.factor(ifelse(is.na(VD4009),NA,
                                                                                                     ifelse(VD4009=="Empregado no setor privado sem carteira de trabalho assinada"|VD4009=="Trabalhador doméstico sem carteira de trabalho assinada"|(VD4009=="Empregador"&V4019=="Não")|(VD4009=="Conta-própria"&V4019=="Não")|VD4009=="Trabalhador familiar auxiliar","Pessoas na informalidade","Pessoas na formalidade"))))



#Criando Informalidade para Cuiabá:
dadosPNADCCba20224$variables <- transform(dadosPNADCmt20223$variables, informalidade=as.factor(ifelse(is.na(VD4009),NA,
                                                                                                     ifelse(VD4009=="Empregado no setor privado sem carteira de trabalho assinada"|VD4009=="Trabalhador doméstico sem carteira de trabalho assinada"|(VD4009=="Empregador"&V4019=="Não")|(VD4009=="Conta-própria"&V4019=="Não")|VD4009=="Trabalhador familiar auxiliar","Pessoas na informalidade","Pessoas na formalidade"))))


#Criando Informalidade para Baixada Cuiabana:
dadosPNADCBaixadaCba20224 <- transform(dadosPNADCmt20223$variables, informalidade=as.factor(ifelse(is.na(VD4009),NA,
                                                                                                     ifelse(VD4009=="Empregado no setor privado sem carteira de trabalho assinada"|VD4009=="Trabalhador doméstico sem carteira de trabalho assinada"|(VD4009=="Empregador"&V4019=="Não")|(VD4009=="Conta-própria"&V4019=="Não")|VD4009=="Trabalhador familiar auxiliar","Pessoas na informalidade","Pessoas na formalidade"))))     


##### Verificando as estatísitcas e números com os divulgados pelo IBGE:#####
#Total de pessoas por UF#
svytotal(~UF, design =  dadosPNADc20224)


#Total por sexo nos estratos geográficos# 
svytotal(~ V2007, dadosPNADc20224, na.rm = TRUE) 
svytotal(~ V2007, dadosPNADCmt20224, na.rm = TRUE) 
svytotal(~ V2007, dadosPNADCCba20224, na.rm = TRUE) 
svytotal(~ V2007, dadosPNADCBaixadaCba20224, na.rm = TRUE) 

#Total por raça/etnia nos estratos geográficos# 
svytotal(~ V2010, dadosPNADc20224, na.rm = TRUE) 
svytotal(~ V2010, dadosPNADCmt20224, na.rm = TRUE) 
svytotal(~ V2010, dadosPNADCCba20224, na.rm = TRUE) 
svytotal(~ V2010, dadosPNADCBaixadaCba20224, na.rm = TRUE) 


#Total status de formlalidade/informalidade por estrato geográfico#
svytotal(~ informalidade, dadosPNADc20224, na.rm = TRUE) 
svytotal(~ informalidade, dadosPNADCmt20224, na.rm = TRUE) 
svytotal(~ informalidade, dadosPNADCCba20224, na.rm = TRUE) 
svytotal(~ informalidade, dadosPNADCBaixadaCba20224, na.rm = TRUE) 
