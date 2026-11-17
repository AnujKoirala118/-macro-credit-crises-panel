# Credit expansion and banking crises: a country-year panel

**Question:** Does faster growth in private credit predict banking crises?
**Data:** World Bank WDI (private credit/GDP, GDP growth, inflation); Laeven & Valencia
banking-crisis database. 142 countries, 1990-2017.
**Method:** Credit expansion = 3-year change in private credit/GDP, lagged one year.
Linear probability model, pooled and with country and year fixed effects
(standard errors clustered by country); robustness without extreme cases.
**Main result:** A 10-point credit expansion is associated with about a 1.5 percentage-point
higher probability of a banking crisis the next year. Stable across specifications.
**Data notes:** Structural break in Denmark's WDI credit series (2000) set to missing.
**Limitations:** Predictive, not causal. Credit data has gaps. Linear probability model.
**How to run:** Run the do-files in /do in numerical order after downloading the data.
