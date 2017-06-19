#' Delete daily
#'
#' Deletes an existing custom daily. 
#' 
#' @param name determines which daily will be deleted. Must be a string.
#' @param completed should be set to TRUE if the daily was already already completed this day. Defaults to FALSE.
#' @family task configuration
#' @export


# I think this should all work... I'm a bit iffy about it properly pulling everything from stats using the stats[[]] thing with paste but it's probably right


delete.daily <- function(name, completed = FALSE){
  if(completed == TRUE){
    stats$ndailies.done <<- stats$ndailies.done - 1
  }
  if(name == "walk" || name == "meds" || name == "meditate" || name == "tidy"){
    return("Use defaults() to disable default dailies.")
  }
  tasknum <- 1
  while(exists(paste("daily",tasknum,".name", sep=""), stats)){ # Confirms the daily exists so that it can return invalid name if it cycles through all existing dailies without finding a match
    if(name == get(paste("daily",tasknum,".name", sep=""), stats)){ 
      while(exists(paste("daily",tasknum + 1,".name", sep=""), stats)){ # loops through all subsequent tasks and copies them down to fill in the gap
        stats[[paste("daily",tasknum,".done", sep="")]] <<- get(paste("daily",tasknum + 1,".done", sep=""), stats)
        stats[[paste("daily",tasknum,".name", sep="")]] <<- get(paste("daily",tasknum + 1,".name", sep=""), stats)
        stats[[paste("daily",tasknum,".type", sep="")]] <<- get(paste("daily",tasknum + 1,".type", sep=""), stats)
        tasknum <- tasknum + 1
      }
      stats <<- within(stats, rm(list = paste("daily",tasknum,".name", sep="")))
      stats <<- within(stats, rm(list = paste("daily",tasknum,".done", sep="")))
      stats <<- within(stats, rm(list = paste("daily",tasknum,".type", sep="")))
      stats$ndailies <<- stats$ndailies - 1
      write.csv(stats, savespot)
      return("Daily deleted.")
    }
    tasknum <- tasknum + 1
  }
  return("Invalid name.")
}