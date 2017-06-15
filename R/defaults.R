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