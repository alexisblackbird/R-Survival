#' Load Game
#' 
#' Loads the game from the specified file. 
#' 
#' Loads the game from the specified file and sets that as the save spot for all updates. Note that the game auto-saves whenever changes are made.
#' @param location Sets the save file location and name, e.g. "C:/Users/.../Survival Game/survivalsave.csv". Must be .csv format.
#' @param update Determines whether the save file will be automatically updated to the latest version. Defaults to \code{TRUE}.
#' @export

load.game <- function(location, update = TRUE){
  message <- "Game loaded, have fun!"
  updated <- FALSE
  stats <<- read.csv(location)
  savespot <<- location
  if(stats$version < 0.2 && update == TRUE){
    updated <- TRUE
    stats$version <<- 0.2
  }
  
  if(updated == TRUE){
    message <- paste0("Your save file has been updated to ", stats$version)
    write.csv(stats, savespot)
  }
  return(message)
}