#' Level Up Mana
#' 
#' Spends a level up to increase max mana by one point.
#' @export

level.mana <- function(){
  if(stats$levelup > 0){
    stats$max.mana <<- stats$max.mana + 1
    stats$mana <<- stats$mana + 1
    stats$levelup <<- stats$levelup - 1
    write.csv(stats, savespot)
    return("Your max mana has increased.")
  }else{
    return("You don't have an available level up to spend.")
  }
}