\name{MaxLife}
\alias{MaxiLife}
\title{MaxLife: A package to compare maximun lifespan between groups under different treatments or conditions}
\description{
Method to compare diferences in maximun lifespan between 2 or more groups.
It is based on the QT3 method described in "Statistical methods for testing effects on maximum lifespan” Wang et al. 2004. A variation of a "simple significance test for quantile regression" from David T. Redden and David B. Allison. It couples quantile regression with Bonschoo Test .

The function performs in 5 Steps:

(1) Estimates the predicted quantile of the outcome distribution (Y) using a quantile regression model (Q) that includes c covariates. Note if c=0, then the predicted quantile is simply the unconditional sample quantile of the marginal distribution of Y. Selecting a specific lifespan percentile is required. By default percentile 90 (P90).

(2) Creates an indicator variable (I) that classifies observations within the data set as falling above (I=1) or below (I=0) the predicted percentile.

(3) Using the indicator variable (I), builds 2x2 contingency table with frequencies of individuals and proportions.

(4) Tests the significance of the covariates (intervention or treatment). Compares pairwise maximun lifespan between groups using Bonschoo's test.Adjust for multiple test comparison.'

(5) Adjusts p-value for multiple tests using the desired method'
}
\author{Jorge Martinez-Romero. National Institute on Aging. NIH
}

\usage{MaxLife(data,treatments,lifespan,percentile=0.90,p_adjust ="BH")
}
\arguments{
  \item{data}{'Dataframe'}
  \item{treatments}{'Character. Column name of variable storing groups as factor levels'}
  \item{lifespan}{'Character. Column name of variable storing lifespan per individual'}
  \item{percentile}{'Numeric. Lifespan percentile to use as cutting point'}
  \item{p_adjust}{'Character. Multiple comparisson adjustmen: "holm", "hochberg", "hommel", "bonferroni", "BH", "BY",          "fdr", "none"'}
}
\references{
    (1) Wang C, Li Q, Redden DT, Weindruch R, Allison DB. "Statistical methods for testing effects on maximum lifespan". Mech Ageing Dev. 2004;125(9):629–32. Method QT3. (2) David T. Redden, Jose Ramon Fernandez, and David B. Allison "A simple significance test for quantile regression".Statist. Med. 2004; 23:2587–2597 (DOI: 10.1002/sim.1839)
}
\examples{
## Load example dataset
data(data)
## Run the function
MaxLife(data,treatments="diet",lifespan="age_weeks",percentile=0.90,p_adjust ="BH")
##
## The output of the function
##
## A dataframe icluding pairwise comparisons testing the effect of the treatment on lifespan
## Includes:
## the lifespan percentile calculated for both two groups,
## the frequencie of observations above and bellow that percentile,
## the proportions,
## the p-value of the Bonschoo's test of significance
## the adjusted p-value, according to the correction method selected
  }

