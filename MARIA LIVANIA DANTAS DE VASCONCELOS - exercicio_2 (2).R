
# No pacote poliscidata existe um banco de dados chamado nes, com informa??es 
# do American National Election Survey. Para os exer?cicios a seguir, instale 
# o pacote poliscidata e tidyverse, carregue-os e crie um objeto chamado
# df com os dados do nes. 

install.packages("poliscidata")
library (poliscidata)

install.packages("tidyverse")
library(tidyverse)

df <- nes




# Fa?a uma primeira explora??o do banco de dados com todos os comandos
# passados at? aqui que possuem esse objetivo

head(df)
tail(df)
str(df)
summary(df)
glimpse (df)





# Quantos respondentes possui na pesquisa?

# 5.916




# Caso queiram ter mais informa??es sobre as vari?veis do nes, basta rodar
# o c?digo `?nes`, que no canto inferior direito aparecer? uma descri??o.
# Como temos muitas vari?veis, deixe apenas as colunas
# ftgr_cons, dem_raceeth, voted2012, science_use, preknow3, obama_vote
# income5, gender.

?nes

df_selecionado <-df %>% 
  select(ftgr_cons, dem_raceeth, voted2012, science_use, preknow3, obama_vote,
         income5, gender)
glimpse(df_selecionado)


df_selecionado$voted2012


# Se quisermos ter informa??es apenas de pessoas que votaram na
# elei??o de 2012, podemos usar a vari?vel voted2012. Tire do banco
# os respondentes que n?o votaram

df_selecionado$voted2012

df_filtrado <- df_selecionado %>%
  filter(voted2012 == "Voted", na.rm = TRUE)

glimpse(df_filtrado)




# Quantos respondentes sobraram?
#4.404






# Crie uma vari?vel chamada white que indica se o respondente ? branco
# ou n?o a partir da vari?vel dem_raceeth, crie a vari?vel ideology a
# partir da vari?vel ftgr_cons (0-33 como liberal, 34 a 66 como centro,
# e 67 a 100 como conservador), ao mesmo tempo em que muda
# a vari?vel obama_vote para trocar o 1 por "Sim" e 0 por "n?o"

df_filtrado$dem_raceeth

df_filtrado$ftgr_cons

df_filtrado$obama_vote

df_adicionado <- df_filtrado %>% 
  mutate(white = recode(dem_raceeth, "1. White non-Hispanic"= "branco", "2. Black non-Hispanic" = "nao branco", "3. Hispanic" = "nao branco", "4. Other non-Hispanic" = "nao branco")) %>% 
  mutate(ideology = case_when(ftgr_cons >= 0 & ftgr_cons <= 33 ~ "liberal", ftgr_cons >= 34 & ftgr_cons <= 66 ~ "centro", ftgr_cons >= 67 & ftgr_cons <= 100 ~ "conservador")) %>% 
  mutate(obama_vote = case_when(obama_vote == 1 ~ "Sim", obama_vote == 0 ~ "nao"))


glimpse(df_adicionado)

summary(df_adicionado)


# Demonstre como observar a quantidade de pessoas em cada uma das
# categorias de science_use

df_adicionado %>% 
  count(science_use)

df_adicionado %>% 
  count(science_use, sort = T)





# Demonstre como observar a m?dia de conservadorismo (vari?vel 
# ftgr_cons) para cada categoria de science_use

df_conservador<- df_adicionado %>%
  filter(ftgr_cons >= 67 & ftgr_cons <= 100)
glimpse(df_conservador)


df_conservador %>% 
  group_by(science_use) %>% 
  summarise(media = mean(ftgr_cons, na.rm = TRUE))

  



###############################################################################

# Responder as quest?es te?ricas da aula abaixo

# Observar a figura 1.2 do livro Fundamentals of Political Research e
# fazer o mesmo esquema para o trabalho final de voc?s (ou projeto de pesquisa).

###Resposta

#Variável Independente (VI)
#Variável Dependente (VD)

# Candidaturas fictícias causa o baixo
# (VI) Candidaturas fictícias (fraudulentas) – Em determinado pleito eleitoral, partidos políticos registram candidaturas de mulheres em suas listas de candidatos para cumprir a cota mínima de 30% para cada gênero. 

#Operacionalização da VI – a observação será realizada através dos gastos de campanha, a métrica de mensuração: quantitativa contínua.

#(VD) Desempenho eleitoral – refere-se à vitória da candidata no pleito analisado.

#Operacionalização da VI – será observado o número de acentos conquistados por mulheres nas casas legislativas, métrica de mensuração: quantitativa discreta.

#Hipótese: Partidos políticos utilizam a lei de cotas de gênero para servir a outros interesses.



# Qual ? a disponibilidade de dados para sua pesquisa? J? existem bancos de 
# dados prontos? Voc? tem acesso a eles? Caso a ?ltima pergunta seja positiva, 
# responda o exer?cio 4 do cap?tulo 5.

#A) Os dados são mantidos no Repositório de Dados Eleitorais do TSE, tem por objetivo reunir informações das eleições disponibilizando acesso a arquivos que podem ser baixados por meio de softwares estatísticos.

#B) Resposta: O banco é Organizado pela área de Estatística do TSE e oferece informações por meio através de banco de dados brutos que podem ser baixados por meio de softwares estatísticos e são atualizados a cada pleito eleitoral.

#C) Sim, o método demonstra confiabilidade por ser uma base institucional e  disponibilizados pelo TSE, que registra todas as informações das prestações de contas obrigatórias dos partidos e candidatos, como também demais informações levantadas pelo próprio órgão, o repositório é apresentado pela instituição como uma importante ferramenta que garante a transparência das informações geridas pela Justiça Eleitoral.

# D) 
#Validade de Face – A variável será medida valores monetário que é o formato disponibilizado pelo repositório.
#Validade de Conteúdo – Conceito a ser medido, volume de investimento na campanha eleitoral.
#Validade de Constructo – Estudos na área demonstra uma forte relação em gasto de campanha com o sucesso do candidato.



# Qual seria a forma ideal e mais adequada de operacionalizar suas
# vari?veis para testar sua hip?tese? Escreva sobre a confiabilidade e validade
# que suas vari?veis possam vir a ter

# Resposta contemplada acima
