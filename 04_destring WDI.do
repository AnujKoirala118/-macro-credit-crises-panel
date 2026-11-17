* ==============================================================
* Project: Credit Booms & Banking Crises Panel
* Script: 04_clean_wdi.do
* Purpose: Clean WDI dataset, destring variables, and save clean panel
* ==============================================================

clear all
set more off
cd "U:\Projects\credit-crisis-panel"

* 1. Load the temporary WDI dataset
use "clean/wdi_temp.dta", clear

* 2. Rename key identifiers for clean merging later
rename Time year
rename CountryCode iso3
rename CountryName country

* 3. Destring all variables simultaneously
* This converts text-stored numeric variables into real numbers and turns '..' into '.'
destring year Domesticcr~o Domesticcr~a GDPgrowtha~K GDPpercapi~S Inflationc~u Broadmoney~B Realintere~R TradeofGDP~S NetODArece~T Personalre~d Grosscapit~D Bankcapita~o, replace force



* 4. Save the finalized clean WDI panel
save "clean/wdi_clean.dta", replace

disp "WDI data successfully cleaned, destringed, and saved!"