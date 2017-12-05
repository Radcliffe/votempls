#' @title Minneapolis Ranked Choice Voting Data
#' @description This data set contains ranked choice ballots for the 2013 and 2017 Minneapolis municipal elections
#' @format A data frame with 930145 rows and 9 variables:
#' \describe{
#'   \item{Id}{unique id number}
#'   \item{Year}{election year (2013 or 2017)}
#'   \item{City}{always equal to "Minneapolis"}
#'   \item{Contest}{is one of the following: "Board of Estimate & Taxation",
#'   "City Council", "Mayor", "Park & Recreation Commissioner", "Park Board"}
#'   \item{PollingPlace}{contains the ward and precinct}
#'   \item{Ward}{ward, numbered from 1 to 13}
#'   \item{Precinct}{precinct}
#'   \item{FirstChoice}{the voter's first choice}
#'   \item{SecondChoice}{the voter's second choice}
#'   \item{ThirdChoice}{the voter's third choice}
#' }
#' @source \url{http://vote.minneapolismn.gov/results/index.htm}
"MplsRankedChoice"
