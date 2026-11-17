clear all
set more off
cd "U:\Projects\credit-crisis-panel"

* Load your prepared crisis panel
use "clean/crisis_clean.dta", clear

* Merge with the WDI dataset using country and year as unique keys
merge 1:1 country year using "clean/wdi_clean.dta"

* Check the match breakdown
tab _merge

* Save the master dataset containing crisis and electricity/WDI indicators
save "clean/master_database.dta", replace

disp "Crisis panel and WDI electricity data successfully merged!"