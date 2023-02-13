# let R produce two plots side by side
par(mfrow=c(1,2))

# plot both the series and sample acf when series is iid normal
t1<-rnorm(500)
plot(t1,type="l")
acf(t1)

# plot both the series and sample acf when series is iid exponential
t2<-rexp(500)
plot(t2,type="l")
acf(t2)

# check the values of sample ACF at different lags
result<-acf(t1)
result

# check the options available in acf function
?acf

# for ACF and ACVF
t3<-rnorm(500)*10
acf(t3)
acf(t3, type="covariance")

# the behaviour of sample acf from non-stationary series
# linear trend
t4<-1:500/500
plot(t4,type="l")
acf(t4)
# add a bit noise
t5<-1:500/500+rnorm(500)*0.1
plot(t5,type="l")
acf(t5)
# add a lot more noise
t6<-1:500/500+rnorm(500)
plot(t6,type="l")
acf(t6)

# seasonality
t7<-sin(1:500/10)
plot(t7,type="l")
acf(t7)
# how about more frequent cycles?
t8<-sin(1:500)
plot(t8,type="l")
acf(t8)

#How about MA model? -- to be discussed next week!
t9<-arima.sim(list(ma=0.5),n=500)
plot(t9,type="l")
acf(t9)