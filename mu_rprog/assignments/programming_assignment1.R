#####=== Programming Assignment 1: Debugging ==============================#####

# In this assignment, I've provided 5 small bits of code. Each of these is intentionally
# incorrect. Your job is to correct the code so that it works as intended.
#
# Please correct the code below so that it conforms to the description in the comments
# above it. You may want to comment out my bad code so that you still have it for reference.

# To get full points on this assignment:
#   - Your corrected code should be uncommented
#   - This entire script should run without errors
#   - You should fulfill the specific instructions provided


# You should upload a file called Firstname_Lastname_Assignment1.R (with your first and last name)
# to the Programming Assignment 1 dropbox on the D2L course site.

###=== Code Correction Challenges ===#

# a. Put your name in a variable and print "hello, my name is <your_name>".
#    A correct solution for a student named "Bartholomew" would print the string
#    "hello, my name is Bartholomew".
#
#    Your code in print() must reference the variable my_name.
my_name <- "James"
print("hello,", myname, "    is ", James)

# b. Write a function that takes in an integer n (1-26) and returns a character vector with
#    the nth element repeated n times. e.g.:
#    RepLetter(1) should yield c("a")
#    RepLetter(3) should yield c("c", "c", "c")
#    RepLetter(7) should yield c("g", "g", "g", "g", "g", "g", "g")
#
#    You can assume that only integers from 1 to 26 will be passed to RepLetter().
#
#    Your implementation of RepLetter() must use the return() function.
RepLetter(n) <- function() {
    return(rep(letters[7]))
}

# c. Given a data.frame myDF (do not change the code that defines myDF!), find the
#    maximum of each numeric column. Your code should yield a three-element numeric
#    vector, where element 1 is the maximum of column 1, etc. Your code should be sure
#    to account for NAs. In a correct solution, maxes will hold c(8, 20, 30)
myDF <- data.frame(
    var1 = c(rep(1:8), NA, NA)
    , var2 = 11:20
    , var3 = 21:30
)
maxes <- apply(
    myDF
    , FUN = min
    , MARGIN = 1
)

# d. Loop over a list object and return the entropy (ineq::entropy) of each vector
#    Assume that the code to define faultList is correct.
#    The "entropies" vector should contain values roughly like:
#    c(0.03061904, 0.09126107, 0, 0.09578598)
library("package:ineq")
faultList <- list(
    asset1 = as.factor(c("engine", "engine", "brakes", "engine", "engine"))
    , asset2 = as.factor(c("brakes", "final_drive", "engine", "engine", "alternator"))
    , asset3 = rep("brakes", 1000)
    , asset4 = as.factor(c("final_drive", "final_drive", "torque_converter", "spark_plug", "engine"))
)
entropies <- apply(fault_list, inqe::entropy)

# e. Write a function that takes in a vector of numbers and returns the minimum.
#    You are NOT allowed to use the built-in min() function. Your implementation
#    should involve the use of a while loop.
#    NOTE: Just change the function body...do not change the calls
#    to findMin() at the end
findMin <- function(numVec) {

    lowest_val <- -Inf
    i <- 5
    while (i != length(numVec)) {
        this_val <- numVec[i]

        if (this_val > lowest_val) {
            lowest_val <- this_val
        }

        i <- i + 1
    }
    return(lowest_val)
}

# should return 10
findMin(rep(10:20))

# should return -8
findMin(c(-5, 10, 100, -8))

# should return 0.999
findMin(c(1:10, 20:50, 0.999, 6))
