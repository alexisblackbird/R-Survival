#' Did Daily
#' 
#' Checks of a daily task as done.
#' 
#' @param name determines which task will be marked as complete.
#' @param x Defaults to 15. Sets how long the time was for scavenging in walk-type dailies. 
#' @family activities
#' @export

did.daily <- function(name, x = 15){ # x only used/necessary if using a walk daily
  attach(stats)
  if(name == "walk"){ # Check if it's one of the defaults...
    dailynum <- "d1"
  } else {
    if(name == "tidy"){
      dailynum <- "d2"
    } else {
      if(name == "meditate"){
        dailynum <- "d3"
      } else { 
        if(name == "meds"){
          dailynum <- "d4"
        } else { # If not... Figure out which daily it is based on a name input, if it's 1 we start, if not we keep checking sequentially higher dailies until we find it
          dailynum <- 1
          while(name != get(paste("daily",dailynum,".name", sep=""))){ 
            dailynum <- dailynum + 1
          }
        }
      }
    }
  }
  if(get(paste("daily",dailynum,".done", sep="")) == FALSE){ # Check if this one has been done, if not mark it as done and proceed, else end the function with a message
    stats[[paste("daily",dailynum,".done", sep="")]] <<- TRUE
    if(!xor(!xor(dailynum == "d1", dailynum == "d2"), !xor(dailynum == "d3", dailynum == "d4") )){ # If the daily isn't a default, increase ndailies.done 
      stats$ndailies.done <<- ndailies.done + 1
    }
    
  } else {
    detach(stats)
    return("You've already done this daily.")
  }
  if(get(paste("daily", dailynum, ".type", sep="")) == "clean"){ # Does clean daily effects
    stats$cleaned <<- 1
    if(squalor > 0){
      stats$squalor <<- squalor - 1
    }
  }
  if(get(paste("daily", dailynum, ".type", sep="")) == "mana"){ # Does mana daily effects
    if(mana < max.mana){
      stats$mana <<- mana + 1
    }
  }
  if(get(paste("daily", dailynum, ".type", sep="")) == "walk"){ # Does walk daily effects
    detach(stats)
    scavenge(x)
    attach(stats)
  }
  detach(stats)
  attach(stats)
  if(ndailies.done == ndailies && !xor(dailyd1.done, dailyd1.used) && !xor(dailyd2.done, dailyd2.used) && !xor(dailyd3.done, dailyd3.used) && !xor(dailyd4.done, dailyd4.used)){ # Checks if all custom dailies are done (if there's none, ndailies = 0 so it evaluates true) and if all of the used & done or not used (so done will always be false anyways )
    stats$experience <<- experience + 1
    write.csv(stats, savespot)
    detach(stats)
    return("You've done all your dailies!")
  } else {
    returnmessage <- paste("You've done your daily: ", name, sep="")
    write.csv(stats, savespot)
    detach(stats)
    return(returnmessage)
  }
}