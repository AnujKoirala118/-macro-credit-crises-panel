clear all
set more off
cd "U:\Projects\credit-crisis-panel"

use "clean/crisis_clean.dta", clear

* Step 1: Create a brand-new column and set everything to 0 by default
gen banking_crisis = 0

* Step 2: If the year is found inside the bank_years text string, flip it to 1
replace banking_crisis = 1 if strpos(bank_years, string(year)) > 0

*repeat for other 3 variables too for current_crisis
* Step 1: Create a brand-new column and set everything to 0 by default
gen current_crisis = 0

* Step 2: If the year is found inside the curr_years text string, flip it to 1
replace current_crisis = 1 if strpos(curr_years, string(year)) > 0


*now for debt_years
* Step 1: Create a brand-new column and set everything to 0 by default
gen debt_crisis = 0

* Step 2: If the year is found inside the debt_years text string, flip it to 1
replace debt_crisis = 1 if strpos(debt_years, string(year)) > 0

*now for restr_years

gen restr_crisis = 0
replace restr_crisis = 1 if strpos(restr_years, string(year))>0

* 3. Save the finalized clean WDI panel
save "clean/crisis_clean.dta", replace

disp "Crisis data successfully cleaned, dummied, and saved!" 