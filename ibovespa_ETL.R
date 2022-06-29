require(tidyverse)
require(ggplot2)
require(Amelia)
require(reshape2)
require(ggthemes) 
require(plyr)

if (!require(BatchGetSymbols)) install.packages('BatchGetSymbols')

library(BatchGetSymbols)

acoes <- GetIbovStocks()$tickers

acoes <- paste(acoes, ".SA", sep="")

acao1<-as.vector(acoes) #aqui são os nomes dos papeis, vou dar 3 como exemplo, mas podem ser vários

bg<-as.Date("2008-01-05", format = "%Y-%d-%m") #o período inicial, geralmente após os anos 2000
lst<-as.Date("2021-01-06", format = "%Y-%d-%m")  #aqui coloquei a data de hoje, mas poderia ser qualquer outra
bench<-'^BVSP' 

data2<-BatchGetSymbols(tickers = acao1,bench.ticker = bench,
                       first.date = bg,last.date = lst,
                       type.return = "log") #comando que irá baixar os 

cotacoes <- data2$df.tickers

cotacoes <- cotacoes %>% select(ref.date, ticker, ret.adjusted.prices)

write.csv(cotacoes,"C:\\Users\\matma\\OneDrive\\Untitled Folder 2\\cotacoes.csv", row.names = FALSE)
