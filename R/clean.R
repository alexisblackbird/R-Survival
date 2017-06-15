#Non-Dailies cleaning

#' Clean
#' 
#' Cleans, preventing squalor gain and decreasing squalor. For non-daily or monthly cleaning.
#' @family activities
#' @export

clean <- function(){
  attach(stats)
  stats$cleaned <<- 1
  if(squalor > 0){
    stats$squalor <<- squalor - 1
  }
  write.csv(stats, savespot)
  detach(stats)
  return("You are keeping squalor at bay.")
}