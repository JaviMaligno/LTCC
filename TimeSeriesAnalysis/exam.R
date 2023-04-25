
names(series_240423)[1] <- "Quarter"
names(series_240423)[2] <- "Unemployment"


plot(series_240423$Unemployment, type = 'l', main = "Quarterly unemployment rate",
     xlab = "Quarter", ylab = "Unemployment rate %", xaxt = "n")
axis(1, at = c(0,50,100, 150, 200), labels = series_240423$Quarter[c(1,51,101, 151, 201)])

names(ts)[1] <- "Quarter"
names(ts)[2] <- "Unemployment"


plot(ts$Unemployment, type = 'l', main = "Quarterly unemployment rate",
     xlab = "Quarter", ylab = "Unemployment rate %", xaxt = "n")
axis(1, at = c(0,50,100, 150, 200), labels = ts$Quarter[c(1,51,101, 151, 201)])

rates <- ts$Unemployment
yt <- diff(rates)
plot(yt, type = "l", xlab = "t", ylab = "Y_t", main = "Difference series")
     
Xt <- ts$Unemployment
plot.ts(Xt)

Yt <- diff(Xt)
plot.ts(Yt)

acf(Yt)
pacf(Yt)

arima(Yt, order=c(1,0,0), method="CSS")

arima(Yt, order=c(1,0,0), method="ML")

arima(Yt, order=c(1,0,0), method="CSS-ML")

library("forecast")
#auto.arima(Yt, ic="aic")
auto.arima(Yt, ic="bic")

fit <- Arima(Yt,c(2,0,0))
forecast(fit,2)

tail(Xt,1)
length(Xt)

