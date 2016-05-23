corr <- function (directory, threshold = 0) {
  
  if (length(directory) != 1) {
    
    return()
    
  }
  
  if (threshold < 0) {
    
    threshold = 0
    
  }
  
  corr.v <- NULL
  
  for (item in 1:332) {
    
    item.f <- IDToFileName (item)
    new.df <- read.csv (paste (directory, "\\", item.f, sep = ""))
    cc.tot <- new.df [complete.cases (new.df),]
    cc.count <- nrow (cc.tot)
    
    if (cc.count <= threshold) {
      
      next
      
    }
    
    sulf.v <- cc.tot [,2]
    nitr.v <- cc.tot [,3]
    
    
    corr.v <- c (corr.v, round (cor (sulf.v, nitr.v), 5))
    
  }
  
  corr.v
  
}

IDToFileName <- function (item) {
  
  if (is.numeric (item)) {
    
    if (is.wholenumber (item)) {
      
      if ((item > 0) & (item < 10)) {
        
        paste ("00", item, ".csv", sep = "")
        
      } else if ((item > 9) & (item < 100)) {
        
        paste ("0", item, ".csv", sep = "")
        
      } else if ((item > 99) & (item < 333)) {
        
        paste (item, ".csv", sep = "")
        
      }
    }
  }
}

IsWholenumber <- function(x, tol = .Machine$double.eps^0.5) {
  
  abs(x - round(x)) < tol
  
}


