# votempls: Minneapolis ranked choice voting results

This R package contains the ranked choice ballots for the 2013 and 2017
Minneapolis elections. It includes the elections for mayor, city council,
park and recreation commissioner, park board, and board of estimate and taxation.


## Requirements and installation

R is a free software environment for statistical computation and data visualization. 
Many thousands of packages have been written to extend the power of R, and this is 
one of them! This package requires version 2.10 or later.

Install the `devtools` package if you haven't already.

```r
install.packages("devtools")
```

Then you can install this package directly from GitHub.

```r
install.packages("radcliffe/votempls")
```

## Getting started

Load the package, and then load the data.

```r
require("votempls")
load("MplsRankedChoice")
```

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

```r
mayor2017 = dplyr::filter(MplsRankedChoice, Year == 2017, Contest == "Mayor")
```

Visualizing the data can be done in `ggplot` by melting the data with `melt()` from the `data.table` package or `gather()` from the `tidyr` package.

```r
# data.table::melt()
library(data.table)
mayor2017Melted <- melt(mayor2017[,c("Ward",
                                     "FirstChoice",
                                     "SecondChoice",
                                     "ThirdChoice")],"Ward")
names(mayor2017Melted) <- c("Ward","Choice","Candidate")
# tidyr::gather()
library(tidyr)
mayor2017Melted <- gather(mayor2017[,c("Ward",
                                       "FirstChoice",
                                       "SecondChoice",
                                       "ThirdChoice")],
                          Choice,
                          Candidate,
                          -Ward)
```

```r
library(ggplot2)
# All Wards
ggplot(mayor2017Melted,aes(x = Choice, y = Candidate)) +
  geom_jitter(aes(colour = Choice), alpha = .01) +
  theme_minimal() + theme(legend.position="none")

# Compare Ward Results
ggplot(dplyr::filter(mayor2017Melted, Ward %in% c("8","13")),
                   aes(x = Choice, y = Candidate)) +
  geom_jitter(aes(colour = Choice), alpha = .1) +
  theme_minimal() + theme(legend.position="none") +
  facet_wrap(~Ward,ncol = 2)
```

## Source

http://vote.minneapolismn.gov/results/index.htm
