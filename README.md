# votempls: Minneapolis ranked choice voting results

This R package contains the ranked choice ballots for the 2013 and 2017
Minneapolis elections. It includes the elections for mayor, city council,
park and recreation commissioner, park board, and board of estimate and taxation.


## Requirements and installation

R is a free software environment for statistical computation and data visualization. 
Many thousands of packages have been written to extend the power of R, and this is 
one of them! This package requires version 2.10 or later.

Install the ``devtools`` package if you haven't already.

    > install.packages("devtools")

Then you can install this package directly from GitHub.

    > install.packages("radcliffe/votempls")

## Getting started

Load the package, and then load the data.

    > require("votempls")
    > load("MplsRankedChoice")

This loads a data frame with 930145 rows and 9 variables:

* Year: The election year (2013 or 2017)
* City: Minneapolis
* Contest: The possible values are "Board of Estimate & Taxation", "City Council", "Mayor", "Park & Recreation Commissioner", and "Park Board".
* Polling Place: A polling location, identified by ward and precinct.
* Ward: The Minneapolis ward, a number between 1 and 13, but stored as characters.
* Precinct: The election precinct. Usually a number, but stored as characters.
* FirstChoice: The voter's first choice.
* SecondChoice: The voter's second choice.
* ThirdChoice: The voter's third choice.

## Filtering the data

You will probably want to select a subset of the rows. This is done most conveniently using ``dplyr::filter``.

Example:

     > mayor2017 = dplyr::filter(MplsRankedChoice, Year == 2013, Contest == "Mayor")

## Source

http://vote.minneapolismn.gov/results/index.htm
