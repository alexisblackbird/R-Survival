#' View Tasks
#' 
#' Displays tasks and if they have been completed or not.
#' 
#' @family display
#' @export

view.tasks <- function(){
  print(noquote("Dailies"))
  if(stats$dailyd1.used == TRUE){
    if(stats$dailyd1.done == TRUE){
      check <- "x"
    } else {
      check <- " "
    }
    print(noquote(paste0("[", check, "]", " walk")))
  }
  if(stats$dailyd2.used == TRUE){
    if(stats$dailyd2.done == TRUE){
      check <- "x"
    } else {
      check <- " "
    }
    print(noquote(paste0("[", check, "]", " tidy")))
  }
  if(stats$dailyd3.used == TRUE){
    if(stats$dailyd3.done == TRUE){
      check <- "x"
    } else {
      check <- " "
    }
    print(noquote(paste0("[", check, "]", " meditate")))
  }
  if(stats$dailyd4.used == TRUE){
    if(stats$dailyd4.done == TRUE){
      check <- "x"
    } else {
      check <- " "
    }
    print(noquote(paste0("[", check, "]", " meds")))
  }
  count <- 1
  while(exists(paste0("daily",count,".done"), stats)){
    if(get(paste0("daily",count,".done"), stats) == TRUE){
      check <- "x"
    } else {
      check <- " "
    }
    print(noquote(paste0("[", check, "] ", get(paste0("daily",count,".name"), stats))))
    count <- count + 1
  }
  print(noquote(" "))
  print(noquote("Weeklies"))
  if(stats$weeklyd1.used == TRUE){
    if(stats$weeklyd1.done == TRUE){
      check <- "x"
    } else {
      check <- " "
    }
    print(noquote(paste0("[", check, "]", " read science")))
  }
  if(stats$weeklyd2.used == TRUE){
    if(stats$weeklyd2.done == TRUE){
      check <- "x"
    } else {
      check <- " "
    }
    print(noquote(paste0("[", check, "]", " read social justice")))
  }
  if(stats$weeklyd3.used == TRUE){
    if(stats$weeklyd3.done == TRUE){
      check <- "x"
    } else {
      check <- " "
    }
    print(noquote(paste0("[", check, "]", " hobby")))
  }
  count <- 1
  while(exists(paste0("weekly",count,".done"), stats)){
    if(get(paste0("weekly",count,".done"), stats) == TRUE){
      check <- "x"
    } else {
      check <- " "
    }
    print(noquote(paste0("[", check, "] ", get(paste0("weekly",count,".name"), stats))))
    count <- count + 1
  }
  print(noquote(" "))
  print(noquote("Monthlies"))
  if(stats$monthlyd1.used == TRUE){
    if(stats$weeklyd1.done == TRUE){
      check <- "x"
    } else {
      check <- " "
    }
    print(noquote(paste0("[", check, "]", " deep clean")))
  }
  count <- 1
  while(exists(paste0("monthly",count,".done"), stats)){
    if(get(paste0("monthly",count,".done"), stats) == TRUE){
      check <- "x"
    } else {
      check <- " "
    }
    print(noquote(paste0("[", check, "] ", get(paste0("monthly",count,".name"), stats))))
    count <- count + 1
  }
}