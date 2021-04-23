
library(poliscidata)
library(tidyverse)

## Carregue o banco world do pacote poliscidata


banco_world <- world
banco_world

# Para mais detalhes sobre esses dados, digite ?world

?world
glimpse(banco_world)
view(banco_world)

###############################################################################

# Utilizando o banco world do pacote poliscidata, faça um histograma, um 
# boxplot e a curva de densidade da variável gini10. Descreva o que você pode 
# observar a partir deles.

##########Histograma da variável gini10

ggplot(banco_world, aes(gini10)) + geom_histogram()
summary(banco_world$gini10)

par(mfrow = c(2, 4))

#O coeficiente de Gini é um dos principais indicadores para medir desigualdade social nos países. Os valores são medidos entre 0 e 1, sendo que quanto mais perto de 0, menor é a desigualdade social de um local. Com base no histograma aplicado a variável gini10, é possível observar visualmente a assimetria dos dados, com uma distrivuição concentrada à esqueda, na faixa entre 45 e 30, neste intervalo é observado o atingimento do maior pico da frequência. Logo, pode-se inferir que a distribuição de renda nos países pesquisados não seguem uma distribuição normal e tendem a se distanciar de 1, também é possível identificar a presença de outlier ultrapassando 70, ou seja bem próximo a 1.


#######boxplot da variável gini10

ggplot(banco_world, aes(y = gini10)) + geom_boxplot()
summary(banco_world$gini10)

#######Observação sobre o Boxplot
###O boxplot apresenta as medidas descritivas, especificando os quartis e o intervalo interquatil. Em relação a aplicação da variável gini10 podemos verificar no gráfico gerado que existe a presença de outlier e que a mediana está em torno de 39, representada pela linha do meio da caixa linha mais espessa), abaixo deste valor tem-se a concentração dos 50% das observações contidas nesta variável, no primeiro quartil, representado pela linha inferior da caixa tem-se a concentração  

46.70 - 33.50 #IIQ

46.70 + (1.5 * 13.2)#outlier está acima desse valor e recebe esses valores



########### Curva de densidade da variável gini10


ggplot(banco_world, aes(x = gini10)) + geom_density()


ggplot(banco_world, aes(gini10)) +
  geom_histogram(aes(y=..density..)) +
  geom_density() +
  geom_vline(aes(xintercept = mean(gini10, na.rm = T)))




# Faça um grafico que descreva a variável regime_type3 e descreva o resultado


ggplot(banco_world, aes(x = regime_type3)) + geom_bar()

ggplot(banco_world, aes(fct_infreq(regime_type3))) +
  geom_bar()



# A partir da varável X do banco df abaixo
df <- data.frame(x = cos(seq(-50,50,0.5)))
# Faça os tipos de gráficos que representem esse tipo de variável
# comentando as diferenças entre elas e qual seria a mais adequada

df <- data.frame(x = cos(seq(-50,50,0.5)))
df

ggplot(df, aes(x)) + geom_histogram()

ggplot(df, aes(x)) + geom_boxplot()

ggplot(df, aes(x)) + geom_density()

ggplot(df, aes(x = "", y = x)) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))

summary(df)




# Carregue o banco states que está no pacote poliscidata 

banco_states <- states 

# Carregue o banco nes que está no pacote poliscidata

banco_nes <- nes 

# As variáveis conpct_m e ftgr_cons medem o nível de conservadorismo dos
# respondentes. A diferença é que o nes é um banco de
# dados com surveys individuais e o states é um banco de dados
# com informações por estado
# Faça um gráfico para ambas as variáveis. Comente as conclusões que podemos ter
# a partir deles sobre o perfil do eleitorado estadunidense.

?states
glimpse(states)
states$conpct_m
summary(states$conpct_m)
summarise(states)
summary(states)




ggplot(banco_nes, aes(x = "", y = ftgr_cons )) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))


ggplot(banco_states, aes(x = "", y = conpct_m )) +
  geom_violin(draw_quantiles = c(0.25, 0.5, 0.75))

ggplot(banco_states, aes(x = satate, y = conpct_m)) + geom_bar()

ggplot(banco_states, aes()) + geom_bar()

ggplot(banco_states, aes()) + geom_histogram()

ggplot(df, aes(x)) + geom_boxplot()

ggplot(df, aes(x)) + geom_density()
