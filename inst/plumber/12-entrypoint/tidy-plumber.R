## ---- tidy-plumber

#* @get /counter
function(req){
  count <- 0
  if (!is.null(req$session$counter)){
    count <- as.numeric(req$session$counter)
  }
  req$session$counter <- count + 1
  return(paste0("This is visit #", count))
}

#* @plumber
function(pr) {
  pr %>%
    pr_hook("preroute", session_cookie("secret", "cookieName"))
}
