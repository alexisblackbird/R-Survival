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
      stats$food <<- stats$food + 1
      scav.found <- c(scav.found, "food")
      scav.something <- 1
    }
    if(scav.pass == "fuel"){
      scav.points <- scav.points - 1
      stats$fuel <<- stats$fuel + 1 
      scav.found <- c(scav.found, "fuel")
      scav.something <- 1
    }
    if(scav.pass == "material"){
      scav.points <- scav.points - 2
      stats$building.materials <<- stats$building.materials + 1 
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
      stats$food <<- stats$food + 1
      scav.found <- c(scav.found, "food")
      scav.something <- 1
    }
    if(scav.pass == "fuel"){
      scav.points <- scav.points - 1
      stats$fuel <<- stats$fuel + 1 
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