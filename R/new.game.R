#' New Game
#' 
#' Starts a new game, saved at the specified location.
#' 
#' This function starts a new game, setting all values to the default and saving them to the directory and file specified by the location argument. 
#' @param day Sets the current day for use in \code{\link{run.day}}. Must be in lowercase. Defaults to "monday"
#' @param location Sets the save file location and name, e.g. "C:/Users/.../Survival Game/survivalsave.csv". Must be .csv format.
#' @seealso \code{\link{defaults}} for task configuration \code{\link{run.day}} for processing daily changes \code{\link{load.game}} for loading your game
#' @export

new.game <- function(location, day = "monday"){
  if(day == "monday"){
    day <- "monday"
  } else {
    if(day == "tuesday"){
      day <- "tuesday"
    } else {
      if(day == "wednesday"){
        day <- "wednesday" 
      } else {
        if(day == "thursday"){
          day <- "thursday"
        } else {
          if(day == "friday"){
            day <- "friday"
          } else {
            if(day == "saturday"){
              day <- "saturday"
            } else {
              if(day == "sunday"){
                day <- "sunday"
              } else {
                print("Invalid input for day. Please use a day of the week in lower case, in quotations.")
              }
            }
          }
        }
      }
    }
  }
  health <- 5
  max.health <- 5
  level <- 1
  max.health <- 5
  squalor <- 0
  squalor.tolerance <- 5
  momentum <- 0
  food <- 0
  food.need <- 1
  fuel <- 0
  mana <- 0
  max.mana <- 0
  experience <- 0
  max.experience <- 5
  levelup <- 0
  building.materials <- 0
  tech.materials <- 0
  rare.materials <- 0
  magic.materials <- 0
  construction.points <- 0
  cleaned <- 0
  warmth <- 0
  spell.lesserheal <- 0
  building.surivalshelter <- 0
  building.cabin <- 0
  dailyd1.done <- FALSE
  dailyd1.type <- "walk"
  dailyd1.name <- "walk"
  dailyd1.used <- TRUE
  dailyd2.done <- FALSE
  dailyd2.type <- "clean"
  dailyd2.name <- "tidy"
  dailyd2.used <- TRUE
  dailyd3.done <- FALSE
  dailyd3.type <- "meditate"
  dailyd3.name <- "meditate"
  dailyd3.used <- TRUE
  dailyd4.done <- FALSE
  dailyd4.type <- "none"
  dailyd4.name <- "meds"
  dailyd4.used <- TRUE
  ndailies <- 0
  ndailies.done <- 0
  weeklyd1.done <- FALSE
  weeklyd1.name <- "read science"
  weeklyd1.used <- TRUE
  weeklyd2.done <- FALSE
  weeklyd2.name <- "read social justice"
  weeklyd2.used <- TRUE
  weeklyd3.done <- FALSE
  weeklyd3.name <- "hobby"
  weeklyd3.used <- TRUE
  nweeklies <- 0
  nweeklies.done <- 0
  monthlyd1.done <- FALSE
  monthlyd1.name <- "deep clean"
  monthlyd1.used <- TRUE
  nmonthlies <- 0
  nmonthlies.done <- 0
  regencount <- 0
  version <- 0.1
  stats <<- data.frame(day, health, max.health, level, max.health, squalor, squalor.tolerance, momentum, food, food.need, fuel, mana, max.mana, experience, max.experience, levelup, 
                       building.materials, tech.materials, rare.materials, magic.materials, construction.points, cleaned, warmth, building.cabin, building.surivalshelter, spell.lesserheal,
                       dailyd1.done, dailyd1.name, dailyd1.type, dailyd1.used, dailyd2.done, dailyd2.name, dailyd2.used, dailyd2.type, dailyd3.done, dailyd3.name, dailyd3.type, dailyd3.used,
                       dailyd4.done, dailyd4.name, dailyd4.type, dailyd4.used, weeklyd1.done, weeklyd1.name, weeklyd1.used, weeklyd2.done, weeklyd2.name, weeklyd2.used,
                       weeklyd3.done, weeklyd3.name, weeklyd3.used, monthlyd1.done, monthlyd1.name, ndailies, ndailies.done, nweeklies.done, nweeklies,
                       nmonthlies, nmonthlies.done, regencount, version)
  savespot <<- location
  write.csv(stats, savespot)
  
  return("New game created. Good luck!")
}