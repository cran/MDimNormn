\name{SBA}
\alias{sba}
\docType{data}
\title{ Artificially generated data alike that of Suspension bead arrays}
\description{
  The data that has similarity to Suspension bead arrays data. 
}
\usage{data(sba)}

\format{
  A list that consists of \code{"plate"} which is a \code{factor} of plate number,
                          \code{"X"} that contains measured values where columns are targets and rows are samples (or observations).
}
\examples{
data(sba)

# plot to check difference of geometric mean of every target between plates
sba_gm <- by(sba$X, sba$plate, apply, 2, function(x) exp(mean(log(x))))	
par(mfrow= c(2, 3))
apply(combn(4, 2), 2, function(ea) {
	plot(sba_gm[[ea[1]]], sba_gm[[ea[2]]], xlab= names(sba_gm)[ea[1]], 
	     ylab= names(sba_gm)[ea[2]], log= "xy", asp= 1)
	abline(0, 1, col= "cadetblue")
})

# show first 10 observations in plate 1 and plate 2
print(sba$X[c(1:10, 97:106), 1:10])		

}
\keyword{datasets}

