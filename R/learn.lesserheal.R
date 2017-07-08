#' Learn Lesser Heal
#' 
#' Spends a level up to learn the spell Lesser Heal.
#' 
#' Requires one mana to learn and cast. Heals one point of health.
#' @family spells
#' @export

learn.lesserheal <- function(){
  if(stats$spell.lesserheal == 1){
    return("You already know this spell.")
  }
  if(stats$levelup > 0 && stats$max.mana > 0){
    stats$levelup <<- stats$levelup - 1
    stats$spell.lesserheal <<- 1
    write.csv(stats, savespot)
    return("You have learned to cast Lesser Heal.")
  } else {
    return("You don't meet the requirements to learn this spell.")
  }
}