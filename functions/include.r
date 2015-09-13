#loads the libraries
#setwd("C:/Users/colomb/Desktop/sv_buridan/buridan/analysis2")
res <- suppressMessages(
	c(require("adehabitatLT"),#require("adehabitat"),
	require("XML"),
	require("lattice"),
	require("hexbin"),
	require("colorRamps"),
	require("rgl"),
	require("gplots"),
  require("corrplot")
   )
)
if (any(res==FALSE)) 
stop("Could not find all required packages. Make sure all following packages are installed.
run the install_package.r on our R GUI (found in the install folder)",
call. = FALSE, domain = NA)

# sets options
options("digits.secs" = 3)
	   
# loads the analysis functions
source("functions/utils.r")
source("functions/newfct.r")
source("functions/functions.r")
source("functions/plot_functions.r")
# source("functions/defaultvalues.r")