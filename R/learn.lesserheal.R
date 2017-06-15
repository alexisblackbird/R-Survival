#' Learn Lesser Heal
#' 
#' Spends a level up to learn the spell Lesser Heal.
#' 
#' Requires one mana to learn and cast. Heals one point of health.
#' @export

learn.lesserheal <- function(){
  attach(stats)
  if(levelup > 0 && max.mana > 0){
    stats$levelup <<- levelup - 1
    stats$spell.lesserheal <<- 1
    write.csv(stats, savespot)
    detach(stats)
    return("You have learned to cast Lesser Heal.")
  } else {
    detach(stats)
    return("You don't meet the requirements to learn this spell.")
  }
}