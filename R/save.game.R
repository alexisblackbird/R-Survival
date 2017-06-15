#' Save Game
#' 
#' Saves the game to the specified location. 
#' 
#' Only necessary if you're saving to a different file than your default one set by \code{\link{load.game}} or \code{\link{new.game}}. Does not change autosave location, the game must be reloaded to do so.
#' @export

save.game <- function(location = savespot){
  write.csv(stats, location)
}
