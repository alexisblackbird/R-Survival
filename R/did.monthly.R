
#' Did Monthly
#' 
#' Checks of a monthly task as done.
#' 
#' @param name determines which task will be marked as complete.
#' @family activities
#' @export

did.monthly <- function(name){ 
  if(name == "deep clean"){ # Check if it's one of the defaults...
    monthlynum <- "d1"
  } else { # If not... Figure out which daily it is based on a name input, if it's 1 we start, if not we keep checking sequentially higher dailies until we find it
    monthlynum <- 1
    while(name != get(paste("monthly",monthlynum,".name", sep=""), stats)){ 
      monthlynum <- monthlynum + 1
    }
  }
  if(get(paste("monthly",monthlynum,".done", sep=""), stats) == FALSE){ # Check if this one has been done, if not mark it as done and proceed, else end the function with a message
    stats[[paste("monthly",monthlynum,".done", sep="")]] <<- TRUE
    if(monthlynum != "d1"){ # If the monthly isn't a default, increase nmonthlies.done 
      stats$nmonthlies.done <<- stats$nmonthlies.done + 1
    }
  } else {
    return("You've already done this monthly.")
  }
  stats$construction.points <<- stats$construction.points + 1
  if(stats$nmonthlies.done == stats$nmonthlies && !xor(stats$monthlyd1.done, stats$monthlyd1.used) ){ # Checks if all custom monthlies are done (if there's none, nweeklies = 0 so it evaluates true) and if all of the used & done or not used (so done will always be false anyways )
    stats$experience <<- stats$experience + 5
    write.csv(stats, savespot)
    return("You've done all your monthlies!")
  } else {
    returnmessage <- paste("You've done your monthly: ", name, sep="")
    write.csv(stats, savespot)
    return(returnmessage)
  }
}