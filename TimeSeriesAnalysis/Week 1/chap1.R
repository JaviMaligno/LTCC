# Some demo plots
# first, with time order; then, without time order
library(astsa)
par(mfrow = c(2,1))

set.seed(1)

plot(gtemp)
plot(sample(gtemp),type="l") #choose random samples 

plot(EQ5)
plot(sample(EQ5),type="l")

plot(speech)
plot(sample(speech),type="l")

plot(nyse)
plot(sample(nyse),type="l")


# Filter
x<-rnorm(1000)+1:1000/50
plot(x,type="l",col="grey")
lines(filter(x,rep(1,101)/101),type="l")

# compare Filter with least squares estimation of linear trend
m<-lm(formula = x ~ c(1:1000))
plot(filter(x,rep(1,101)/101),type="l")
lines(c(1:1000),  c(1:1000)*m$coefficients[2]+m$coefficients[1],type="l")

# Spectrum
ts<-cos(c(1:100))
plot(ts)
spectrum(ts) # the peak in the plot happens at 1/len(cycle), so this can be used to detect cycles

#AR model # autoregression
ts<-arima.sim(list(ar=0.8),n=200)
plot(ts,type="l")

#MA model #moving average
ts<-arima.sim(list(ma=0.5),n=200)
plot(ts,type="l")

#ARMA model
ts<-arima.sim(list(order=c(1,0,1),ar=0.8,ma=0.5),n=200)
plot(ts,type="l")

#ARIMA model #smother model taking differences from arma model
ts<-arima.sim(list(order=c(1,1,1),ar=0.8,ma=0.5),n=200)
plot(ts,type="l")

#GARCH model
library(TSA)
ts<-garch.sim(alpha=c(0.01,0.9),beta=0.05,n=500)
plot(ts,type="l")
