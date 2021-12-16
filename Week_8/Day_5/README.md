# Final Project - Chronic Disease Indicators (CDI)

![picture](images/cdi-logo.png)

Overview

The chronic disease indicators (CDI) are a set of surveillance indicators developed by consensus among CDC, the Council of State and Territorial Epidemiologists (CSTE), and the National Association of Chronic Disease Directors (NACDD). CDI enables public health professionals and policymakers to retrieve uniformly defined state-level data for chronic diseases and risk factors that have a substantial impact on public health. These indicators are essential for surveillance, prioritization, and evaluation of public health interventions.  Several of the current chronic disease indicators are available and reported on other websites, either by the data source/custodians or by categorical chronic disease programs. However, CDI is the only integrated source for comprehensive access to a wide range of indicators for the surveillance of chronic diseases, conditions, and risk factors at the state level.

The original CDI consisted of 73 indicators adopted in 1998 and amended in 2002.  In 2012-13, CDC, CSTE, and NACDD collaborated on a series of reviews that were informed by subject-matter expert opinion to make recommendations for updating CDI. The goal of this review was to ensure that CDI is responsive to the expanded scope and priorities of chronic disease prevention programs in state health departments.

As a result, CDI increased to 124 indicators in the following 18 topic groups: alcohol; arthritis; asthma; cancer; cardiovascular disease; chronic kidney disease; chronic obstructive pulmonary disease; diabetes; immunization; nutrition, physical activity, and weight status; oral health; tobacco; overarching conditions; and new topic areas that include disability, mental health, older adults, reproductive health, and school health. For the first time, CDI includes 22 indicators of systems and environmental change. A total of 201 individual measures are included for the 124 indicators, many of which overlap multiple chronic disease topic areas or are specific to a certain sex or age group.

CDI is an example of collaboration among CDC and state health departments in building a consensus set of state-based health surveillance indicators.  This update will help ensure that CDI remains the most relevant and current collection of chronic disease surveillance data for state epidemiologists, chronic disease program officials, and reproductive health and maternal and child health officials.  The standardized indicator definitions will also encourage consistency in chronic disease surveillance at the national, state, and local public health levels.


## Objective

The objective is to explore the CDI dataset and interpret the Heart Failure trends via a Linear Regression Machine Learning model to find the states with the most Heart Failure Deaths.


## Data Source

The data has been downloaded from https://catalog.data.gov/dataset/u-s-chronic-disease-indicators-cdi

### Shape of the Data

The dataframe consisted of 956638 rows and 34 columns. 

## Data Reference https://www.cdc.gov/mmwr/pdf/rr/rr6401.pdf

Here are the columns which were used for the project:

| Column name | Description |
| ----------- | ----------- |
| YearStart/YearEnd | the years from which the data was collected |
| LocationAbbr/LocationDesc | the location from which the data represents |
| DataSource | name of the datasource used |
| Topic | the topic of the health indicators |
| Question | the subtopic of the health indicators|
| datavalueunit | cases per 100000 and other metrics |
| datavaluetype  | prevalence, number, and other metrics |
| datavalue  | adjusted metrics |
| datavaluealt  | alternative metrics |
| datavaluefootnotesymbol  | footnotes for data metrics |
| datavaluefootnote  | description of data metrics |
| stratificationcategory1  | race and gender |
| stratification1  | further description of race and gender |
| geolocation  | geolocation points of data |
| locationid  | geolocation codes |
| topicid  | identification of topic names |
| questionid  | identification of questions |

## Python Libraries
- [pandas](https://pandas.pydata.org/)
- [numpy](https://numpy.org/)
- [seaborn](https://seaborn.pydata.org/)
- [matplotlib](https://matplotlib.org/)
- [statsmodels](https://www.statsmodels.org/stable/index.html)
- [scipy](https://www.scipy.org/)
- [sklearn](https://scikit-learn.org/stable/)

## References used in the Presentation
1. Centers for Disease Control and Prevention. Underlying Cause of Death, 1999–2018. CDC WONDER Online Database. Atlanta, GA: Centers for Disease Control and Prevention; 2018, accessed December  14, 2021.
2. Virani SS, Alonso A, Aparicio HJ, Benjamin EJ, Bittencourt MS, Callaway CW, et al. Heart disease and stroke statistics—2021 update: a report from the American Heart Associationexternal icon. Circulation. 2021;143:e254–e743.
3. Fryar CD, Chen T-C, Li X. Prevalence of uncontrolled risk factors for cardiovascular disease: United States, 1999–2010 pdf icon[PDF-494K]. NCHS data brief, no. 103. Hyattsville, MD: National Center for Health Statistics; 2012 , accessed December 15, 2021.
4. Centers for Disease Control and Prevention, National Center for Health Statistics. About Multiple Cause of Death, 1999–2019. CDC WONDER Online Database website. Atlanta, GA: Centers for Disease Control and Prevention; 2019 , accessed December  15, 2021.
5. Heron, M. Deaths: Leading causes for 2017pdf icon. National Vital Statistics Reports;68(6), accessed December 16, 2021.
6. https://milkeninstitute.org/sites/default/files/reports-pdf/ChronicDiseases-HighRes-FINAL.pdf. , accessed December 16, 2021.
7. Mark Mather, “Fact Sheet: Aging in the United States,” Population Reference Bureau, accessed June 27, 2018, http://www.prb.org/Publications/Media-Guides/2016/aging-unitedstates-fact-sheet.aspx. , accessed December 16, 2021.
8. “PFCD in the States,” Partnership to Fight Chronic Disease, , https://www.fightchronicdisease.org/pfcd-in-the-states. , accessed December 16, 2021.
9. “Prescription Drug Spending in the U.S. Health Care System. An Actuarial Perspective,” American Academy of Actuaries, https://www.actuary.org/files/publications/Rx-briefing-slides-030918.pdf. , accessed December 16, 2021.
10. Bradley Sawyer and Cynthia Cos, “How Does Health Spending in the U.S. Compare to Other Countries?” Peterson-Kaiser Health
System Tracker (2018): https://www.healthsystemtracker.org/chart-collection/health-spending-u-s-compare-countries/#item-average-wealthy-countries-spend-half-much-per-person-health-u-s-spends , accessed December 16, 2021.
