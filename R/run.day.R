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
