#' Did Weekly
#' 
#' Checks of a weekly task as done.
#' 
#' @param name determines which task will be marked as complete.
#' @family activities
#' @export

did.weekly <- function(name){ 
  if(name == "read science"){ # Check if it's one of the defaults...
    weeklynum <- "d1"
  } else {
    if(name == "read social justice"){
      weeklynum <- "d2"
    } else {
      if(name == "hobby"){
        weeklynum <- "d3"
      } else { # If not... Figure out which daily it is based on a name input, if it's 1 we start, if not we keep checking sequentially higher dailies until we find it
        weeklynum <- 1
        while(name != get(paste("weekly",weeklynum,".name", sep=""), stats)){ 
          weeklynum <- weeklynum + 1
        }
      }
    }
  }
  if(get(paste("weekly",weeklynum,".done", sep=""), stats) == FALSE){ # Check if this one has been done, if not mark it as done and proceed, else end the function with a message
    stats[[paste("weekly",weeklynum,".done", sep="")]] <<- TRUE
    if(!xor(!xor(weeklynum == "d1", weeklynum == "d2"), weeklynum != "d3")){ # If the weekly isn't a default, increase nweeklies.done 
      stats$nweeklies.done <<- stats$nweeklies.done + 1
    }
  } else {
    return("You've already done this weekly.")
  }
  stats$experience <<- stats$experience + 1
  if(stats$nweeklies.done == stats$nweeklies && !xor(stats$weeklyd1.done, stats$weeklyd1.used) && !xor(stats$weeklyd2.done, stats$weeklyd2.used) && !xor(stats$weeklyd3.done, stats$weeklyd3.used) ){ # Checks if all custom weeklies are done (if there's none, nweeklies = 0 so it evaluates true) and if all of the used & done or not used (so done will always be false anyways )
    stats$construction.points <<- stats$construction.points + 1
    write.csv(stats, savespot)
    return("You've done all your weeklies, and made some progress upgrading your home!")
  } else {
    returnmessage <- paste("You've done your weekly: ", name, sep="")
    write.csv(stats, savespot)
    return(returnmessage)
  }
}