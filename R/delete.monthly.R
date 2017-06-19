#' Delete monthly
#'
#' Deletes an existing custom monthly. 
#' 
#' @param name determines which monthly will be deleted. Must be a string.
#' @param completed should be set to TRUE if the monthly was already already completed this day. Defaults to FALSE.
#' @family task configuration
#' @export


# I think this should all work... I'm a bit iffy about it properly pulling everything from stats using the stats[[]] thing with paste but it's probably right


delete.monthly <- function(name, completed = FALSE){
  if(completed == TRUE){
    stats$nmonthlies.done <<- stats$nmonthlies.done - 1
  }
  if(name == "walk" || name == "meds" || name == "meditate" || name == "tidy"){
    return("Use defaults() to disable default monthlies.")
  }
  tasknum <- 1
  while(exists(paste("monthly",tasknum,".name", sep=""), stats)){ # Confirms the monthly exists so that it can return invalid name if it cycles through all existing monthlies without finding a match
    if(name == get(paste("monthly",tasknum,".name", sep=""), stats)){ 
      while(exists(paste("monthly",tasknum + 1,".name", sep=""), stats)){ # loops through all subsequent tasks and copies them down to fill in the gap
        stats[[paste("monthly",tasknum,".done", sep="")]] <<- get(paste("monthly",tasknum + 1,".done", sep=""), stats)
        stats[[paste("monthly",tasknum,".name", sep="")]] <<- get(paste("monthly",tasknum + 1,".name", sep=""), stats)
        tasknum <- tasknum + 1
      }
      stats <<- within(stats, rm(list = paste("monthly",tasknum,".name", sep="")))
      stats <<- within(stats, rm(list = paste("monthly",tasknum,".done", sep="")))
      stats$nmonthlies <<- stats$nmonthlies - 1
      write.csv(stats, savespot)
      return("Monthly deleted.")
    }
    tasknum <- tasknum + 1
  }
  return("Invalid name.")
}