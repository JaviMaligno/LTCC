##########################################
# Example One: 0.1 second (around 1000 points) of speech sample of a recorded phrase aaa...hhh
# series from "astsa" library - object with name "speech"

library(astsa)
plot(speech)
acf(speech, 250)

# Exact periodogram - obtained via the "periodogram" function from "TSA" library
library(TSA)
periodogram(speech)

# (very) undersmoothed periodogram (similar to that from in the previous line)
spectrum(speech,log="no")

# smoothed periodogram
spectrum(speech,log="no",span=20)
# maybe smoothier?
spectrum(speech,log="no",span=50)
##########################################


##########################################
# Example Two: Mixture of sines and cosines

y1 = cos(2*pi*(1:100)*8/100) +  3 * sin(2*pi*(1:100)*8/100)
y2 = 3 * cos(2*pi * (1:100)*20/100) + 4 * sin(2*pi * (1:100)*20/100)
x = y1+y2

par(mfrow=c(2,2))
plot.ts(y1, ylim=c(-10,10), main=expression(f==8/100~~~A^2 == 10))
plot.ts(y2, ylim=c(-10,10), main=expression(f==20/100~~~A^2 == 25))
plot.ts(x, ylim=c(-18,18), main="sum")
periodogram(x)

# Same example, but with some noise
set.seed(0)
xnew = x+rnorm(length(x))*5
par(mfrow=c(2,2))
plot.ts(xnew, main="series with noise")
acf(xnew)
pacf(xnew)
periodogram(xnew)

# Final comparison - replotting the figures we produced previous 
plot.ts(x, ylim=c(-18,18), main="series without noise")
periodogram(x)
plot.ts(xnew, ylim=c(-18,18), main="series with noise")
periodogram(xnew)
##########################################


##########################################
# Example Three:  MA(1), with theta = 0.9
x = arima.sim(n=500,list(ma=0.9))
plot(x, main="MA(1)")

# raw periodogram
periodogram(x)

# very lightly smoothed periodgram [default from spectrum, not run here]
spectrum(x,log="no")

# smoothed periodogram
spectrum(x,log="no",span=100)

# compare with the true spectral density
f<-1:100/200
P<-(1+2*0.9*cos(2*pi*f)+0.9^2)
lines(f,P,col="BLUE")
##########################################

###################  We hope you enjoyed ST304, and a big ####################

######## ##     ##    ###    ##    ## ##    ##    ##    ##  #######  ##     ##
   ##    ##     ##   ## ##   ###   ## ##   ##      ##  ##  ##     ## ##     ##
   ##    ##     ##  ##   ##  ####  ## ##  ##        ####   ##     ## ##     ##
   ##    ######### ##     ## ## ## ## #####          ##    ##     ## ##     ##
   ##    ##     ## ######### ##  #### ##  ##         ##    ##     ## ##     ##         
   ##    ##     ## ##     ## ##   ### ##   ##        ##    ##     ## ##     ##
   ##    ##     ## ##     ## ##    ## ##    ##       ##     #######   #######  

###############################  for listening!  #############################