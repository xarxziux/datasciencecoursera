pollutantmean <- function (directory, pollutant, id = 1:332) {
  
  #Build a list of filenames from the id value
  file.names <- IDToFileName (id)
  
  # Make sure the input values are in the correct format 
  if ((length(directory) != 1) || (length (pollutant) != 1)
      || ((pollutant != "sulfate") && (pollutant != "nitrate"))
      || (is.null (file.names))) {
    
    return()
    
  }
  
  main.table <- NULL
  
  for (file in file.names) {
    
    next.table <- read.csv (paste(directory, file, sep = ""))
    
    if (pollutant == "sulfate") {
      
      next.table <- next.table [,2]
      
    } else {
      
      next.table <- next.table [,3]
      
    }
    
    next.table <- next.table [complete.cases (next.table)]
    main.table <- c(main.table, next.table)  
      
  }
  
  mean (main.table)  
  
}


IDToFileName <- function (id.list) {
  
  file.list = NULL

  for (item in id.list) {
    
    if (is.numeric (item)) {
    
      if (is.wholenumber (item)) {

        if ((item > 0) & (item < 10)) {
        
          file.list = c (file.list, paste ("00", item, ".csv", sep = ""))
        
        } else if ((item > 9) & (item < 100)) {
        
          file.list = c (file.list, paste ("0", item, ".csv", sep = ""))
        
        } else if ((item > 99) & (item < 333)) {
        
          file.list = c (file.list, paste (item, ".csv", sep = ""))
          
        }
      }
    }    
  }
   
  file.list
  
}

IsWholenumber <- function(x, tol = .Machine$double.eps^0.5) {

    abs(x - round(x)) < tol

}


