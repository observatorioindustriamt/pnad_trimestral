###### Construcao do Indice de Gini para todo Brasil. O indicador mede a desigualdade de renda. Foi utilizado a variável que mede rendimentos habituais ######

#Indice de Gini para Brasil#
 
dadosPNADc20224 %>%
convey_prep() %>% 
svygini(formula=~VD4019, na.rm=TRUE)


#Indice de Gini para todas Unidadaes da Federação#

gini_uf224 <- dadosPNADc20224 %>%
convey_prep() %>% 
svyby(formula=~VD4019, by=~UF, FUN= convey::svygini, na.rm=TRUE)

#Exportando o table criado#

write.table(gini_uf224, file="gini_uf224 .csv", sep=";", dec = ",",  row.names = FALSE, eol = "\r\n")

#Representacao gráfica de Gini para todas UFs#

gini_uf224 %>%
  dplyr::as_tibble() %>%
  dplyr::mutate(UF = forcats::fct_reorder(UF, VD4020)) %>%
  ggplot2::ggplot(ggplot2::aes(x = VD4020, y = UF)) +
  ggplot2::geom_col(fill = "darkblue") +
  ggplot2::theme_classic() +
  ggplot2::labs(
    title = "Índice de Gini por Estado",
    subtitle = "Dados do Xº trimestre de 202X",
    x = NULL,
    y = NULL,
    caption = "Fonte: Microdados PNADC-T/IBGE"
  )


