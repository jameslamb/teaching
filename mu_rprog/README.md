# R Programming

**Course:** ECON 6931 - Introduction to R Programming

**Org:** Marquette University

**Dates:** Spring 2018

## Slides:

[Week1](https://jameslamb.github.io/teaching/mu_rprog/slides/Week1_Lecture.html#1) | 
[Week2](https://jameslamb.github.io/teaching/mu_rprog/slides/Week2_Lecture.html#1) |
[Week3](https://jameslamb.github.io/teaching/mu_rprog/slides/Week3_Lecture.html#1) |
[Week4](https://jameslamb.github.io/teaching/mu_rprog/slides/Week4_Lecture.html#1) |
[Week5](https://jameslamb.github.io/teaching/mu_rprog/slides/Week5_Lecture.html#1) |
[Git basics](https://jameslamb.github.io/teaching/mu_rprog/slides/git.html#1)

## Code:

[Week1 Supplement](https://jameslamb.github.io/teaching/mu_rprog/code/Week1_Supplement.html) | [Week2 Supplement](https://jameslamb.github.io/teaching/mu_rprog/code/Week2_Supplement.html) | [Week3 Supplement](https://jameslamb.github.io/teaching/mu_rprog/code/Week3_Supplement.html) | [Week4 Supplement](https://jameslamb.github.io/teaching/mu_rprog/code/Week4_Supplement.html) | [Week5 Supplement](https://jameslamb.github.io/teaching/mu_rprog/code/Week5_Supplement.html)

[RquetteBB: Example R Package](https://github.com/jameslamb/teaching/tree/master/mu_rprog/code/RquetteBB)

## Assignments:

[Programming Assignment 1](https://github.com/jameslamb/teaching/blob/master/mu_rprog/assignments/programming_assignment1.R) | [Programming Assignment 2](https://jameslamb.github.io/teaching/mu_rprog/assignments/programming_assignment2.html) | [Final Project](https://jameslamb.github.io/teaching/mu_rprog/assignments/final_project.html)

## Installing R Dependencies

Throughout the course, students are asked to follow along with example code in slides and coding supplements. Those who want to install all the dependencies needed for this upfront (instead of as they go, week-by-week) can run the provided script in this repo.

```
Rscript install_deps.R
```

## Building Locally

The links above lead to hosted versions of the course content. If you want to make modifications and recreate your own local versions to test them, you can do so using [GNU Make](https://www.gnu.org/software/make/). Install `make`, then run the following:

```
make course
```

That recipe will install all the necessary R packages to generate example code and regenerate slides and other HTML using [slidify](http://slidify.org/) and [rmarkdown](http://rmarkdown.rstudio.com/).
