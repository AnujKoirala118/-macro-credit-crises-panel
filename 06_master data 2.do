clear all
set more off
cd "U:\Projects\credit-crisis-panel"
use "clean/master_database.dta", clear

drop if missing(iso3)
drop if missing(banking_crisis)
keep if year >= 1990 & year <= 2017
duplicates report iso3 year

encode iso3, gen(id)
xtset id year
xtdescribe

save "clean/panel.dta", replace
dis "All done"