## sje-xaringan.R
## master version: ~/papers/talks/sje-xaringan.R
require(printr)
require(knitr)
require(xtable)


## find the figures if you can't see them
im = function(f, width=NULL, height=NULL) {
  f= find_figure(f)
  if (!is.null(width)) {
    line = sprintf('<img src="%s", width=%s>',
                   knitr::image_uri(f), width)
  } else {
    if (!is.null(height)) {
      line = sprintf('<img src="%s", height=%s>',
                     knitr::image_uri(f), height)
    } else {
      line = sprintf('<img src="%s">', knitr::image_uri(f))
    }
  }
  line
}

fig_cache = new.env()

find_figure = function(f) {
  if (file.exists(f)) {
    return(f)
  }
  ## try the cache next
  f2 <- fig_cache[[f]]
  ##print(f2)
  
  if (!is.null(f2) && file.exists(f2) ) {
    return(f2)
  } else {
    cat("Looking up in cache...\n")
    p = system(sprintf("kpsewhich %s", f), intern = TRUE)
    if (length(p) > 0 ) {
      fig_cache[[f]] = p
      return(p)
    }
  }
}


im1 = function(f,width=600) {
  sprintf('<center><img src="%s", width=%s></center>\n', knitr::image_uri(find_figure(f)), width)
}
imh = function(f,height=600) {
  sprintf('<center><img src="%s", height=%s></center>\n', knitr::image_uri(find_figure(f)), height)
}


## Add some other useful functions.
pbr = function(text) {
  x = '<div style="font-size: 60%; position: absolute; right: 15%;   width: fit-content; height: fit-content; top:95%; z-index:10">'
  sprintf("%s%s</div>", x, text)
}
doi = function(doi) {
  ##text=sprintf("[%s](http://dx.doi.org/%s)", doi, doi)
  text=sprintf('<a href="http://dx.doi.org/%s">%s</a>', doi, doi)
  pbr(text)
}
