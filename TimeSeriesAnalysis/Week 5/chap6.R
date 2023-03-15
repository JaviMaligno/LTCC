# load libraries "TSA" (for simulation) and "tseries" (for fitting) 
# one could also use other (more advanced) libraries, such as "fGarch" 
# (for ARMA model with GARCH noise, etc)

library(TSA)
library(tseries)

# simulation data - GARCH(1,1) 
set.seed(1)
x<-garch.sim(alpha=c(0.1,0.2),beta=0.6,n=500)

# initial data exploration
plot(x,type="l")
par(mfrow=c(2,2))
acf(x)
pacf(x)
acf(x^2)
pacf(x^2)

# fitting GARCH using MLE
result <- garch(x, order = c(1, 1))


# inspect outcome - estimated coefficients and the covariance matrix for the estimates
result$coef
result$vcov

# inspect outcome - estimated conditional standard deviation (e.g. volatility)
result$fitted.values
par(mfrow=c(1,1))
plot(x,type="l")
lines(result$fitted.values[,1], type="l" ,col="BLUE")
