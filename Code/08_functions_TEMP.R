# Code to build your own functions

somma <- function(x,y) {
  z=x+y
  return(z)
  }

# Exercise: make a new function called differenza
differenza <- function(x,y){
  z=x-y
  return(z)
  }

mf <- function(nrow,ncol) {
  par(mfrow=c(nrow,ncol))
  }

positivo <- function(x) {
  if(x>0) {
    print("Questo numero è positivo, non lo sai?")
    }
  else if(x<0) {
    print("Questo numero è negativo, studia!") 
    }
  else {
    print("Lo zero è zero.")}
  }

loop <- function() {
  for (i in 1:5) {
    return(i)
  }
}

loop2 <- function() {
for (i in 1:5) {
  result <- i * 2
  print(result)
  }
}





