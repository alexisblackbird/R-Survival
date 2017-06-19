#' Delete weekly
#'
#' Deletes an existing custom weekly. 
#' 
#' @param name determines which weekly will be deleted. Must be a string.
#' @param completed should be set to TRUE if the weekly was already already completed this day. Defaults to FALSE.
#' @family task configuration
#' @export


# I think this should all work... I'm a bit iffy about it properly pulling everything from stats using the stats[[]] thing with paste but it's probably right


delete.weekly <- function(name, completed = FALSE){
  if(completed == TRUE){
    stats$nweeklies.done <<- stats$nweeklies.done - 1
  }
  if(name == "walk" || name == "meds" || name == "meditate" || name == "tidy"){
    return("Use defaults() to disable default weeklies.")
  }
  tasknum <- 1
  while(exists(paste("weekly",tasknum,".name", sep=""), stats)){ # Confirms the weekly exists so that it can return invalid name if it cycles through all existing weeklies without finding a match
    if(name == get(paste("weekly",tasknum,".name", sep=""), stats)){ 
      while(exists(paste("weekly",tasknum + 1,".name", sep=""), stats)){ # loops through all subsequent tasks and copies them down to fill in the gap
        stats[[paste("weekly",tasknum,".done", sep="")]] <<- get(paste("weekly",tasknum + 1,".done", sep=""), stats)
        stats[[paste("weekly",tasknum,".name", sep="")]] <<- get(paste("weekly",tasknum + 1,".name", sep=""), stats)
        tasknum <- tasknum + 1
      }
      stats <<- within(stats, rm(list = paste("weekly",tasknum,".name", sep="")))
      stats <<- within(stats, rm(list = paste("weekly",tasknum,".done", sep="")))
      stats$nweeklies <<- stats$nweeklies - 1
      write.csv(stats, savespot)
      return("Weekly deleted.")
    }
    tasknum <- tasknum + 1
  }
  return("Invalid name.")
}