# Un-Named-Grocer-s-UNG-Problem
The UNG food division has a problem and you have previously recommended a course of action for solving the problem. Their original problem was to compare a Chicken Kiev and Chicken Marsala because of the supplier disruptions. Both products were produced by the same vendor and the vendor could no longer fully supply UNG’s required quantities for both products. The vendor can continue to supply one of the two products but a new vendor would be needed if both products were continued. The company has decided to leave Chicken Kiev with the existing vendor and to seek out a new vendor for Chicken Marsala. Your task is to help them choose a vendor among CRU Chicken R Us and TOI Taste of Italy; two vendors that UNG has worked with in the past. Variables with names starting with Stacked indicate stacked/tidy versions.
The prior recipe has a trademarked sauce that is an ingredient in the current product. The product must be changed.

Ingredients

1.	The two vendors have supplied random samples of costs for their own sauce replacements Sauce.Cost and some (self-reported) customer purchase intentions (Buy/NotBuy) to help us choose. Customer opinions matter. These data are supplied in Ingredients in both stacked and unstacked form.
names(Ingredients)

[1] "CRUSauceCost"     "TOISauceCost"     "StackedSauceCost" "StackedVendor"   
[5] "CRUPurchase"      "TOIPurchase"      "StackedPurchase"

Ratings

2.	Our marketing team has called upon focus groups to compare the products. These customer ratings Ratings [from 0 to 100 with 0 as worst and 100 as best] are provided for 50 consumers that evaluated both products.
names(Ratings)

[1] "Rater"          "TOI.Ratings"    "CRU.Ratings"    "Stacked.Rating"  
[5] "Stacked.Vendor" "Stacked.Rater"

Financials

3.	Bottom line financials are most important. The product was not outstanding with the existing supplier. We expect the performance to be no better with a new vendor and a new recipe, but it is important that we pick the best vendor. These data are supplied in Financials. The data shows Costs and Boxes for each vendor over the last 52 weeks: CRU.Costs and CRU.Boxes provide the observations for Chicken R Us. TOI.Costs and TOI.Boxes provide the observations for Taste of Italy.
names(Financials)

[1] "Week"      "TOI.Boxes" "TOI.Costs" "CRU.Boxes" "CRU.Costs"
