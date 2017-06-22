#' Build Cabin
#'
#' Builds a warm house.
#'
#' Costs 20 building materials and 6 construction points. Provides a home which will keep you warm on approximately two thirds of nights.
#' @export

build.cabin <- function(){
  if(stats$warmth < 4){
    if(stats$building.materials >= 20 && stats$construction.points >= 6){
      stats$building.materials <<- stats$building.materials - 20
      stats$building.cabin <<- 0
      stats$construction.points <<- stats$construction.points - 6
      stats$warmth <<- 4
      write.csv(stats, savespot)
      return("You built a nice cabin. It will protect you from all but the coldest of nights.")
    }else{
      return("You do not meet the requirements to build this.")
    }
  } else {
    return("You already have a better shelter.")
  }
}
