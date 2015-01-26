################################################################################
# File description
################################################################################
# TODO(perdue): Add file description.
#
# * To run this in an interactive R session:
#   Note: the data file for exercise 2-8 is "College.csv".
#   Note: the second arg ("nofix") is optional.
#   > system(paste("Rscript 2-8.R", "[Name of CSV file]", "nofix"))
    

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
fileName = args[1]
if (length(args) < 2) {
  showFix = TRUE
} else if (args[2] == "nofix") {
  showFix = FALSE
} else {
  showFix = TRUE
}

# 8(a)
setwd(".")  # Set working dir.

#printf("%s\n", dir(getwd()))  # Print working dir contents.
printf("Reading from \"%s\"\n", fileName)

# 8(a)
data = read.csv(fileName)

# 8(b)
if (showFix) {
  fix(data)  # Invokes edit and assigns the edited version to user's workspace.
}
rownames(data) <- data[, 1]  # Set the row names using the 1st column.
if (showFix) {
  fix(data)  # Look at it again.
}
data <- data[, -1]  # Eliminate first column.
if (showFix) {
  fix(data)  # Look at it again.
}

# 8(c) i.
summary(data)

# 8(c) ii.
pairs(data[, 1:10])
Pause()

##### From here down is specific to exercise 8 #####
# 8(c) iii.
data$Private <- as.factor(data$Private)
plot(data$Private, data$Outstate, varwidth=T, xlab="Private", ylab="Outstate")
Pause()

# 8(c) iv.
Elite <- rep("No", nrow(data))  # Replicate "No" nrow times
                                # -> creates new vector
                                #    representing a column in the table.
Elite[data$Top10perc > 50] <- "Yes"
data <- data.frame(data, Elite)
data$Elite <- as.factor(data$Elite)
summary(data)
plot(data$Elite, data$Outstate, varwidth=T, xlab="Elite", ylab="OutState")
Pause()
