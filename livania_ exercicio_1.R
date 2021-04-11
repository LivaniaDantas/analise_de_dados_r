
# Entre no seguinte link:
# https://pt.wikipedia.org/wiki/Eleição_presidencial_no_Brasil_em_2002
# Vá até o tópico RESUMO DAS ELEICOES
# Crie um vetor com o nome dos seis candidatos a presidência

candidatos <- c("Luiz Inacio Lula da Silva", 
                "Jose Serra", 
                "Anthony Garotinho",
                "Ciro Gomes", 
                "José Maria de Almeida",
                "Rui Costa Pimenta")
candidatos

# Crie um vetor com a sigla do partido de cada candidato

partido <- c("PT", "PSDB", "PSB", "PPS", "PSTU", "PCO")
partido

# Crie um vetor com o total de votos de cada candidato
  
votos_candidatos <- c(39455233, 19705445, 15180097, 10170882, 402236, 38619)
votos_candidatos

# Crie um objeto calculando a soma do votos dos candidatos no 1o turno
  
total_votos <- sum(votos_candidatos)
total_votos


# Crie um vetor com a porcentagem de votos de cada candidato
# fazendo uma operação aritmética entre o objeto votos_candidatos
# e o objeto total_votos

porcentagem_votos <- c(votos_candidatos/total_votos)
porcentagem_votos

# Crie um dataframe com o nome dos candidatos, o partido,
# a quantidade de votos e o percentual

banco <- data.frame(candidatos,partido,votos_candidatos,porcentagem_votos)
banco

banco <- data.frame(candidatos,partido,votos_candidatos,porcentagem_votos)
banco


  
# Crie um vetor lógico, indicado TRUE ou FALSE, com a informacao se
# o candidato foi para o segundo turno

segundo_turno <- c(TRUE,TRUE,FALSE,FALSE,FALSE,FALSE)
segundo_turno
  

# Adicione esta coluna no dataframe
 
banco_2 <- banco
banco_2

banco_2 <- data.frame(candidatos,partido,votos_candidatos,
                     porcentagem_votos,segundo_turno)
banco_2


# Calcule a soma da porcentagem dos dois candidatos que obtiveram mais votos

candidatos_mais_votados <- sum(banco_2[1,4],banco_2[2,4]) 

candidatos_mais_votados

# Exiba as informações do dataframe dos dois candidatos com mais votos

banco_2[1:2,]


###############################################################################

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
# [1] 24 18 31

q <- c(47, 24, 18, 33, 31, 15)
q[c(2,3,5)]

###############################################################################

# Substitua o símbolo de interrogação por um 
# código que retorne o seguinte resultado:
#
# 'data.frame':	2 obs. of  2 variables:
# $ x: Factor w/ 2 levels "d","e": 1 2
# $ y: num  1 4

df <- data.frame(x = factor(x <-c("d","e")),
                 y = c(1,4))

str(df)

###############################################################################

# Crie o seguinte dataframe df
#
# df
#    x  y    z
# 1 17  A  Sep
# 2 37  B  Jul
# 3 12  C  Jun
# 4 48  D  Feb
# 5 19  E  Mar

df <- data.frame(x = x <- c(17,37,12,48,19), y = y <- c("A","B","C","D","E"), 
                 z = z <- c("Sep","Jul","Jun","Feb","Mar"))
df


# Ainda utilizando o dataframe df,
# qual código produziria o seguinte resultado?
#
#    x  y
# 1 17  A
# 2 37  B
# 3 12  C

df[1:3,c("x","y")]


###############################################################################

# Responder os exercícios teóricos abaixo
# A partir do seu projeto de mestrado ou da ideia de trabalho final:
# 1) elaborar uma explicação causal teórica

#Tema: Desigualdade entre homens e mulheres nos espaços de poder político

#A sub-representação feminina ainda é um caso concreto nas instâncias políticas,mesmo com o advento da Lei nº 9.504,de 30 de setembro de 1997, que garante o preenchimento mínimo de 30% (trinta por cento) e o máximo de 70% (setenta por cento) para candidaturas de cada sexo.
#As mulheres representam 51% da população e 52% do eleitorado no Brasil, no entanto a mesma proporcionalidade não se registra nos espaços de poderes políticos, legislativo e executivo. O resultado das eleições municipais de 2020 permite observar com clareza essa disparidade, onde apenas 655 foram eleitas prefeitas em todo o Brasil, o que representa 12,1% do total, contra 87,9% de prefeitos. Para as Câmaras Municipais foram eleitas 9.196 vereadoras e 48.265 vereadores, o que equivale a 16% de mulheres e 84% de homens. 
#Na medida em que ocorre a sub-representação, tanto de mulheres como de outros grupos minoritários, o sistema político deixa de incorporar ou incorpora de forma insuficiente questões fundamentais, tornando-se menos inclusivo (MEIRELES; RUBIM ANDRADE, 2017), essa distorção no processo político-eleitoral é um dos desafios da democracia representativa.




# 2) elaborar hipóteses

#H1 Existe relação entre o desempenho eleitoral das candidatas mulheres
#e a lei de cotas de gênero.

#H2 – Os partidos políticos asseguram os mesmos mecanismos competitivos 
#entre homens e mulheres. 

#H3 - Partidos políticos utilizam a lei de cotas de gênero para servir a outros interesses



# 3) pensar em como operacionalizar os conceitos teóricos em variáveis empíricas

#Desempenho eleitoral - o alcance do número mínimo de votos para se eleger,
#configurando-se em número de acentos conquistados por mulheres na eleição em análise.

#Cotas de gênero – mensuração em termos percentuais da candidatura de mulheres por partido político, 
#observando a cota mínima de 30% e máxima de 70% para candidaturas de cada sexo. 

#Recursos financeiros – mensuração em termos financeiros do montante dos recursos destinado a candidatura, originários do fundo partidário e doações de campanha. 
#Candidaturas fictícias – podem ser observadas através do gasto financeiro inexistente, recebimento ou irrisórios, doações financeiras recebidas e votação ínfima. 




# 4) estabelecer o tipo de relação entre as variáveis operacionalizadas

#Variável Dependente: Desempenho eleitoral 
#Variável Independente: Recursos financeiros  
#Variável Independente: Candidaturas fictícias (fraudulentas)




# 5) elabore qual é a pergunta da sua pesquisa em apenas uma frase

#O que explica o baixo desempenho eleitoral das candidaturas femininas nos pleitos municipais?





# 6) avalie em que medida seu projeto, por enquanto, pode vir a passar pelas 4 
# avaliações de relação causal, e quais problemas ele pode ter em cada uma delas

#1)	Existe algum mecanismo causal crível que conecta X a Y? 
#Sim. Alguns artigos fazem menção a relação causal existente entre as variáveis relacionadas.

#2)	Podemos eliminar a possibilidade de Y pode causar X? Não

#3)	Existe covariação entre X e Y? Sim. 


#4)	Controlamos por todas as variáveis colineares Z que podem tornar a associação entre X e Y espúria?  Talvez, pois ainda  haverá a inclusão de novas variáveis para adequar e melhorara o desenho do modelo.

