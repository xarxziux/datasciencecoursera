rankhospital <- function(state, condition, num = "best") {
  
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
    
    return ("invalid state 1")
    
  }
  
  sList <- outcome [outcome$State == state,]

  if (nrow (sList) == 0) {
    
    return ("invalid state 2")
    
  }

  sList <- sList [!is.na (as.numeric (sList [[condition]])),]
  sList <- sList [with (sList, order (as.numeric (sList [, condition]), Hospital.Name)),]

  if (num == "best") {
    
    num <- 1
    
  } else if (num == "worst") {
    
    num <- nrow (sList)
    
  } else if (length (num) != 1) {
    
    return ("invalid rank")
  
  }  else if (num > nrow (sList)) {
    
    return (NA)
    
  }
  
  sList [num, "Hospital.Name"]
  
}

