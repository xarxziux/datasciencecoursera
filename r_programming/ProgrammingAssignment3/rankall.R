rankall <- function(condition, num = "best") {

  if (condition == "heart attack") {
    
    condition = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
    
  } else if (condition == "heart failure") {
    
    condition = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
    
  } else if (condition == "pneumonia") {
    
    condition = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
    
  } else {
    
    stop ("invalid outcome")
    
  }
  
  if ((length (num) != 1) | (num < 1)) {
      
    return ("invalid rank")
      
  }
    
  if (num == "best") {
    
    tnum <- 1
      
  } else if (num != "worst") {
    
    tnum <- num
    
  }
    
  sList <- outcome [!is.na (as.numeric (outcome [[condition]])),]
  
  # print (c ("dim (sList) = ", dim (sList)))

  sNames <- unique (outcome$State)
  sNames <- sNames [order (sNames)]
  
  # sNames <- sNames [1:10]

  rList <- data.frame ("hospital" = character(), "state" = character(), 
		stringsAsFactors = FALSE)

  for (nextState in sNames) {
  
    # print (c ("dim (sList) = ", dim (sList)))

    tList <- sList [sList$State == nextState,]
    tList <- tList [with (tList, order (as.numeric (tList [, condition]), Hospital.Name)),]
    
    # print (c ("dim (tList) = ", dim (tList)))
    # print ("")
    
    # print (sList [num, "Hospital.Name"])

   if (num == "worst") {
      
      tnum <- nrow (tList)

      # print (nrow (tList))
      # print (num)
      # print ("")
      
    }
    
    rList [nrow(rList) + 1,] <- if (tnum > nrow (tList)) {
      
      c (NA, nextState)
      
    } else {
    
      c (tList [tnum, "Hospital.Name"], nextState)
      
    }
    
    # print (sList [num, "Hospital.Name"])
    # print (rList [nrow (rList),])
    
  }
  
  rList
  
}



 