
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



# 2) elaborar hipóteses




# 3) pensar em como operacionalizar os conceitos teóricos em variáveis empíricas





# 4) estabelecer o tipo de relação entre as variáveis operacionalizadas





# 5) elabore qual é a pergunta da sua pesquisa em apenas uma frase





# 6) avalie em que medida seu projeto, por enquanto, pode vir a passar pelas 4 
# avaliações de relação causal, e quais problemas ele pode ter em cada uma delas

