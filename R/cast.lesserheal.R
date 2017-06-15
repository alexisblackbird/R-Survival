#' Cast Lesser Heal
#' 
#' Spend one mana to speed up health regeneration a bit.
#' @export

cast.lesserheal <- function(){
  attach(stats)
  if(health < max.health){
    if(mana > 0){
      stats$regencount <<- regencount + 3
      stats$mana <<- mana - 1
      write.csv(stats, savespot)
      detach(stats)
      return("You cast Lesser Heal.")
    } else {
      detach(stats)
      return("You don't have the mana to cast this spell.")
    }
  } else {
    detach(stats)
    return("You are already at max health.")
  }
}