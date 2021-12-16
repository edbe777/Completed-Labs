# Final Project - Chronic Disease Indicators (CDI)

![picture](images/cdi-logo.png)

Overview

The chronic disease indicators (CDI) are a set of surveillance indicators developed by consensus among CDC, the Council of State and Territorial Epidemiologists (CSTE), and the National Association of Chronic Disease Directors (NACDD). CDI enables public health professionals and policymakers to retrieve uniformly defined state-level data for chronic diseases and risk factors that have a substantial impact on public health. These indicators are essential for surveillance, prioritization, and evaluation of public health interventions.  Several of the current chronic disease indicators are available and reported on other websites, either by the data source/custodians or by categorical chronic disease programs. However, CDI is the only integrated source for comprehensive access to a wide range of indicators for the surveillance of chronic diseases, conditions, and risk factors at the state level.

The original CDI consisted of 73 indicators adopted in 1998 and amended in 2002.  In 2012-13, CDC, CSTE, and NACDD collaborated on a series of reviews that were informed by subject-matter expert opinion to make recommendations for updating CDI. The goal of this review was to ensure that CDI is responsive to the expanded scope and priorities of chronic disease prevention programs in state health departments.

As a result, CDI increased to 124 indicators in the following 18 topic groups: alcohol; arthritis; asthma; cancer; cardiovascular disease; chronic kidney disease; chronic obstructive pulmonary disease; diabetes; immunization; nutrition, physical activity, and weight status; oral health; tobacco; overarching conditions; and new topic areas that include disability, mental health, older adults, reproductive health, and school health. For the first time, CDI includes 22 indicators of systems and environmental change. A total of 201 individual measures are included for the 124 indicators, many of which overlap multiple chronic disease topic areas or are specific to a certain sex or age group.

CDI is an example of collaboration among CDC and state health departments in building a consensus set of state-based health surveillance indicators.  This update will help ensure that CDI remains the most relevant and current collection of chronic disease surveillance data for state epidemiologists, chronic disease program officials, and reproductive health and maternal and child health officials.  The standardized indicator definitions will also encourage consistency in chronic disease surveillance at the national, state, and local public health levels.


## Objective

The objective is to explore the CDI dataset and interpret the Heart Failure trends. 

## Data

### Data Source

The data has been downloaded from https://catalog.data.gov/dataset/u-s-chronic-disease-indicators-cdi

### Shape of the Data

The dataframe consisted of 956638 rows and 34 columns. 


Here are the columns that were used for the final model:

| Column name | Description |
| ----------- | ----------- |
| goal | amount to be fully funded |
| state | successful (1) or failed (0) project |
| category_slug | name of category and subcategory concatenated |
| category_parent_name | name of category |
| launched_at_weekday | weekday the project was launched |
| deadline_weekday | weekday the project was finished |
| project_duration | duration of project |
| blurb_language_new | description language grouped |
| country_new | countries grouped |
| description_words | count of words |
| description_sent | count of sentences |
| descr_stopw | count of stopwords |
| description_filtered_words | count of filtered words |
| desc_filt_ratio | ratio of filtered words per description words |
| desc_sw_ratio | ratio of stopwords per description words |
| desc_wps_ratio | ratio or words per sentence |
| description_neg | sentiment analysis from nltk library - negative words |
| description_neu | sentiment analysis from nltk library - neutreal words |
| description_pos | sentiment analysis from nltk library - positive words |
| description_compound | sentiment analysis from nltk library - compound of words |
| columns xxx to xxx | encoding of 250 most common words in successful projects |

## Python Libraries
- [pandas](https://pandas.pydata.org/)
- [numpy](https://numpy.org/)
- [seaborn](https://seaborn.pydata.org/)
- [matplotlib](https://matplotlib.org/)
- [statsmodels](https://www.statsmodels.org/stable/index.html)
- [scipy](https://www.scipy.org/)
- [sklearn](https://scikit-learn.org/stable/)
