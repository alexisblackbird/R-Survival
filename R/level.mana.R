#' Level Up Mana
#' 
#' Spends a level up to increase max mana by one point.
#' @export

level.mana <- function(){
  attach(stats)
  if(levelup > 0){
    stats$max.mana <<- max.mana + 1
    stats$mana <<- mana + 1
    stats$levelup <<- levelup - 1
    write.csv(stats, savespot)
    detach(stats)
    return("Your max mana has increased.")
  }else{
    detach(stats)
    return("You don't have an available level up to spend.")
  }
}