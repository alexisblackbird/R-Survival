#' Cast Lesser Heal
#' 
#' Spend one mana to speed up health regeneration a bit.
#' @family spells
#' @export

cast.lesserheal <- function(){
  if(stats$spell.lesserheal == 0){
    return("You don't know this spell.")
  }
  if(stats$health < stats$max.health){
    if(stats$mana > 0){
      stats$regencount <<- stats$regencount + 3
      stats$mana <<- stats$mana - 1
      write.csv(stats, savespot)
      return("You cast Lesser Heal. You will regenerate a health point sooner now.")
    } else {
      return("You don't have the mana to cast this spell.")
    }
  } else {
    return("You are already at max health.")
  }
}