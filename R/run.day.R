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
  if(stats$food > 0){
    stats$food <<- stats$food - 1
  } else {
    stats$health <<- stats$health - 1
    print("You should find some food...")
  }
  if(stats$cleaned == 0){
    stats$squalor <<- stats$squalor + 1
    print("Something smells...")
  }
  if(stats$squalor >= stats$squalor.tolerance){
    stats$health <<- stats$health - floor(stats$squalor / stats$squalor.tolerance)
    print("You feel sick.")
  }
  if(stats$dailyd4.done == FALSE && stats$dailyd4.used == TRUE){
    stats$health <<- stats$health - 1
    print("You forgot to take your meds.")
  }
  if(sample(1:6, 1) > stats$warmth){
    if(stats$fuel > 0){
      stats$fuel <<- stats$fuel - 1
      print("The night was cold, but fortunately you had firewood.")
    }else{
      stats$health <<- stats$health - 1
      print("The night was cold.")
    }
  }
  if((stats$ndailies.done == 0 && stats$ndailies > 0) && ((stats$dailyd1.done == FALSE && stats$dailyd1.used == TRUE) || (stats$dailyd1.done == FALSE && stats$dailyd1.used == FALSE)) && ((stats$dailyd2.done == FALSE && stats$dailyd2.used == TRUE) || (stats$dailyd2.done == FALSE && stats$dailyd2.used == FALSE)) && ((stats$dailyd3.done == FALSE && stats$dailyd3.used == TRUE) || (stats$dailyd3.done == FALSE && stats$dailyd3.used == FALSE)) && ((stats$dailyd4.done == FALSE && stats$dailyd4.used == TRUE) || (stats$dailyd4.done == FALSE && stats$dailyd4.used == FALSE)) ){
    stats$momentum <<- stats$momentum - 1
    print("Moving is hard...")
  }
  if(stats$ndailies.done == stats$ndailies && !xor(stats$dailyd1.done, stats$dailyd1.used) && !xor(stats$dailyd2.done, stats$dailyd2.used) && !xor(stats$dailyd3.done, stats$dailyd3.used)){
    stats$momentum <<- stats$momentum + 1
    stats$experience <<- stats$experience + 1
    print("You're on a roll.")
  }
  if(stats$experience >= stats$max.experience){
    stats$levelup <<- stats$levelup + 1
    stats$level <<- stats$level + 1
    stats$experience <<- stats$experience %% stats$max.experience
    stats$max.experience <<- stats$max.experience + 5
    print("Ding!")
  }
  stats$dailyd1.done <<- 0
  stats$dailyd2.done <<- 0
  stats$dailyd3.done <<- 0
  stats$dailyd4.done <<- 0
  stats$ndailies.done <<- 0
  dailynum <- 1
  while(exists(paste("daily",dailynum,".name", sep=""), stats)){ 
    stats[[paste("daily",dailynum,".done", sep="")]] <<- FALSE
    dailynum <- dailynum + 1
  }
  
  if(stats$day == "monday"){
    stats$day <<- "tuesday"
  }
  if(stats$day == "tuesday"){
    stats$day <<- "wednesday"
  }
  if(stats$day == "wednesday"){
    stats$day <<- "thursday"
  }
  if(stats$day == "thursday"){
    stats$day <<- "friday"
  }
  if(stats$day == "friday"){
    stats$day <<- "saturday"
  }
  if(stats$day == "saturday"){
    stats$day <<- "sunday"
  }
  if(stats$day == "sunday"){
    stats$day <<- "monday"
    stats$weeklyd1.done <<- FALSE
    stats$weeklyd2.done <<- FALSE
    stats$weeklyd3.done <<- FALSE
    stats$nweeklies.done <<- 0
    weeklynum <- 1
    while(exists(paste("weekly",weeklynum,".name", sep=""), stats)){ 
      stats[[paste("weekly",weeklynum,".done", sep="")]] <<- FALSE
      weeklynum <- weeklynum + 1
    }
  }
  if(endmonth == TRUE){
    stats$monthlyd1.done <<- FALSE
    stats$nmonthlies.done <<- 0
    monthlynum <- 1
    while(exists(paste("monthly",monthlynum,".name", sep=""), stats)){ 
      stats[[paste("monthly",monthlynum,".done", sep="")]] <<- FALSE
      monthlynum <- monthlynum + 1
    }
  }
  stats$regencount <- stats$regencount + 1
  if(stats$regencount >= 5){
    stats$regencount <<- stats$regencount - 5
    if(stats$health < stats$max.health){
      stats$health <<- stats$health + 1
    }
  }
  if(stats$health < 0){
    print("You ran out of health. Your experience has been reset. Things may be hard, but please don't give up! You can keep going.")
    stats$experience <<- 0
    stats$health <<- 5
  }
  stats$cleaned <<- 0
  write.csv(stats, savespot)
  return("Time has passed.")
}
