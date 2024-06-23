# Penguin-Population-Analysis
## The relationship between penguins’ body mass and their sub-species, sex, bill and flipper  length 

The penguin dataset in R presents a valuable opportunity for insightful data analysis and 
exploration, especially considering the rapidly declining penguin population in Antarctica. 
Understanding these fascinating creatures not only contributes to our scientific knowledge but also 
holds implications for conservation efforts. By delving into this dataset, we can uncover critical 
insights that may inform conservationists, policymakers, and researchers working toward the 
protection of penguin populations and their fragile ecosystems. 
The target population includes all the penguins in the Palmer Archipelago, and we 
hypothesize that male penguins have more body mass than females. We also hypothesize that the 
body mass of our target penguin population increases with bill length as well as flipper length. Our 
last hypothesis is that the body mass varies according to the species of the penguin population. 
This memo will indeed confirm that such a relationship exists between sex-body mass, 
flipper length-body mass, bill length-body mass, and species-body mass, respectively. 
To investigate these hypotheses, we used one of R’s built-in datasets - “Penguins” which 
is a subset of the larger “penguins_raw” dataset. This data was collected from 2007 to 2009 by Dr. 
Kristen Gorman with the Palmer Station Long Term Ecological Research Program, part of the US 
Long Term Ecological Research Network.  
It contains information on penguins, encompassing variables such as “Sex” of each penguin - Male or Female, 
'Species', indicating whether a penguin belongs to the Gentoo, Chinstrap, or 
Adelie species, 'Body Mass”', which measures the body mass of the penguins in grams, 'Flipper 
Length', representing the length of each penguin's flippers in millimeters, and 'Bill Length”', 
quantifying the length of their bills in millimeters. The gender distribution is approximately 
balanced, with a fairly equal percentage of male and female penguins. Additionally, the species 
variable encompasses three categories, as mentioned above. The weight of the penguins, captured 
by the “Body Mass”' variable, spans a continuous range of values in grams. Flipper length and bill 
length are also measured continuously in millimeters. Recoding was solely conducted on the 
"Species" variable. Dummy variables were created to represent the species categories (“Gentoo", 
"Chinstrap", "Adelie''). These are binary indicators (1 for presence, 0 for absence). 

![image](https://github.com/SarthakJN99/Penguin-Population-Analysis/assets/144856781/94767390-98ba-4125-9b4c-80f3e67ed991)

The graph for body mass is right-skewed as its mean is bigger than the median. This indicates that 
there are relatively fewer penguins with exceptionally high body masses, pulling the mean towards 
the higher end. While the flipper length is nearly symmetrical with a skewness of just 0.34. The 
body mass also has a larger spread than the length of each penguin’s flippers and bills, thanks to the 
larger standard deviation and greater range. It also implies that while flipper and bill length have a 
measurable impact on body mass, they are not the only factors influencing it. It is also important to 
note that 11 rows of missing data for the sex variable were eliminated from the analysis which is only a little more than 3% of the total rows. 
Hence, it should not make a huge impact on our findings. 

![image](https://github.com/SarthakJN99/Penguin-Population-Analysis/assets/144856781/b505734f-c4ac-412a-adbf-1a50bac0f8cc)

A Multiple OLS Regression analysis was done to better understand the relationship 
between the aforementioned variables and body mass, and no assumptions were violated. Though 
there are some issues of multicollinearity, we can ignore them as the p-value is small. Below is the 
regression model, with Adelie (species) as the reference group: 
![image](https://github.com/SarthakJN99/Penguin-Population-Analysis/assets/144856781/e66ee22f-4210-452a-af54-a1f532b96a7c)

With the alpha of 0.05, it can be seen that this model is statistically significant. These 
findings can be generalized to the entire target population since we are rejecting the null 
hypothesis. From the adjusted R-squared (0.869), it can also be seen that sex, species, bill length, 
and flipper length explain nearly 87% variation in penguins’ body mass. This large R-squared 
value shows that the model fits the data and has a strong predictive power and/or correlation. For 
every millimeter increase in flipper length, there is a 17.8 g increase in penguin body mass, all else 
equal. For every millimeter increase in bill length, there is a 21.6 g increase in penguin body mass, 
all else equal. Chinstrap penguin gets an average 292 g decrease in body mass compared to Adelie, 
all else equal. Gentoo penguin gets an average 707 g increase in body mass compared to Adelie, all else equal. 
Lastly, for every male penguin compared to a female penguin, there is an average 
increase of 465.395 g in body mass, all else equal. The regression coefficients are 
meaningful. It should be noted that all these relationships are statistically significant 
against an alpha value of 0.05. Additionally, the power or the probability of not finding a type 2 error is 100% 
according to our regression model. While a power of 1 is theoretically ideal, it is 
exceptionally rare in practice and may suggest a potential issue with the analysis. 
We recommend a thorough examination of both the methodology and the data to 
guarantee the precision of this outcome. Another potential constraint could be the absence of data 
pertaining to different seasons, which is likely a crucial indicator of penguins' body mass 
variations. 
![image](https://github.com/SarthakJN99/Penguin-Population-Analysis/assets/144856781/b59f38b5-7c9a-4ad3-993d-d213e2aaedb5)
![image](https://github.com/SarthakJN99/Penguin-Population-Analysis/assets/144856781/466de585-abb1-4e36-a204-281ac35f617b)

In summary, the relationship between penguin body mass and key characteristics offers a 
valuable foundation for informed conservation efforts. By leveraging this knowledge, we can make 
meaningful strides in safeguarding these fascinating creatures and their delicate ecosystems. While 
our analysis provides valuable insights, it is crucial to exercise prudence in the interpretation and 
application of these findings. The specific context and nuances of the penguin population in 
question should always be considered.

![image](https://github.com/SarthakJN99/Penguin-Population-Analysis/assets/144856781/841fa09a-1c7f-49b8-b2b7-90178eac943b)

![image](https://github.com/SarthakJN99/Penguin-Population-Analysis/assets/144856781/ae9a3067-639a-470c-85a7-1eb3552db291)





