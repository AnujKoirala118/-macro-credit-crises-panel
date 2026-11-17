clear all
set more off
cd "U:\Projects\credit-crisis-panel"

* 1. Load the temporary WDI dataset
use "clean/wdi_clean.dta", clear


duplicates drop country year, force

duplicates list country year

replace country = strtrim(country)



save "clean/wdi_clean.dta", replace
disp "removed and saved"