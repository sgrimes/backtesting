
# By Stephen Grimes (c) 2015
# 30 Oct 2015
# http://www.ldc.upenn.edu/~sgrimes
# R code to calculate portfolio performance

# load packages
library(quantmod)
library(tseries)
library(PerformanceAnalytics)

# download fund prices
symbols <-c("VINIX","VVIAX","VSMAX","VSIAX","VTMGX","VTRIX","VSS","DLS","VEMAX","VGSLX","VNQI","PCH", "VBTIX","VTABX","VWOB")
weights <-c( 0.085 , 0.085 , 0.085 , 0.085 , 0.085 , 0.085 ,0.085,0.085, 0.10 , 0.05 , 0.05 , 0.02 , 0.03 , 0.06 , 0.01)
getSymbols(symbols, src='yahoo', from='2003-12-31')

for(symbol in symbols) {
  x <- get(symbol)
  indexFormat(x) <- '%Y-%m-%d'
  colnames(x) <- gsub("x",symbol,colnames(x))
  x <- x[,6]
  assign(symbol,x)
}
