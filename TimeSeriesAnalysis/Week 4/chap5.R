# Before we start -- take a look at the diagram on Page 8 of your notes

# First, forecasting
library("forecast")
# if forecast libray is not installed, use
# install.packages("forecast")
# simulate an ARMA(1,1) process
set.seed(1)
ts<-arima.sim(list(ar=0.8, ma=0.5),n=500)
# automatically fit ARIMA using AIC
auto.arima(ts)
fit <- Arima(ts,c(1,0,1))

# Forecasting, 20 steps ahead and plot the outcome (with 80% and 95% bands)
forecast(fit,20)
plot(forecast(fit,20),include=50)



# Second, model diagnostics
tsdiag(fit)

# Alternatively, you can get the residuals and operate on them directly
residuals <- fit$residuals
# e.g., look at the PACF plot
pacf(residuals)
# Get the p-value of Ljung-Box for a specific lag 
Box.test(residuals, lag=5, type="Ljung-Box")



# Third, for unit root test
# first, load the tseries library that contains ADF test
library("tseries")
# generate a random walk
ts<-arima.sim(list(order=c(0,1,0)),n=500)
plot(ts)
# DF test (so lag = 0)
adf.test(ts, k=0)
# ADF test (with default choice of lags)
adf.test(ts)

# generate white noise and test
ts<-arima.sim(list(order=c(0,0,0)),n=500)
plot(ts)
adf.test(ts)

# generate stationary ARMA and test
ts<-arima.sim(list(ar=0.8, ma=0.5),n=500)
plot(ts)
adf.test(ts)
