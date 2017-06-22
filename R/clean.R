#Non-Dailies cleaning

#' Clean
#' 
#' Cleans, preventing squalor gain and decreasing squalor. For non-daily or monthly cleaning.
#' @family activities
#' @export

clean <- function(){
  stats$cleaned <<- 1
  if(stats$squalor > 0){
    stats$squalor <<- stats$squalor - 1
  }
  write.csv(stats, savespot)
  return("You are keeping squalor at bay.")
}