#' View Spells
#' 
#' Displays a list of spells known or available to be learned.
#' @param available Displays spell options rather than already known. Defaults to \code{FALSE}.
#' @family display
#' @family spells
#' @export

view.spells <- function(available = FALSE){
  print(noquote(paste0("Mana: ", stats$mana, "/", stats$max.mana)))
  if(available == FALSE){
    print(noquote("Spells Known:"))
  } else {
    print(noquote("Spells Available:"))
  }
  
  if((available == FALSE && stats$spell.lesserheal == 1)||(available == TRUE && stats$spell.lesserheal == 0)){
    print(noquote(""))
    print(noquote("Lesser Heal"))
    print(noquote("Mana cost: 1. Accelerates health regeneration."))
  }
}