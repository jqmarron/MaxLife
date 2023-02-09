<h1> MaxLife: A package to compare maximun lifespan </h1>
<h2> Between groups under different treatments or conditions </h2>
<img align="right" alt="GIF" src="https://camo.githubusercontent.com/61491d59e71fec5c794945fed916a4a682b6c0404fc31f30b08a0d919c558404/68747470733a2f2f696d616765732e73717561726573706163652d63646e2e636f6d2f636f6e74656e742f76312f3537363966633430316236333162616231616464623261622f313534313538303631313632342d5445363451474b524a4738535741495553374e532f6b6531375a77644742546f6464493870446d34386b506f73776c7a6a53564d4d2d53784f703743563539425a772d7a505067646e346a557756634a45315a7657515578776b6d794578676c4e714770304976544a5a616d574c49327a76595748384b332d735f3479737a63703272795449304871544f6161556f68724938504936465879386339505774426c7141566c555335697a7064634958445a71445976707252715a32395077306f2f636f64696e672d667265616b2e676966" width="200"/>
<h3> Author </h3>
Jorge Martinez-Romero. 
National Institute on Aging. NIH
<h3> Description </h3>
MaxLife statisticaly compares the effect of treatments or interventions on lifespan. Two or more groups can be included in the analysis. Identifies which groups have shorter or longer lifespan and the significance of that diference.
It's based on the QT3 method described in "Statistical methods for testing effects on maximum lifespan” Wang et al. 2004. A variation of a "simple significance test for quantile regression" from David T. Redden and David B. Allison. It couples quantile regression with Bonschoo Test .

<h3> The main function </h3>

<h4> MaxLife::MaxLife_1() </h4>

Performs in 5 Steps:

- ✍️ &nbsp; Estimates the predicted quantile of the outcome distribution (Y) using a quantile regression model (Q) that includes c covariates. Note if c=0, then the predicted quantile is simply the unconditional sample quantile of the marginal distribution of Y. Selecting a specific lifespan percentile is required. By default percentile 90 (P90). 
- ✍️ &nbsp; Creates an indicator variable (I) that classifies observations within the data set as falling above (I=1) or below (I=0) the predicted percentile.
- ✍️ &nbsp; sing the indicator variable (I), builds 2x2 contingency table with frequencies of individuals and proportions.
- ✍️ &nbsp; Tests the significance of the covariates (intervention or treatment). Compares pairwise maximun lifespan between groups using Bonschoo's test.Adjust for multiple test comparison.
- ✍️ &nbsp; Adjusts p-value for multiple tests using the desired method'

<h3> Installation </h3>

<h4> Alternative 1 </h4>

If not already installed, install devtools.

- install.packages("devtools")

Use devtools to install MaxLife.

- devtools::install_github("https://github.com/jqmarron/MaxLife.git")

<h4> Alternative 2 </h4>

- Download the MaxLife_0.1.0.tar.gz file from Folder pkg.

- In Rstudio open Tool>Install Packages>Packages Archive Files (.zip; .tar.gz) and select location where the  "MaxLife_0.1.0.tar.gz" has been downloaded.

<h3> references </h3>

- Wang C, Li Q, Redden DT, Weindruch R, Allison DB. "Statistical methods for testing effects on maximum lifespan". Mech Ageing Dev. 2004;125(9):629–32. Method QT3. 
- David T. Redden, Jose Ramon Fernandez, and David B. Allison "A simple significance test for quantile regression".Statist. Med. 2004; 23:2587–2597 

<h4> email: jqmarron@gmail.com </h4>


