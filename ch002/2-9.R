################################################################################
# File description
################################################################################
# TODO(perdue): Add file description.
#
# * To run this in an interactive R session:
#   Note: the data file for exercise 2-9 is "Auto.csv".
#   > system(paste("Rscript 2-8.R", "[Name of CSV file]"))
    

################################################################################
# Function definitions
################################################################################
printf <- function(...) {
  cat(sprintf(...))
}

Pause <- function() {
  # A hack to get the script to pause
  printf("(Paused) Press [Enter] to continue: ")
  invisible(readLines("stdin", n=1))
}

################################################################################
# Executed Statements
################################################################################
X11()  # Start graphics
args <- commandArgs(T)
file.name <- args[1]
setwd(".")
printf("Reading from \"%s\"\n", file.name)
data = read.csv(file.name, header=T, na.strings="?")
printf("Data dimensions: \n")
dim(data)
data <- na.omit(data)
printf("Removed rows with missing observations\n")
printf("Data dimensions: \n")
dim(data)

# 9(a)
printf("\n")
printf("Quantitative predictors: mpg, displacement, hp, weight, acceleration\n")
printf("Qualitative predictors: cylinders, year, origin, name\n")

# 9(b)
printf("\n")
printf("Ranges:\n")
printf("mpg range: \n")
range(data$mpg)
printf("displacement range: \n")
range(data$displacement)
printf("horsepower range: \n")
range(data$horsepower)
printf("weight range: \n")
range(data$weight)
printf("acceleration range: \n")
range(data$acceleration)

# 9(c)
printf("\n")
printf("Means and standard deviations:\n")
printf("mpg: %f +- %f\n", mean(data$mpg), sd(data$mpg))
printf("displacement: %f +- %f\n", mean(data$displacement),
                                   sd(data$displacement))
printf("horsepower: %f +- %f\n", mean(data$horsepower), sd(data$horsepower))
printf("weight: %f +- %f\n", mean(data$weight), sd(data$weight))
printf("acceleration: %f +- %f\n", mean(data$acceleration),
                                   sd(data$acceleration))
