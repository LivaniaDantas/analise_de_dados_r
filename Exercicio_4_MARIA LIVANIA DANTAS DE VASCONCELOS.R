
## Carregue o banco world do pacote poliscidata

library(poliscidata)
library(tidyverse)

banco <- world

# Para mais detalhes sobre esses dados, digite ?world

?world

###############################################################################

## Queremos testar a relação entre a variável hi_gdp, que mede se um país 
## tem crescimento economico alto, e a variável gini08, que mede a desigualdade.

#Identificando as variáveis

banco$hi_gdp
banco$gini08 

summary(banco$hi_gdp)
summary(banco$gini08)

#A variável independente (VI) "Crescimento Economico" (hi_gdp), do tipo Qualitativa (categorica - dummy) que assume dois valores "Low GDP" e "High GDP".

#A variável Dependente (VD) "Coeficiente de Gini2008" (gini08) do tipo Quantitativa - Contínua, que mensura a desigualdade de renda, que quanto mais próximo de 100, mais desigual é o país e quanto mais próximo de 0, menos desigual.


## Qual teste seria adequado para verificar a associação entre estas variáveis?

# Para medir a associação entre os tipos das variáveis identificadas acima, onde temos uma variável do tipo Categorica e outra do tipo Quantitativa é recomendado o teste-t.


## Realize o teste abaixo

#Removendo os missings das observações

banco <- banco %>%
  remove_missing(vars = c("hi_gdp", "gini08"))

#Aplicando o Test-T

banco %>%
  group_by(hi_gdp) %>%
  summarise(mediana = median(gini08, na.rm = T),
            media = mean(gini08, na.rm = T),
            desvio = sd(gini08, na.rm = T))

t.test(gini08 ~ hi_gdp, data = banco)
  

## Quais são suas conclusões sobre a relação entre estas variáveis? Por que?

#Observando a existência de diferença entre as médias:
#Para verificar se existe diferença estatística significante entre as variáveis foi aplicado o teste de diferença de médias, que permitiu observar que baixo crescimento (Low GDP) apresenta uma média de 42,5 em relação a variável (gini08) que mede a desigualdade e que alto crescimento (High GDP) apresenta uma média de 38,4 em relação a variável (gini08). 

#Para observar a significância entre as médias aplicou-se o teste-t que apresentou um p-valor de 0,02617 < 0,05, permitindo rejeitar a hipótese nula ou seja conclui-se com base no p-valor baixo que existe associação entre crescimento econômico e desigualdade estatisticamente significante.

#O teste-t também apresenta o intervalo de confiança para a diferença entre as médias que foi de [0.4930459; 7.6713332], como o valor 0 não está no intervalo de confiança é permitido concluir que existe diferença com significância estatística entre os grupos. 

#As médias da variáviel gini08 para os grupos da variável categórica, que são apresentadas no teste-t indicam valores de 42,5 para baixo crescimento econômico  e  38,4 para alto crescimento econômico, permitindo interpretar que um baixo crescimento econômico tende a acompanhar um índice de maior desigualdade.


## Faça um gráfico que mostre a associação entre estas duas variáveis

ggplot(banco, aes(hi_gdp, fill = gini08)) +
  geom_density(alpha = 0.8)   

ggplot(banco, aes(gini08, fill = hi_gdp)) +
  geom_density(alpha = 0.3)



###############################################################################

## Queremos testar a relação entre a variável fhrate08_rev, que mede o nível de 
## democracia de um país, e a variável gini08, que mede a desigualdade.


####Identificando as variáveis

#fhrate08_rev - mede o nível de democracia de um país

str(banco$fhrate08_rev)  ####Variável Quantitativa - Discreta (VI)
str(banco$gini08)  ####Variável Quantitativa - Contínua (VD)


## Qual teste seria adequado para verificar a associação entre estas variáveis? 
# Observando que as variáveis variáveis são do tipo quantitativas (numéricas), para esse caso é indicado utilizar o coeficiente de correlação r de Pearson


## Realize o teste abaixo

#Removendo os missings das observações

banco <- banco %>%
  remove_missing(vars = c("fhrate08_rev"))

#Aplicando o coeficiente de correlação r de Pearson

cor.test(banco$fhrate08_rev, banco$gini08)


## Quais são suas conclusões sobre a relação entre estas variáveis? Por que?

#Com o p valor = 0,08387 que é menor que 0,05, com base neste valor não é possível concluir que existe uma diferença significativa entre as variáveis. Nesse caso, não se rejeita hipótese nula, portanto, não existe evidências suficientes de que as duas variáveis, fhrate08_rev, que mede o nível de democracia de um país, e a variável gini08, que mede a desigualdade são associadas.

#Os demais resultados observados são: 
#A correlação entre as duas variáveis é de -0,1578002 que pode variar dentro do intervalo de 95% de confiança que entre [-0,3271; 0,0213], como o valor 0 está dentro desse intervalo de correlação o resultado demonstra que não possui significância estatística.


## Faça um gráfico que mostre a associação entre estas duas variáveis


ggplot(banco, aes(gini08,fhrate08_rev )) +
  geom_point()

#Conforme o gráfico não é possível verificar uma associação entre as variáveis.


###############################################################################

## Queremos testar a relação entre a variável free_overall_4, que mede a 
## liberdade economica de um país, e a variável gini08, que mede a desigualdade.

#Identificando as variáveis

#free_overall_4 -  mede a liberdade economica de um país

str(banco$free_overall_4) ####Variável Categórica de quatro níveis (VI)
str(banco$gini08)  ####Variável Quantitativa - Contínua (VD)

## Qual teste seria adequado para verificar a associação entre estas variáveis?

# O teste de análise de variância ANOVA , que serve para medir a associação entre uma variável numérica e uma variável categória que possui mais de dois níveis.


## Realize o teste abaixo

teste_anova <- aov(banco$gini08 ~ free_overall_4, data = banco)
summary(teste_anova)

TukeyHSD(teste_anova)


## Quais são suas conclusões sobre a relação entre estas variáveis? Por que?

# O p-valor (‘Pr(>F))´no resultado foi de 0.00672, como  o teste demonstrou um p-valor baixo temos confiança em rejeitar a hipótese nula. Neste caso, o p´-valor nos dá um resultado dá evidência de associação entre as variáveis.

#O resultado do Teste de Tukey exibe uma linha para cada combinação possível entre os grupos da variável free_overall_4, que mede a liberdade econômica de um país, desta forma é possível verificar que  o p-valor ajustado, para os intervalos categóricos MidLow-Low, MidHi-Low, MidHi-MidLow, High-MidLow, High-MidHi foi maior que 0,05, indicando que essa diferença entre esses grupos não é significante estatisticamente, isso também pode ser observado pelo valor zero dentro dos intervalos. o intervalo High-Low foi o úncio que apresentou o p-valor ajustado menor que 0,05, que foi de 0,004 indicando que a diferença dessa média é significante, fato também confirmado observando que o valor zero não está dentro do intervalo. 

## Faça um gráfico que mostre a associação entre estas duas variáveis


ggplot(banco, aes(gini08, fill = free_overall_4)) +
  geom_density(alpha = 0.4)


###############################################################################

## Queremos testar a relação entre a variável free_overall_4, que mede a 
## liberdade economica de um país, e a variável hi_gdp, que mede se um país 
## tem crescimento economico alto

#Identificando as variáveis

#hi_gdp - mede Crescimento Economico, do tipo Qualitativa (categorica - dummy) que assume dois valores "Low GDP" e "High GDP".

#free_overall_4 -  mede a liberdade economica de um país

str(banco$free_overall_4) ####Variável Categórica (4 níveis) (VI)
str(banco$hi_gdp)  ####Variável Categórica (2 níveis) - Contínua (VD)


## Qual teste seria adequado para verificar a associação entre estas variáveis?

# Para variáveis do tipo categóricas o teste indicado é o Chi-Quadrado.

## Realize o teste abaixo

chisq.test(banco$free_overall_4, banco$hi_gdp)

## Quais são suas conclusões sobre a relação entre estas variáveis? Por que?

# Conforme o resultado do teste: X-squared = 61.253, df = 3, p-value = 3.173e-13
#O resultado indica um valor alto de X² e um baixo p-valor, com base nesses valores podemos rejeitar a hipótese nula de que as variáveis não estão associads. 

#Com base nos valores e no gráfico podemos concluir a existência de evidências na associação entre a variável free_overall_4, que mede a liberdade economica de um país, e a variável hi_gdp, que mede se um país tem crescimento econômico alto. portanto, países com alta liberdade econômica estão relacionados com um alto crescimento econômico, assim como países com baixa liberdade econômica estão relacionados com um baixo crescimento econômico.


## Faça um gráfico que mostre a associação entre estas duas variáveis

ggplot(banco, aes(free_overall_4, fill = hi_gdp)) +
  geom_bar(position = "fill")




