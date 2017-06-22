#' New Weekly
#' 
#' Creates a new weekly task
#' 
#' @param name sets the name of the task. Must be a short string.
#' @family task configuration
#' @export

new.weekly <- function(name){ # Creates a new weekly. Needs a name (short string)
  if(name == "read science" || name == "read social justice" || name == "hobby"){
    return("That name is reserved for a default weekly. Please choose a different name, or just use the default weekly.")
  } 
  stats[[paste("weekly",stats$nweeklies + 1,".done", sep="")]] <<- FALSE # Makes a new variable for numbered weekly to log progress, puts it in stats so it will save - need to use the stats[[variable name]] <<- to get it to work for changing variable-name variables in stats rather than the global env, assign() is no good for this
  stats[[paste("weekly",stats$nweeklies + 1,".name", sep="")]] <<- name # Makes a new variable to store weekly name
  stats$nweeklies <<- stats$nweeklies + 1 # Updates the total number of weeklies - for properly labelling new weeklies, and later checking if they're all done
  write.csv(stats, savespot)
  return("You made a new weekly.")
}
