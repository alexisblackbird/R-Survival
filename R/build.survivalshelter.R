#' Build Survival Shelter
#'
#' Builds a simple survival shelter.
#'
#' Costs 2 building materials and 1 construction point. Provides a little shelter which will keep you warm on approximately a third of nights.
#' @export

build.survivalshelter <- function(){
  attach(stats)
  if(warmth < 2){ # makes sure there's a point
    if(building.materials >= 2 && construction.points >= 1){ # makes sure you can
      stats$building.materials <<- building.materials - 2
      stats$building.surivalshelter <<- 1
      stats$construction.points <<- construction.points - 1
      stats$warmth <<- 2 # note shelter buildings SET warmth, no add to it. They don't stack.
      write.csv(stats, savespot)
      detach(stats)
      return("You built a basic survival shelther. It will help protect you from the elements a bit.")
    }else{
      detach(stats)
      return("You do not meet the requirements to build this.")
    }
  } else {
    detach(stats)
    return("You already have a better shelter.")
  }
}