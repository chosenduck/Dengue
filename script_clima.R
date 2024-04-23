# Coleta de Dados Metereológicos - Brasil ======================================
# Link para download dos arquivos: https://portal.inmet.gov.br/dadoshistoricos 
# Créditos: João Victor Fernandes: https://github.com/chosenduck

#Limpando todos os objetos atualmente ativos no Ambiente (Environment) =========
rm(list=ls(all=T))

# Ajustar a referencia da pasta dos dados ======================================
setwd("")

# Bibliotecas ==================================================================
if (!require(pacman))
  install.packages("pacman")

require(pacman)

p_load(ggplot2, tidyverse, readr, dplyr, janitor)

# Dados ========================================================================
fs::dir_ls("Clima/automaticas INMET") #listando arquivos

#criando vetores por UF ========================================================
distrito_federal <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_CO_DF_") 
distrito_federal

goias <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_CO_GO_") 
goias

mato_grosso_do_sul <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_CO_MS_") 
mato_grosso_do_sul

mato_grosso <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_CO_MT_") 
mato_grosso

acre <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_N_AC_") 
acre

amapa <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_N_AP_") 
amapa

amazonas <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_N_AM_") 
amazonas

para <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_N_PA_") 
para

rondonia <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_N_RO") 
rondonia

roraima <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_N_RR") 
roraima

tocantins <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_N_TO") 
tocantins

alagoas <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_NE_AL_") 
alagoas

bahia <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_NE_BA") 
bahia

ceara <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_NE_CE_") 
ceara

maranhao <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_NE_MA") 
maranhao

paraiba <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_NE_PB") 
paraiba

pernambuco <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_NE_PE") 
pernambuco

piaui <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_NE_PI_") 
piaui

rio_grande_do_norte <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_NE_RN_") 
rio_grande_do_norte

sergipe <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_NE_SE_") 
sergipe

parana <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_S_PR_") 
parana

rio_grande_do_sul <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_S_RS_") 
rio_grande_do_sul

santa_catarina <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_S_SC_") 
santa_catarina

espirito_santo <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_SE_ES_") 
espirito_santo

minas_gerais <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_SE_MG_") 
minas_gerais

rio_de_janeiro <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_SE_RJ_") 
rio_de_janeiro

sao_paulo <- fs::dir_ls("Clima/automaticas INMET", regexp = "INMET_SE_SP") 
sao_paulo

# criando bd com arquivos ======================================================

#descobrindo enconding dos arquivos
caminho_arquivo <- "Clima/automaticas INMET/INMET_N_AC_A102_PARQUE ESTADUAL
+ CHANDLESS_01-01-2014_A_31-12-2014.CSV" #cole o arquivo aqui
resultado <- guess_encoding(caminho_arquivo)
print(resultado)

df_acre <- acre %>%
  purrr::map(~ readr::read_csv2(.x, locale = locale(encoding = "ASCII"))) %>%
  purrr::list_rbind()

