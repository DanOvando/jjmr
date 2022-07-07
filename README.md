
<!-- README.md is generated from README.Rmd. Please edit that file -->

# jjmR

<!-- badges: start -->
<!-- badges: end -->

The goal of jjmR is to … Graphics and diagnostics libraries for SPRFMO’s
JJM model adopted from IMARPE’s jjmTools

## Installation

You can install the development version of jjmR like so:

``` r
install.packages("devtools")
devtools::install_github("SPRFMO/jjmR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(jjmR) #load library 
setwd("NAMEOFYOURDIRECTORY/jjm/assessment") # Make sure to keep the quotation marks!

assessment <- "h1_1.00"

h1.mod <- jjmR::readJJM(assessment, path = "config", input = "input") #pull in model 1
jjmR::kobe(h1.mod) #plot kobe plot
```
