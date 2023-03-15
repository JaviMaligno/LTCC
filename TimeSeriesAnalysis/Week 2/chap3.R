# Chapter 3 - R demos

## For MA
par(mfrow=c(4,2))
ts<-arima.sim(list(ma=0.5),n=2000)
plot(ts)
acf(ts, main="MA(1)")
ts<-arima.sim(list(ma=c(0.2,0.5)),n=2000)
plot(ts)
acf(ts, main="MA(2)")
ts<-arima.sim(list(ma=rep(0.1,5)),n=2000)
plot(ts)
acf(ts, main="MA(5)")
ts<-arima.sim(list(ma=rep(0.1,9)),n=2000)
plot(ts)
acf(ts, main="MA(9)")

## For AR
par(mfrow=c(4,2))
ts<-arima.sim(list(ar=0.5),n=2000)
plot(ts)
acf(ts, main="AR(1)")
ts<-arima.sim(list(ar=c(0.2,0.5)),n=2000)
plot(ts)
acf(ts, main="AR(2)")
ts<-arima.sim(list(ar=rep(0.1,5)),n=2000)
plot(ts)
acf(ts, main="AR(5)")
ts<-arima.sim(list(ar=rep(0.1,9)),n=2000)
plot(ts)
acf(ts, main="AR(9)")
# Below is the example in our lecture notes
par(mfrow=c(2,2))
ts<-arima.sim(list(ar=c(0.5,0.24)),n=200)
plot(ts)
acf(ts, main="AR(2)")
ts<-arima.sim(list(ar=c(0.5,0.24)),n=2000)
plot(ts)
acf(ts, main="AR(2)")
# To find the root of polynomials in R and their norms 
#    (to check whether they are outside the unit circle or not):
?polyroot
polyroot(c(1,-0.5,-0.24))
abs( polyroot(c(1,-0.5,-0.24)) )


## For ARMA
par(mfrow=c(2,2))
ts<-arima.sim(list(ar=0.5,ma=0.8),n=500)
plot(ts)
acf(ts)
ts<-arima.sim(list(ar=0.8,ma=0.2),n=500)
plot(ts)
acf(ts)
# If input doesn't guarantee stationary of ARMA (more precisely, causal), 
#    will report errors...
ts<-arima.sim(list(ar=1,ma=0.2),n=500)
ts<-arima.sim(list(ar=-1,ma=0.2),n=500)
ts<-arima.sim(list(ar=2,ma=0.2),n=500)

## For ARIMA
par(mfrow=c(4,2))
ts<-arima.sim(list(order = c(0,1,0)),n=500)
plot(ts)
acf(ts, main="ARIMA(0,1,0)")
ts<-arima.sim(list(order = c(1,1,1), ar=0.5,ma=0.5),n=500)
plot(ts)
acf(ts, main="ARIMA(1,1,1)")
ts<-arima.sim(list(order = c(1,2,1), ar=0.5,ma=0.5),n=500)
plot(ts)
acf(ts, main="ARIMA(1,2,1)")
ts<-arima.sim(list(order = c(1,3,1), ar=0.5,ma=0.5),n=500)
plot(ts)
acf(ts, main="ARIMA(1,3,1)")
# If input orders don't match, will report errors...
ts<-arima.sim(list(order = c(1,1,0), ar=0.5,ma=0.5),n=500)
ts<-arima.sim(list(order = c(0,1,0), ar=0.5,ma=0.5),n=500)

