#' Level Up Health
#' 
#' Spends a level up to increase max health by one point.
#' @export

level.health <- function(){
  if(stats$levelup > 0){
    stats$max.health <<- stats$max.health + 1
    stats$health <<- stats$health + 1
    stats$levelup <<- stats$levelup - 1
    write.csv(stats, savespot)
    return("Your max health has increased.")
  }else{
    return("You don't have an available level up to spend.")
  }
}