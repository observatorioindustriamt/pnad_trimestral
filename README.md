# pnad_trimestral
#pacotes básicos# 
if (!require("install.load")) install.packages("install.load")
suppressMessages(install.load::install_load("tidyverse", "survey", "haven", "labelled"))

#Instala pacote para baixar microdados direto do IBGE# 
install.packages("PNADcIBGE")
library("PNADcIBGE")

#A logica do comando é para baixar/criar os dados no objeto é composta pelo preencimento do ano e, em seguida, o quartil(aqui entendido como semestre)#
dadosPNADc20223 <- get_pnadc(year = 2022, quarter = 3)

#Para criar um objeto especifico de dados com as informações de Mato Grosso (ou qualquer outro estado)# 
dadosPNADCmt20223 <- dadosPNADc[dadosPNADc$variables$UF == "Mato Grosso",] 

#a leitura dos dados deve ser sempre realizada com as funcoes do pacote survey visto que se tratam de microdados extraídos de pesquisa amostral com pesos atribuidos.# 
#verificando os números de principais variaveis com o do site.# 
svytotal(~ VD4001, design =  dadosPNADCmt20223, na.rm = TRUE)
svytotal(~ VD4002, design =  dadosPNADCmt20223, na.rm = TRUE)
#sexo#
svytotal(~V2007, design =  dadosPNADCmt20223)
#raca#
svytotal(~V2010, design =  dadosPNADCmt20223)
#UF#
svytotal(~UF, design =  dadosPNADCmt20223)

#após verificar os principais resultados com os de divulgação, criar variavel/indicador de informalidade. o indicador é construído a partir de várias condicionais de outras variaveis presente na pesquisa, não possuindo o indicador pronto (como desocupados, desalentos, que serão apresentados a frente):#

dadosPNADCmt20223$variables <- transform(dadosPNADCmt20223$variables, informalidade=as.factor(ifelse(is.na(VD4009),NA,
                                                                                         ifelse(VD4009=="Empregado no setor privado sem carteira de trabalho assinada"|VD4009=="Trabalhador doméstico sem carteira de trabalho assinada"|(VD4009=="Empregador"&V4019=="Não")|(VD4009=="Conta-própria"&V4019=="Não")|VD4009=="Trabalhador familiar auxiliar","Pessoas na informalidade","Pessoas na formalidade"))))

#verificando o total de informais com o divulgado pelo IBGE:# 

svytotal(~ informalidade, dadosPNADCmt20223, na.rm = TRUE) 

#cruzando a variavel de informalidade com sexo, grau de instrucao e raça/cor, respectivamente.# 

#informalidadeporsexo#
svyby(~informalidade, ~V2007, design =  dadosPNADCmt20223, na.rm = TRUE, svytotal)

#informalidadeporinstrução#
svyby(~informalidade, ~VD3004, design =  dadosPNADCmt20223, na.rm = TRUE, svytotal)

#informalidadeporraça/cor# 
svyby(~informalidade, ~V2010, design =  dadosPNADCmt20223, na.rm = TRUE, svytotal)

#cruzando a variavel de ocupado/desocupado com sexo, grau de instrucao e raça/cor, respectivamente.# 
#ocupacaoporsexo#
svyby(~ V2007, ~VD4002, design =  dadosPNADCmt20223, svytotal)

#ocupacaoporraca
svyby(~ V2010, ~VD4002, design =  dadosPNADCmt20223, svytotal)

#ocupacaoporgraudeintrução
svyby(~VD3004, ~VD4002, design =  dadosPNADCmt20223, svytotal)

#cruzando a variavel de desalento com sexo, grau de instrucao e raça/cor, respectivamente.# 
#desalentoporraca
svyby(~ V2010, ~VD4005, design =  dadosPNADCmt20223, svytotal)

#desalentoporsexo 
svyby(~ V2007, ~VD4005, design =  dadosPNADCmt20223, svytotal)

#desalentoporinstrucao 
svyby(~ VD3004, ~VD4005, design =  dadosPNADCmt20223, svytotal)

#####taxa de desocupação para brasil#####
svyratio(numerator=~(VD4002=="Pessoas desocupadas"), denominator=~(VD4001=="Pessoas na força de trabalho"), design= dadosPNADc20223 , na.rm=TRUE)

#####gini da renda Brasil##### 
dadosPNADc20223 %>%
convey_prep() %>% 
svygini(formula=~VD4020, na.rm=TRUE)

#####gini da renda por UF##### 
gini_uf <- dadosPNADc20223 %>%
convey_prep() %>% 
svyby(formula=~VD4020, by=~UF, FUN= convey::svygini, na.rm=TRUE)

#####representacao grafica gini UF##### 
gini_uf %>%
  dplyr::as_tibble() %>%
  dplyr::mutate(UF = forcats::fct_reorder(UF, VD4020)) %>%
  ggplot2::ggplot(ggplot2::aes(x = VD4020, y = UF)) +
  ggplot2::geom_col(fill = "darkblue") +
  ggplot2::theme_classic() +
  ggplot2::labs(
    title = "Índice de Gini por Estado",
    subtitle = "Dados do 3º trimestre de 2022",
    x = NULL,
    y = NULL,
    caption = "Fonte: Microdados PNADC-T/IBGE"
  )

#####renda media por UF#####
mediaRendaUF <- svyby(~VD4020, ~UF, dadosPNADc20223, svymean, na.rm = T)

#####curva lorenz da renda##### 
svylorenz(formula=~VD4020, design=dadosPNADc20223, quantiles=seq(0,1,0.05), na.rm=TRUE)

#####teste gráfico com outras variaveis#####
#horas trabalhadas
svyhist(formula=~as.numeric(VD4035), design = dadosPNADCmt20223, main="Histograma Mato Grosso", xlab="Número de Horas Trabalhadas")

#horas trabalhadas e rendimento efetivo 
svyplot(formula=VD4020~VD4035, design=dadosPNADCmt20223, main="Horas e Rendimento: Mato Grosso", style="bubble", xlab="Número de Horas Efetivamente Trabalhadas", ylab="Rendimento Efetivo")

#instrucao e rendimento
svyplot(formula=VD4020~VD3004, design=dadosPNADCmt20223, main="Instrução e Rendimento: Mato Grosso", style="bubble", xlab="Níveis de instrução", ylab="Rendimento Efetivo")

#raça e rendimento
svyplot(formula=VD4020~V2010, design=dadosPNADCmt20223, main="Raça e Rendimento: Mato Grosso", style="bubble", xlab="Cor ou raça", ylab="Rendimento Efetivo")


