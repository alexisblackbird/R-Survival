#' View Character
#' 
#' Displays information about your character's stats and essential supplies.
#' @family display
#' @export

view.character <- function(){
  if(stats$experience / stats$max.experience >= .1){
    xpb1 <- "I"
  } else {
    xpb1 <- "."
  }
  if(stats$experience / stats$max.experience >= .2){
    xpb2 <- "I"
  } else {
    xpb2 <- "."
  }
  if(stats$experience / stats$max.experience >= .3){
    xpb3 <- "I"
  } else {
    xpb3 <- "."
  }
  if(stats$experience / stats$max.experience >= .4){
    xpb4 <- "I"
  } else {
    xpb4 <- "."
  }
  if(stats$experience / stats$max.experience >= .5){
    xpb5 <- "I"
  } else {
    xpb5 <- "."
  }
  if(stats$experience / stats$max.experience >= .6){
    xpb6 <- "I"
  } else {
    xpb6 <- "."
  }
  if(stats$experience / stats$max.experience >= .7){
    xpb7 <- "I"
  } else {
    xpb7 <- "."
  }
  if(stats$experience / stats$max.experience >= .8){
    xpb8 <- "I"
  } else {
    xpb8 <- "."
  }
  if(stats$experience / stats$max.experience >= .9){
    xpb9 <- "I"
  } else {
    xpb9 <- "."
  }
  if(stats$experience / stats$max.experience >= 1){
    xpb10 <- "I"
  } else {
    xpb10 <- "."
  }
  if(stats$levelup > 0){
    levelnotice <- noquote(paste0(" You have ", stats$levelup, " level up point(s) available."))
  } else {
    levelnotice <- " "
  }
  print(noquote(paste0("Level ", stats$level, levelnotice)))
  print(noquote(paste0("[", xpb1, xpb2, xpb3, xpb4, xpb5, xpb6, xpb7, xpb8, xpb9, xpb10, "] ", stats$experience, "/", stats$max.experience)))
  
  
  if(stats$health / stats$max.health >= .1){
    hb1 <- "I"
  } else {
    hb1 <- "."
  }
  if(stats$health / stats$max.health >= .2){
    hb2 <- "I"
  } else {
    hb2 <- "."
  }
  if(stats$health / stats$max.health >= .3){
    hb3 <- "I"
  } else {
    hb3 <- "."
  }
  if(stats$health / stats$max.health >= .4){
    hb4 <- "I"
  } else {
    hb4 <- "."
  }
  if(stats$health / stats$max.health >= .5){
    hb5 <- "I"
  } else {
    hb5 <- "."
  }
  if(stats$health / stats$max.health >= .6){
    hb6 <- "I"
  } else {
    hb6 <- "."
  }
  if(stats$health / stats$max.health >= .7){
    hb7 <- "I"
  } else {
    hb7 <- "."
  }
  if(stats$health / stats$max.health >= .8){
    hb8 <- "I"
  } else {
    hb8 <- "."
  }
  if(stats$health / stats$max.health >= .9){
    hb9 <- "I"
  } else {
    hb9 <- "."
  }
  if(stats$health / stats$max.health == 1){
    hb10 <- "I"
  } else {
    hb10 <- "."
  }
  print(noquote(paste0("Health:")))
  print(noquote(paste0("[", hb1, hb2, hb3, hb4, hb5, hb6, hb7, hb8, hb9, hb10, "] ", stats$health, "/", stats$max.health)))
  if(stats$max.mana > 0){
    if(stats$mana / stats$max.mana >= .1){
      mb1 <- "I"
    } else {
      mb1 <- "."
    }
    if(stats$mana / stats$max.mana >= .2){
      mb2 <- "I"
    } else {
      mb2 <- "."
    }
    if(stats$mana / stats$max.mana >= .3){
      mb3 <- "I"
    } else {
      mb3 <- "."
    }
    if(stats$mana / stats$max.mana >= .4){
      mb4 <- "I"
    } else {
      mb4 <- "."
    }
    if(stats$mana / stats$max.mana >= .5){
      mb5 <- "I"
    } else {
      mb5 <- "."
    }
    if(stats$mana / stats$max.mana >= .6){
      mb6 <- "I"
    } else {
      mb6 <- "."
    }
    if(stats$mana / stats$max.mana >= .7){
      mb7 <- "I"
    } else {
      mb7 <- "."
    }
    if(stats$mana / stats$max.mana >= .8){
      mb8 <- "I"
    } else {
      mb8 <- "."
    }
    if(stats$mana / stats$max.mana >= .9){
      mb9 <- "I"
    } else {
      mb9 <- "."
    }
    if(stats$mana / stats$max.mana == 1){
      mb10 <- "I"
    } else {
      mb10 <- "."
    }
    print(noquote(paste0("Mana:")))
    print(noquote(paste0("[", mb1, mb2, mb3, mb4, mb5, mb6, mb7, mb8, mb9, mb10, "] ", stats$mana, "/", stats$max.mana)))
  }
  print(noquote(paste0("Momentum: ", stats$momentum, "  Squalor: ", stats$squalor)))
  print(noquote(paste0("Food: ", stats$food, "  Fuel: ", stats$fuel)))
}
  