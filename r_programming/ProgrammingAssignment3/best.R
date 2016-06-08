best <- function(state, condition) {
  
  if (condition == "heart attack") {
    
    condition = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    
  } else if (condition == "heart failure") {
    
    condition = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    
  } else if (condition == "pneumonia") {
    
    condition = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    
  } else {
    
    stop ("invalid outcome")
    
  }

  if ((class (state) != "character") | (length (state) != 1)) {
    
    return ("invalid state")
    
  }
  
  #print (outcome$State)
  
  sList <- outcome [outcome$State == state,]
  #print (length (sList))
  
  if (nrow (sList) == 0) {
    
    return ("invalid state")
    
  }
  
  tMin <- min (as.numeric (sList [[condition]]), na.rm = TRUE)
  sList <- sList [as.numeric (sList [[condition]]) == tMin, ]
  sList <- sort (sList$Hospital.Name)
  sList [1]

}

