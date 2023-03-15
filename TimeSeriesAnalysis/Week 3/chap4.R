## For AR - PACF
par(mfrow=c(4,2))
ts<-arima.sim(list(ar=0.5),n=2000)
plot(ts)
pacf(ts, main="AR(1)")
ts<-arima.sim(list(ar=c(0.2,0.5)),n=2000)
plot(ts)
pacf(ts, main="AR(2)")
ts<-arima.sim(list(ar=rep(0.1,5)),n=2000)
plot(ts)
pacf(ts, main="AR(5)")
ts<-arima.sim(list(ar=rep(0.1,9)),n=2000)
plot(ts)
pacf(ts, main="AR(9)")


## But for ARMA (and MA) - PACF is not useful for order identification
par(mfrow=c(2,2))
ts<-arima.sim(list(ar=0.5,ma=0.9),n=2000)
plot(ts)
pacf(ts)
ts<-arima.sim(list(ma=-0.9),n=2000)
plot(ts)
pacf(ts)


# simulate an ARMA(1,1) process
ts<-arima.sim(list(ar=0.8, ma=0.5),n=2000)
# fit the model using  
#   Conditional Least Squares
arima(ts, order=c(1,0,1), method="CSS")
#   Maximum likelihood
arima(ts, order=c(1,0,1), method="ML")
#   or a hybrid method
arima(ts, order=c(1,0,1), method="CSS-ML")


# automatically fit ARIMA using AIC and BIC
# if forecast libray is not installed, use
# install.packages("forecast")
library("forecast")
auto.arima(ts, ic="aic")
auto.arima(ts, ic="bic")
