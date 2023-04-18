#Os dados da Pesquisa Nacional Amostral por Domicílios Contínua (PNAD C) é uma importante fonte para acompanhamento de indicadores relacionados a população. Neste projeto, o objetivo principal é o acompnhamento da força de trabalho em Mato Grosso# 

#Os dados da PNADC exigem a instalação e utilização do pacote "survey" e todas as análises e manipulações dos dados devem ser feitas utilizando as funções contidas no pacote.# 

install.packages("survey")
library("survey")

#Os microdadosdados da PNADC são disponibilizados atraves de pacote próprio elaborado pela equipe do IBGE, sendo o "PNADcIBGE", para a utilização também deve realizar o download e carregamento do pacote#

install.packages("PNADcIBGE")
library("PNADcIBGE")

#Outros pacotes importantes utilizados no projeto seguem abaixo#

if (!require("install.load")) install.packages("install.load")
suppressMessages(install.load::install_load("tidyverse", "survey", "haven", "labelled"))
library(tidyverse)
library(dplyr)
library(round)
library(MASS)
library(psych)
library(stargazer)
library(corrplot)
library(car)
install.packages("pchisq")
install.packages("apply_if_")
library("stargazer")
library(DescTools)
library(pscl)
library(jtools)
library(bclust)
install.packages("modEvA")
library(convey) 

#Após a realização dos downloads de todos pacotes, se realiza o download do dados atraves da função "get_pnadc" do pacote mencionado anteriormente "PNADcIBGE"#
#Os principais argumentos utilizados no download é referente ao ano e o quartil, que indica o trimestre, conforme abaixo, onde é realizado o download dos dados do 4º trimestre de 2022.#

dadosPNADc20224 <- get_pnadc(year = 2022, quarter = 4)

#Outros importantes argumentos que podem ser utilizados pela função são "vars", "labels", "deflator", "design" e #savedir", onde:#
#vars: argumento utilizado para download de variáveis selecionados. Útil para quando for se utilizar universo reduzido de variáveis"#
#labels:Um argumento lógico que indica se os níveis das variáveis categóricas devam ser rotuladas de acordo com o dicionário da pesquisa. O default é rotulá-los;#
#deflator: Um argumento lógico que indica se as variáveis para deflacionamento serão incluídas nos microdados. O default é incluí-las;#
#design: Um argumento lógico que indica se a função deve retornar um objeto do plano amostral para análise com o pacote survey. Caso design=FALSE, a função retorna apenas um data-frame com os microdados.# 
#savedir: O endereço onde devem ser salvos os arquivos baixados. Padrão é utilizar uma pasta temporária.#

#EXEMPLO: Em um exemplo caso o desejo seja realizar o download de variáveis selecionadas sem o design do peso amostral:#
 
dadosPNADc20224_brutos <- get_pnadc(year=2022, quarter=4, vars=c("VD4001","VD4002"), design=FALSE)

#Para realização do projeto atual, se utiliza os estratos geográficos Estado, Região Metropolitana e Município Capital. Cria-se, a partir do download dos dados de todo o Brasil o objeto com os estratos desejados#

#Para Mato Grosso:
dadosPNADCmt20224 <- dadosPNADc20214[dadosPNADc20214$variables$UF == "Mato Grosso",]

#Para Cuiabá:
dadosPNADCCba20224 <- dadosPNADCmt20224[dadosPNADCmt20224$variables$Capital %in% "Município de Cuiabá (MT)"]

#Para Baixada Cuiabana: 
dadosPNADCBaixadaCba20224 <- dadosPNADCmt20224[dadosPNADCmt20224$variables$RM_RIDE %in% "Região Metropolitana de Vale do Rio Cuiabá (MT)",]


