#' Build Survival Shelter
#'
#' Builds a simple survival shelter.
#'
#' Costs 2 building materials and 1 construction point. Provides a little shelter which will keep you warm on approximately a third of nights.
#' @family buildings
#' @export

build.survivalshelter <- function(){
  if(stats$warmth < 2){ # makes sure there's a point
    if(stats$building.materials >= 2 && stats$construction.points >= 1){ # makes sure you can
      stats$building.materials <<- stats$building.materials - 2
      stats$building.survivalshelter <<- 1
      stats$construction.points <<- stats$construction.points - 1
      stats$warmth <<- 2 # note shelter buildings SET warmth, no add to it. They don't stack.
      write.csv(stats, savespot)
      return("You built a basic survival shelther. It will help protect you from the elements a bit.")
    }else{
      return("You do not meet the requirements to build this.")
    }
  } else {
    return("You already have a better shelter.")
  }
}