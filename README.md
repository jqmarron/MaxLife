<h1> MaxLife: A package to compare maximun lifespan </h1>
<h2> Between groups under different treatments or conditions </h2>

<h3> Author </h3>
Jorge Martinez-Romero. 
TGB-LEPS. National Institute on Aging. NIH
<h3> Description </h3>
MaxLife statistically compares the effects of treatments or interventions on lifespan using a simple method, particularly useful when distributions do not meet the assumptions required by other survival analyses, such as risk proportionality or a specific distribution. This analysis accommodates two or more groups, identifying which have shorter or longer lifespans and pairwise testing the significance of the differences between intervention groups. The package is based on the method as described in 'Statistical Methods for Testing Effects on Maximum Lifespan' by Wang et al. (2004) and is a variation of a 'simple significance test for quantile regression' from David T. Redden and David B. Allison. It combines quantile regression with the Bonschoo Test.

<h3> The main function </h3>

<h4> MaxLife::MaxLife_1() </h4>

MaxLife_1 performs in 5 steps:

- ✍️ &nbsp; The function estimates the predicted quantile of the outcome distribution (Y) through a quantile regression model (Q), which incorporates a categorical variable with c levels (e.g., control, diet1, diet2, diet3). When c=1, the predicted quantile corresponds to the unconditional sample quantile of the marginal distribution of Y. To facilitate later classification, a specific lifespan percentile threshold must be chosen. The default threshold is set to the 90th percentile (P90). 
- ✍️ &nbsp; Generates an indicator variable (I) that categorizes observations within the dataset as either above (I=1) or below (I=0) the predicted percentile.
- ✍️ &nbsp; Utilizing the indicator variable (I), constructs a 2x2 contingency table displaying frequencies and proportions of individuals categorized as either above (I=1) or below (I=0) the predicted percentile.
- ✍️ &nbsp; Conducts pairwise comparisons of maximum lifespan across different treatments or conditions and assesses the significance of group differences using Bonschoo's test.
- ✍️ &nbsp; Corrects p-values for multiple tests using the specified method, such as Benjamini-Hochberg (BH), False Discovery Rate (FDR), or others, to account for the increased risk of type I errors associated with multiple comparisons.

<h3> Installation </h3>

<h4> Alternative 1 </h4>

- Download the MaxLife_0.1.0.tar.gz file from the folder pkg.

- In Rstudio open Tool>Install Packages>Install From> Select "Packages Archive Files (.zip; .tar.gz)" and select location where the  "MaxLife_0.1.0.tar.gz" is located after downloading.

- Install

<h4> Alternative 2 </h4>

If not already installed, install devtools.

- install.packages("devtools")

Use devtools to install MaxLife.

- devtools::install_github("https://github.com/jqmarron/MaxLife.git")


<h3> References </h3>

- Wang C, Li Q, Redden DT, Weindruch R, Allison DB. "Statistical methods for testing effects on maximum lifespan". Mech Ageing Dev. 2004;125(9):629–32. Method QT3. 
- David T. Redden, Jose Ramon Fernandez, and David B. Allison "A simple significance test for quantile regression".Statist. Med. 2004; 23:2587–2597 

<h4> email: jqmarron@gmail.com </h4>


