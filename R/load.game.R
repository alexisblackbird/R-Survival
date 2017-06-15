#' Load Game
#' 
#' Loads the game from the specified file. 
#' 
#' Loads the game from the specified file and sets that as the save spot for all updates. Note that the game auto-saves whenever changes are made.
#' @param location Sets the save file location and name, e.g. "C:/Users/.../Survival Game/survivalsave.csv". Must be .csv format.
#' @export
load.game <- function(location){
  stats <<- read.csv(location)
  savespot <<- location
  
}