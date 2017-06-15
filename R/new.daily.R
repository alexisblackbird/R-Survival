#' New Daily
#' 
#' Creates a new daily task
#' 
#' Walk-type dailies apply the \code{\link{scavenge}} action automatically when completed. Clean-type dailies apply the \code{\link{clean}} activity automatically when completed. Mana-type dailies raise mana by one point when completed.
#' 
#' @param name sets the name of the task. Must be a short string.
#' @param type sets which type of reward is granted for completing the daily. Valid types are "walk", "clean", "mana", "none"
#' @family task configuration
#' @export

new.daily <- function(type, name){ # Creates a new daily. Needs a type and name (short string)
  attach(stats)
  if(name == "walk" || name == "tidy" || name == "meditate"){
    detach(stats)
    return("That name is reserved for a default daily. Please choose a different name, or just use the default daily.")
  }
  if(type == "walk" || type == "clean" || type == "mana" || type == "none"){
    stats[[paste("daily",ndailies + 1,".done", sep="")]] <<- FALSE # Makes a new variable for numbered daily to log progress, puts it in stats so it will save - need to use the stats[[variable name]] <<- to get it to work for changing variable-name variables in stats rather than the global env, assign() is no good for this
    stats[[paste("daily",ndailies + 1,".type", sep="")]] <<- type # Makes a new variable to store daily type
    stats[[paste("daily",ndailies + 1,".name", sep="")]] <<- name # Makes a new variable to store daily name
    stats$ndailies <<- ndailies + 1 # Updates the total number of dailies - for properly labelling new dailies, and later checking if they're all done
    write.csv(stats, savespot)
    detach(stats)
    return("You made a new daily.")
  } else {
    detach(stats)
    return("Invalid daily type.")
  }
}