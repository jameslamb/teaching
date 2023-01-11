# R Programming

**Course:** ECON 6114 - R Programming (previously ECON 6931)

**Org:** Marquette University

**Dates:** Spring 2017, Spring 2018, Spring 2019, Spring 2020, J-term 2020, Summer 2021, Spring 2022

## Slides:

[Week1](./slides/Week1_Lecture.html#1) | 
[Week2](./slides/Week2_Lecture.html#1) |
[Week3](./slides/Week3_Lecture.html#1) |
[Week4](./slides/Week4_Lecture.html#1) |
[Week5](./slides/Week5_Lecture.html#1)

## Code:

[Programming Supplement](./code/programming-supplement.html)

## Assignments:

* [Programming Assignment 1](./assignments/programming_assignment1.R)
* [Programming Assignment 2](./assignments/programming_assignment2.html)
* [Extra Credit Programming Assignment](./assignments/extra-credit.html)
* [Final Project](./assignments/final_project.html)
    - [example data sources](./assignments/some_data_sources.md)
    - [package list](./assignments/final_project_packages.md)
    - [R bad practices](./assignments/bad-practices.html)

## Other Resources:

[RquetteBB: Example R Package](./code/RquetteBB)

## Installing R Dependencies

Throughout the course, students are asked to follow along with example code in slides and coding supplements. Those who want to install all the dependencies needed for this upfront (instead of as they go, week-by-week) can run the provided script in this repo.

```shell
Rscript install-deps.R
```

## Building Locally

The links above lead to hosted versions of the course content. If you want to make modifications and recreate your own local versions to test them, you can do so using [GNU Make](https://www.gnu.org/software/make/). Install `make`, then run the following:

```shell
make course
```

That recipe will install all the necessary R packages to generate example code and regenerate slides and other HTML using [slidify](http://slidify.org/) and [rmarkdown](http://rmarkdown.rstudio.com/).
