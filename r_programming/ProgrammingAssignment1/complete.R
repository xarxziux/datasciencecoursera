complete <- function (directory, id = 1:332) {
  
  if (length(directory) != 1) {
    
    return()
    
  }
  
  main.df <- data.frame (id = character(), nobs = numeric(), 
                         stringsAsFactors = FALSE)
  
  for (item in id) {
    
    item.f <- IDToFileName (item)
    new.df <- read.csv (paste (directory, "\\", item.f, sep = ""))
    cc.count <- nrow (new.df [complete.cases (new.df),])
    main.df[nrow(main.df) + 1,] <- c(item, cc.count)
    
  }
  
  main.df
  
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


