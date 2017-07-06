#' View Buildings
#' 
#' Displays a list of buildings constructed or available for construction.
#' @param available Displays building options rather than already constructed. Defaults to \code{FALSE}.
#' @family display
#' @family buildings
#' @export

view.buildings <- function(available = FALSE){
  if(available == FALSE){
    print(noquote("Buildings Constructed:"))
  } else {
    print(noquote(paste0("Construction points: ", stats$construction.points, " Building materials: ", stats$building.materials)))
    print(noquote("Buildings Available:"))
  }
  if((available == FALSE && stats$building.survivalshelter == 1)||(available == TRUE && stats$building.survivalshelter == 0)){
    print(noquote("Survival Shelter"))
    if(available == TRUE){
      print(noquote("Cost: 2 building materials, 1 construction point"))
    }
    print(noquote("Helps protect you from the elements, so you won't need to use fuel every night."))
  }
  if((available == FALSE && stats$building.cabin == 1)||(available == TRUE && stats$building.cabin == 0)){
    print(noquote("Cabin"))
    if(available == TRUE){
      print(noquote("Cost: 20 building materials, 6 construction points"))
    }
    print(noquote("Helps protect you from the elements, so you won't need to use fuel on most nights."))
  }
}