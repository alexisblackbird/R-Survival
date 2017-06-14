# Mental Illness Survival Game


#
# Building ideas:
# Ceremonial fire - converts fuel in to mana
# Carpenter's bench - converts fuel into building materials
#
# Spell ideas:
# Warming flame - 1 mana for 2 temporary warmth
# Done! Lesser heal - 1 mana for 1 health
# Greater heal - 2 mana for 1 health
#

# Should probably make it so there are storage caps for resources
# Momentum should be harder to sustain at higher levels 
#
# Things needed to make it playable by others:
# Display stats functions:
#   Main screen
#   Spell options
#   Building options
#   Current spells & buildings


# Bugs:
# does not recognize multiple items of the same type being collected while scavenging
#   Probably is because the function pulls data from the file, updates the file, but keeps working w/ the local data - need to specify ~everything~ to reference stats$


# Exception handling I need to make:
# did.daily etc : invalid name (will need to have a check if ndailies is 0 at the front of the custom name search (ie no custom dailies)), and probably a count loop with something like 1000 for in checking the custom daily... or use exists or something

# Stuff I'm working on





# Completed code



#' New Game
#' 
#' Starts a new game, saved at the specified location.
#' 
#' This function starts a new game, setting all values to the default and saving them to the directory and file specified by the location argument. 
#' @param day Sets the current day for use in \code{\link{run.day}}. Must be in lowercase. Defaults to "monday"
#' @param location Sets the save file location and name, e.g. "C:/Users/.../Survival Game/survivalsave.csv". Must be .csv format.
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
  stats <<- data.frame(day, health, max.health, level, max.health, squalor, squalor.tolerance, momentum, food, food.need, fuel, mana, max.mana, experience, max.experience, levelup, 
                      building.materials, tech.materials, rare.materials, magic.materials, construction.points, cleaned, warmth, building.cabin, building.surivalshelter, spell.lesserheal,
                      dailyd1.done, dailyd1.name, dailyd1.type, dailyd1.used, dailyd2.done, dailyd2.name, dailyd2.used, dailyd2.type, dailyd3.done, dailyd3.name, dailyd3.type, dailyd3.used,
                      dailyd4.done, dailyd4.name, dailyd4.type, dailyd4.used, weeklyd1.done, weeklyd1.name, weeklyd1.used, weeklyd2.done, weeklyd2.name, weeklyd2.used,
                      weeklyd3.done, weeklyd3.name, weeklyd3.used, monthlyd1.done, monthlyd1.name, ndailies, ndailies.done, nweeklies.done, nweeklies,
                      nmonthlies, nmonthlies.done, regencount)
  savespot <<- location
  write.csv(stats, savespot)
  
  return("New game created. Good luck!")
}

#' Load Game
#' 
#' Loads the game from the specified file. 
#' 
#' Loads the game from the specified file and sets that as the save spot for all updates. Note that the game auto-saves whenever changes are made.
#' @param location Sets the save file location and name, e.g. "C:/Users/.../Survival Game/survivalsave.csv". Must be .csv format.
#' @export
load.game <- function(location){
  stats <<- read.csv(location)
  savespot <<- location
  
}


#' Save Game
#' 
#' Saves the game to the specified location. 
#' 
#' Only necessary if you're saving to a different file than your default one set by \code{\link{load.game}} or \code{\link{new.game}}. Does not change autosave location, the game must be reloaded to do so.
#' @export

save.game <- function(location = savespot){
  write.csv(stats, location)
}

#' Default Tasks
#' 
#' Disables / Enables default dailies, monthlies, and weeklies.
#' 
#' @param name Specifies which default task will be changed.
#' @param enabled Defaults to \code{FALSE}, which disables the task. \code{enabled = TRUE} allows you to re-enable previously disabled defaults.
#' @family task configuration

defaults <- function(name, enabled = FALSE){
  attach(stats)
  if(enabled == FALSE){
    if(name == "walk"){
      stats$dailyd1.used <<- FALSE
    } else {
      if(name == "tidy"){
        stats$dailyd2.used <<- FALSE
      } else {
        if(name == "meditate"){
          stats$dailyd3.used <<- FALSE
        } else {
          if(name == "meds"){
            stats$dailyd4.used <<- FALSE
          } else {
            if(name == "read science"){
              stats$weeklyd1.used <<- FALSE
            } else {
              if(name == "read social justice"){
                stats$weeklyd2.used <<- FALSE
              } else {
                if(name == "hobby"){
                  stats$weeklyd3.used <<- FALSE
                } else {
                  if(name == "deep clean"){
                    stats$monthlyd1.used <<- FALSE
                  } else {
                    detach(stats)
                    return("Invalid name.")
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  if(enabled == TRUE){
    if(name == "walk"){
      stats$dailyd1.used <<- TRUE
    } else {
      if(name == "tidy"){
        stats$dailyd2.used <<- TRUE
      } else {
        if(name == "meditate"){
          stats$dailyd3.used <<- TRUE
        } else {
          if(name == "meds"){
            stats$dailyd4.used <<- TRUE
          } else {
            if(name == "read science"){
              stats$weeklyd1.used <<- TRUE
            } else {
              if(name == "read social justice"){
                stats$weeklyd2.used <<- TRUE
              } else {
                if(name == "hobby"){
                  stats$weeklyd3.used <<- TRUE
                } else {
                  if(name == "deep clean"){
                    stats$monthlyd1.used <<- TRUE
                  } else {
                    detach(stats)
                    return("Invalid name.")
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  write.csv(stats, savespot)
  detach(stats)
  return("Default tasks settings updated.")
}

#' New Monthly
#' 
#' Creates a new monthly task
#' 
#' @param name sets the name of the task. Must be a short string.
#' @family task configuration
#' @export

new.monthly <- function(name){ # Creates a new monthly. Needs a name (short string)
  attach(stats)
  if(name == "deep clean"){
    detach(stats)
    return("That name is reserved for a default weekly. Please choose a different name, or just use the default weekly.")
  } 
  stats[[paste("monthly",nmonthlies + 1,".done", sep="")]] <<- FALSE # Makes a new variable for numbered monthly to log progress, puts it in stats so it will save - need to use the stats[[variable name]] <<- to get it to work for changing variable-name variables in stats rather than the global env, assign() is no good for this
  stats[[paste("monthly",nmonthlies + 1,".name", sep="")]] <<- name # Makes a new variable to store monthly name
  stats$nmonthlies <<- nmonthlies + 1 # Updates the total number of monthlies - for properly labelling new monthlies, and later checking if they're all done
  write.csv(stats, savespot)
  detach(stats)
  return("You made a new monthly.")
}

#' Did Monthly
#' 
#' Checks of a monthly task as done.
#' 
#' @param name determines which task will be marked as complete.
#' @family activities
#' @export

did.monthly <- function(name){ 
  attach(stats)
  if(name == "deep clean"){ # Check if it's one of the defaults...
    monthlynum <- "d1"
  } else { # If not... Figure out which daily it is based on a name input, if it's 1 we start, if not we keep checking sequentially higher dailies until we find it
    monthlynum <- 1
    while(name != get(paste("monthly",monthlynum,".name", sep=""))){ 
      monthlynum <- monthlynum + 1
    }
  }
  if(get(paste("monthly",monthlynum,".done", sep="")) == FALSE){ # Check if this one has been done, if not mark it as done and proceed, else end the function with a message
    stats[[paste("monthly",monthlynum,".done", sep="")]] <<- TRUE
    if(monthlynum != "d1"){ # If the monthly isn't a default, increase nmonthlies.done 
      stats$nmonthlies.done <<- nmonthlies.done + 1
    }
  } else {
    detach(stats)
    return("You've already done this monthly.")
  }
  stats$construction.points <<- construction.points + 1
  detach(stats)
  attach(stats)
  if(nmonthlies.done == nmonthlies && !xor(monthlyd1.done, monthlyd1.used) ){ # Checks if all custom monthlies are done (if there's none, nweeklies = 0 so it evaluates true) and if all of the used & done or not used (so done will always be false anyways )
    stats$experience <<- experience + 5
    write.csv(stats, savespot)
    detach(stats)
    return("You've done all your monthlies!")
  } else {
    returnmessage <- paste("You've done your monthly: ", name, sep="")
    write.csv(stats, savespot)
    detach(stats)
    return(returnmessage)
  }
}

#' New Weekly
#' 
#' Creates a new weekly task
#' 
#' @param name sets the name of the task. Must be a short string.
#' @family task configuration
#' @export

new.weekly <- function(name){ # Creates a new weekly. Needs a name (short string)
  attach(stats)
  if(name == "read science" || name == "read social justice" || name == "hobby"){
    detach(stats)
    return("That name is reserved for a default weekly. Please choose a different name, or just use the default weekly.")
  } 
  stats[[paste("weekly",nweeklies + 1,".done", sep="")]] <<- FALSE # Makes a new variable for numbered weekly to log progress, puts it in stats so it will save - need to use the stats[[variable name]] <<- to get it to work for changing variable-name variables in stats rather than the global env, assign() is no good for this
  stats[[paste("weekly",nweeklies + 1,".name", sep="")]] <<- name # Makes a new variable to store weekly name
  stats$nweeklies <<- nweeklies + 1 # Updates the total number of weeklies - for properly labelling new weeklies, and later checking if they're all done
  write.csv(stats, savespot)
  detach(stats)
  return("You made a new weekly.")
}

#' Did Weekly
#' 
#' Checks of a weekly task as done.
#' 
#' @param name determines which task will be marked as complete.
#' @family activities
#' @export

did.weekly <- function(name){ 
  attach(stats)
  if(name == "read science"){ # Check if it's one of the defaults...
    weeklynum <- "d1"
  } else {
    if(name == "read social justice"){
      weeklynum <- "d2"
    } else {
      if(name == "hobby"){
        weeklynum <- "d3"
      } else { # If not... Figure out which daily it is based on a name input, if it's 1 we start, if not we keep checking sequentially higher dailies until we find it
        weeklynum <- 1
        while(name != get(paste("weekly",weeklynum,".name", sep=""))){ 
          weeklynum <- weeklynum + 1
        }
      }
    }
  }
  if(get(paste("weekly",weeklynum,".done", sep="")) == FALSE){ # Check if this one has been done, if not mark it as done and proceed, else end the function with a message
    stats[[paste("weekly",weeklynum,".done", sep="")]] <<- TRUE
    if(!xor(!xor(weeklynum == "d1", weeklynum == "d2"), weeklynum != "d3")){ # If the weekly isn't a default, increase nweeklies.done 
      stats$nweeklies.done <<- nweeklies.done + 1
    }
  } else {
    detach(stats)
    return("You've already done this weekly.")
  }
  stats$experience <<- experience + 1
  detach(stats)
  attach(stats)
  if(nweeklies.done == nweeklies && !xor(weeklyd1.done, weeklyd1.used) && !xor(weeklyd2.done, weeklyd2.used) && !xor(weeklyd3.done, weeklyd3.used) ){ # Checks if all custom weeklies are done (if there's none, nweeklies = 0 so it evaluates true) and if all of the used & done or not used (so done will always be false anyways )
    stats$construction.points <<- construction.points + 1
    write.csv(stats, savespot)
    detach(stats)
    return("You've done all your weeklies, and made some progress upgrading your home!")
  } else {
    returnmessage <- paste("You've done your weekly: ", name, sep="")
    write.csv(stats, savespot)
    detach(stats)
    return(returnmessage)
  }
}

#' New Daily
#' 
#' Creates a new daily task
#' 
#' Walk-type dailies apply the \code{\link{scavenge}} action automatically when completed. Clean-type dailies apply the \code{\link{clean}} activity automatically when completed. Mana-type dailies raise mana by one point when completed.
#' 
#' @param name sets the name of the task. Must be a short string.
#' @param type sets which type of reward is granted for completing the daily. Valid types are "walk", "clean", "mana", "none"
#' @family task configuration
#' @export

new.daily <- function(type, name){ # Creates a new daily. Needs a type and name (short string)
  attach(stats)
  if(name == "walk" || name == "tidy" || name == "meditate"){
    detach(stats)
    return("That name is reserved for a default daily. Please choose a different name, or just use the default daily.")
  }
  if(type == "walk" || type == "clean" || type == "mana" || type == "none"){
    stats[[paste("daily",ndailies + 1,".done", sep="")]] <<- FALSE # Makes a new variable for numbered daily to log progress, puts it in stats so it will save - need to use the stats[[variable name]] <<- to get it to work for changing variable-name variables in stats rather than the global env, assign() is no good for this
    stats[[paste("daily",ndailies + 1,".type", sep="")]] <<- type # Makes a new variable to store daily type
    stats[[paste("daily",ndailies + 1,".name", sep="")]] <<- name # Makes a new variable to store daily name
    stats$ndailies <<- ndailies + 1 # Updates the total number of dailies - for properly labelling new dailies, and later checking if they're all done
    write.csv(stats, savespot)
    detach(stats)
    return("You made a new daily.")
  } else {
    detach(stats)
    return("Invalid daily type.")
  }
}

#' Did Daily
#' 
#' Checks of a daily task as done.
#' 
#' @param name determines which task will be marked as complete.
#' @param x Defaults to 15. Sets how long the time was for scavenging in walk-type dailies. 
#' @family activities
#' @export

did.daily <- function(name, x = 15){ # x only used/necessary if using a walk daily
  attach(stats)
  if(name == "walk"){ # Check if it's one of the defaults...
    dailynum <- "d1"
  } else {
    if(name == "tidy"){
      dailynum <- "d2"
    } else {
      if(name == "meditate"){
        dailynum <- "d3"
      } else { 
        if(name == "meds"){
          dailynum <- "d4"
        } else { # If not... Figure out which daily it is based on a name input, if it's 1 we start, if not we keep checking sequentially higher dailies until we find it
          dailynum <- 1
          while(name != get(paste("daily",dailynum,".name", sep=""))){ 
            dailynum <- dailynum + 1
          }
        }
      }
    }
  }
  if(get(paste("daily",dailynum,".done", sep="")) == FALSE){ # Check if this one has been done, if not mark it as done and proceed, else end the function with a message
    stats[[paste("daily",dailynum,".done", sep="")]] <<- TRUE
    if(!xor(!xor(dailynum == "d1", dailynum == "d2"), !xor(dailynum == "d3", dailynum == "d4") )){ # If the daily isn't a default, increase ndailies.done 
      stats$ndailies.done <<- ndailies.done + 1
    }
    
  } else {
    detach(stats)
    return("You've already done this daily.")
  }
  if(get(paste("daily", dailynum, ".type", sep="")) == "clean"){ # Does clean daily effects
    stats$cleaned <<- 1
    if(squalor > 0){
      stats$squalor <<- squalor - 1
    }
  }
  if(get(paste("daily", dailynum, ".type", sep="")) == "mana"){ # Does mana daily effects
    if(mana < max.mana){
      stats$mana <<- mana + 1
    }
  }
  if(get(paste("daily", dailynum, ".type", sep="")) == "walk"){ # Does walk daily effects
    detach(stats)
    scavenge(x)
    attach(stats)
  }
  detach(stats)
  attach(stats)
  if(ndailies.done == ndailies && !xor(dailyd1.done, dailyd1.used) && !xor(dailyd2.done, dailyd2.used) && !xor(dailyd3.done, dailyd3.used) && !xor(dailyd4.done, dailyd4.used)){ # Checks if all custom dailies are done (if there's none, ndailies = 0 so it evaluates true) and if all of the used & done or not used (so done will always be false anyways )
    stats$experience <<- experience + 1
    write.csv(stats, savespot)
    detach(stats)
    return("You've done all your dailies!")
  } else {
    returnmessage <- paste("You've done your daily: ", name, sep="")
    write.csv(stats, savespot)
    detach(stats)
    return(returnmessage)
  }
}

#' Run Day
#' 
#' Run the day and process stat changes. 
#' 
#' Runs the day and updates all the stats that change daily. Should be done daily, as it updates the day of the week. Resets dailies, and weeklies when run on Sunday. 
#' Be sure to only do this after you're done all of the things you wanted to do that day, because you can take damage! Does not automatically track months. 
#' 
#' @param endmonth defaults to \code{FALSE} To reset montlies use the \code{endmonth = TRUE}.
#' @export

run.day <- function(endmonth = FALSE){
  attach(stats)
  if(food > 0){
    stats$food <<- food - 1
  } else {
    stats$health <<- health - 1
    print("You should find some food...")
  }
  if(cleaned == 0){
    stats$squalor <<- squalor + 1
    print("Something smells...")
  }
  if(squalor >= squalor.tolerance){
    stats$health <<- health - floor(squalor / squalor.tolerance)
    print("You feel sick.")
  }
  if(dailyd4.done == FALSE && dailyd4.used == TRUE){
    stats$health <<- health - 1
    print("You forgot to take your meds.")
  }
  if(sample(1:6, 1) > warmth){
    if(fuel > 0){
      stats$fuel <<- fuel - 1
      print("The night was cold, but fortunately you had firewood.")
    }else{
      stats$health <<- health - 1
      print("The night was cold.")
    }
  }
  if((ndailies.done == 0 && ndailies > 0) && ((dailyd1.done == FALSE && dailyd1.used == TRUE) || (dailyd1.done == FALSE && dailyd1.used == FALSE)) && ((dailyd2.done == FALSE && dailyd2.used == TRUE) || (dailyd2.done == FALSE && dailyd2.used == FALSE)) && ((dailyd3.done == FALSE && dailyd3.used == TRUE) || (dailyd3.done == FALSE && dailyd3.used == FALSE)) && ((dailyd4.done == FALSE && dailyd4.used == TRUE) || (dailyd4.done == FALSE && dailyd4.used == FALSE)) ){
    stats$momentum <<- momentum - 1
    print("Moving is hard...")
  }
  if(ndailies.done == ndailies && !xor(dailyd1.done, dailyd1.used) && !xor(dailyd2.done, dailyd2.used) && !xor(dailyd3.done, dailyd3.used)){
    stats$momentum <<- momentum + 1
    experience <<- experience + 1
    print("You're on a roll.")
  }
  if(experience >= max.experience){
    stats$levelup <<- levelup + 1
    stats$level <<- level + 1
    stats$experience <<- experience %% max.experience
    stats$max.experience <<- max.experience + 5
    print("Ding!")
  }
  stats$dailyd1.done <<- 0
  stats$dailyd2.done <<- 0
  stats$dailyd3.done <<- 0
  stats$dailyd4.done <<- 0
  stats$ndailies.done <<- 0
  dailynum <- 1
  while(exists(paste("daily",dailynum,".name", sep=""))){ 
    stats[[paste("daily",dailynum,".done", sep="")]] <<- FALSE
    dailynum <- dailynum + 1
  }
  
  if(day == "monday"){
    stats$day <<- "tuesday"
  }
  if(day == "tuesday"){
    stats$day <<- "wednesday"
  }
  if(day == "wednesday"){
    stats$day <<- "thursday"
  }
  if(day == "thursday"){
    stats$day <<- "friday"
  }
  if(day == "friday"){
    stats$day <<- "saturday"
  }
  if(day == "saturday"){
    stats$day <<- "sunday"
  }
  if(day == "sunday"){
    stats$day <<- "monday"
    stats$weeklyd1.done <<- FALSE
    stats$weeklyd2.done <<- FALSE
    stats$weeklyd3.done <<- FALSE
    stats$nweeklies.done <<- 0
    weeklynum <- 1
    while(exists(paste("weekly",weeklynum,".name", sep=""))){ 
      stats[[paste("weekly",weeklynum,".done", sep="")]] <<- FALSE
      weeklynum <- weeklynum + 1
    }
  }
  if(endmonth == TRUE){
    stats$monthlyd1.done <<- FALSE
    stats$nmonthlies.done <<- 0
    monthlynum <- 1
    while(exists(paste("monthly",monthlynum,".name", sep=""))){ 
      stats[[paste("monthly",monthlynum,".done", sep="")]] <<- FALSE
      monthlynum <- monthlynum + 1
    }
  }
  stats$regencount <- regencount + 1
  if(regencount >= 5){
    stats$regencount <<- regencount - 5
    if(health < max.health){
      stats$health <<- health + 1
    }
  }
  detach(stats)
  attach(stats)
  if(health < 0){
    print("The struggle has proven too much. It is hard to grow while in such pain. Perhaps, however, with time you will regain your feet.")
    stats$experience <<- 0
    stats$health <<- 5
  }
  stats$cleaned <<- 0
  write.csv(stats, savespot)
  detach(stats)
  return("Time has passed.")
}





#Non-Dailies cleaning

#' Clean
#' 
#' Cleans, preventing squalor gain and decreasing squalor. For non-daily or monthly cleaning.
#' @family activities
#' @export

clean <- function(){
  attach(stats)
  stats$cleaned <<- 1
  if(squalor > 0){
    stats$squalor <<- squalor - 1
  }
  write.csv(stats, savespot)
  detach(stats)
  return("You are keeping squalor at bay.")
}

# Scavenging
# If I add resource storage caps this will need a lot of tweaking

#' Scavenge
#' 
#' Scavenges for supplies when going on a walk. For non-daily walks.
#' 
#' Takes an argument representing minutes walking, for example \code{did.walk(15)}. Defaults to 15. Each 15 minute incrament provides a bonus to scavenging.
#' @family activities
#' @export

scavenge <- function(x = 15){ #works with no argument, in which case it assumes 15 (the smallest increment that gives a bonus)
  attach(stats)
  scavpool1 <- c("nothing", "food", "food", "food", "fuel", "fuel")
  scavpool2 <- c(scavpool1, "material")
  scav.points <- sample(0:3, size = 1) + momentum + floor(x / 15) #The scavenge sample range is a good candidate for expanding later.
  scav.something <- 0
  scav.found <- c()
  while(scav.points > 1){
    scav.pass <- sample(scavpool2, size = 1)
    if(scav.pass == "nothing"){
      scav.points <- scav.points - 1
    }
    if(scav.pass == "food"){
      scav.points <- scav.points - 1
      stats$food <<- food + 1
      scav.found <- c(scav.found, "food")
      scav.something <- 1
    }
    if(scav.pass == "fuel"){
      scav.points <- scav.points - 1
      stats$fuel <<- fuel + 1 
      scav.found <- c(scav.found, "fuel")
      scav.something <- 1
    }
    if(scav.pass == "material"){
      scav.points <- scav.points - 2
      stats$building.materials <<- building.materials + 1 
      scav.found <- c(scav.found, "building materials")
      scav.something <- 1
    }
  }
  while(scav.points > 0){
    scav.pass <- sample(scavpool1, size = 1)
    if(scav.pass == "nothing"){
      scav.points <- scav.points - 1
    }
    if(scav.pass == "food"){
      scav.points <- scav.points - 1
      stats$food <<- food + 1
      scav.found <- c(scav.found, "food")
      scav.something <- 1
    }
    if(scav.pass == "fuel"){
      scav.points <- scav.points - 1
      stats$fuel <<- fuel + 1 
      scav.found <- c(scav.found, "fuel")
      scav.something <- 1
    }
    write.csv(stats, savespot)
    detach(stats)
  }
  if(scav.something == 0){
    print("You found nothing.")
  } else {
    print("You found:")
    print(scav.found)
  }
}

# Level up stats, uses levelup to increase health or mana

#' Level Up Health
#' 
#' Spends a level up to increase max health by one point.
#' @export

level.health <- function(){
  attach(stats)
  if(levelup > 0){
    stats$max.health <<- max.health + 1
    stats$health <<- health + 1
    stats$levelup <<- levelup - 1
    write.csv(stats, savespot)
    detach(stats)
    return("Your max health has increased.")
  }else{
    detach(stats)
    return("You don't have an available level up to spend.")
  }
}

#' Level Up Mana
#' 
#' Spends a level up to increase max mana by one point.
#' @export

level.mana <- function(){
  attach(stats)
  if(levelup > 0){
    stats$max.mana <<- max.mana + 1
    stats$mana <<- mana + 1
    stats$levelup <<- levelup - 1
    write.csv(stats, savespot)
    detach(stats)
    return("Your max mana has increased.")
  }else{
    detach(stats)
    return("You don't have an available level up to spend.")
  }
}

# Spells

#' Learn Lesser Heal
#' 
#' Spends a level up to learn the spell Lesser Heal.
#' 
#' Requires one mana to learn and cast. Heals one point of health.
#' @export

learn.lesserheal <- function(){
  attach(stats)
  if(levelup > 0 && max.mana > 0){
    stats$levelup <<- 1
    stats$spell.lesserheal <<- 1
    write.csv(stats, savespot)
    detach(stats)
    return("You have learned to cast Lesser Heal.")
  } else {
    detach(stats)
    return("You don't meet the requirements to learn this spell.")
  }
}

#' Cast Lesser Heal
#' 
#' Spend one mana to speed up health regeneration a bit.
#' @export

cast.lesserheal <- function(){
  attach(stats)
  if(health < max.health){
    if(mana > 0){
      stats$regencount <<- regencount + 3
      stats$mana <<- mana - 1
      write.csv(stats, savespot)
      detach(stats)
      return("You cast Lesser Heal.")
    } else {
      detach(stats)
      return("You don't have the mana to cast this spell.")
    }
  } else {
    detach(stats)
    return("You are already at max health.")
  }
}
# Build buildings

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

#' Build Cabin
#'
#' Builds a warm house.
#'
#' Costs 20 building materials and 6 construction points. Provides a home which will keep you warm on approximately two thirds of nights.
#' @export

build.cabin <- function(){
  attach(stats)
  if(warmth < 4){
    if(building.materials >= 20 && construction.points >= 6){
      stats$building.materials <<- building.materials - 20
      stats$building.cabin <<- 0
      stats$construction.points <<- construction.points - 6
      stats$warmth <<- 4
      write.csv(stats, savespot)
      detach(stats)
      return("You built a nice cabin. It will protect you from all but the coldest of nights.")
    }else{
      detach(stats)
      return("You do not meet the requirements to build this.")
    }
  } else {
    detach(stats)
    return("You already have a better shelter.")
  }
}


