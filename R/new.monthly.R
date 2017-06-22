#' New Monthly
#' 
#' Creates a new monthly task
#' 
#' @param name sets the name of the task. Must be a short string.
#' @family task configuration
#' @export

new.monthly <- function(name){ # Creates a new monthly. Needs a name (short string)
  if(name == "deep clean"){
    return("That name is reserved for a default weekly. Please choose a different name, or just use the default weekly.")
  } 
  stats[[paste("monthly",stats$nmonthlies + 1,".done", sep="")]] <<- FALSE # Makes a new variable for numbered monthly to log progress, puts it in stats so it will save - need to use the stats[[variable name]] <<- to get it to work for changing variable-name variables in stats rather than the global env, assign() is no good for this
  stats[[paste("monthly",stats$nmonthlies + 1,".name", sep="")]] <<- name # Makes a new variable to store monthly name
  stats$nmonthlies <<- stats$nmonthlies + 1 # Updates the total number of monthlies - for properly labelling new monthlies, and later checking if they're all done
  write.csv(stats, savespot)
  return("You made a new monthly.")
}