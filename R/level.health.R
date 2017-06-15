#' Level Up Health
#' 
#' Spends a level up to increase max health by one point.
#' @export

level.health <- function(){
  attach(stats)
  if(levelup > 0){
    stats$max.health <<- max.health + 1
    stats$health <<- health + 1
    stats$levelup <<- levelup - 1
    write.csv(stats, savespot)
    detach(stats)
    return("Your max health has increased.")
  }else{
    detach(stats)
    return("You don't have an available level up to spend.")
  }
}