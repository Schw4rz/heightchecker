# Script for simple function that checks the difference in height from the sex-
# specific mean for each of the students in the given data.frame
# Date: 16.11.2017
# Author: Schw4rz

library(data.table)

# input data
age <- c(19, 22, 21, 23, 22, 20, 28, 25)
weight <- c(50, 75, 80, 56, 75, 58, 65, 82)
height <- c(1.66, 1.78, 1.90, 1.72, 1.83, 1.68, 1.70, 1.85)
sex <- c("F", "M", "M", "F", "M", "F", "F", "M")
name <- c("Maria", "Franz", "Peter", "Lisa", "Hans", "Eva", "Mia", "Karl")

# main dataset
students <- data.frame(age, weight, height, sex, name)

# function that calculates the difference
checkHeight3 <- function(students.input = students) {
  # calculate differences in centimeters
  setDT(students)[, difference := 100 * (.SD$height - mean(.SD$height)), by = sex]
  # return name and difference only
  students[, .(name, difference)]
}

checkHeight3(students)
