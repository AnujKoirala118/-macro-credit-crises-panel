

clear all
set more off
cd "U:\Projects\credit-crisis-panel"

use "clean/crisis_temp.dta", clear
drop in 1

* Step 1: Rename the long/truncated columns to clean short names
rename Country country
rename SystemicBanking* bank_years
rename CurrencyCrisis curr_years
rename SovereignDebt*r debt_years
rename SovereignDebt*e restr_years

* Step 2: Drop any accidental blank rows or header residue
drop if country == "" | country == "Country"

* Step 3: Clean up country names by stripping trailing/leading spaces
replace country = strtrim(country)

* Step 4: Remove unwanted spaces inside the year lists for all crisis columns
foreach v in bank curr debt restr {
    replace `v'_years = subinstr(`v'_years, " ", "", .)
}
* Step 1: Duplicate every country row 48 times (one for each year from 1970 to 2017)
expand 48

* Step 2: Sort by country so each country's 48 rows stay grouped together
sort country

* Step 3: Create the year variable using the row counter (_n)
by country: gen year = 1969 + _n

* 4. Save the finalized clean WDI panel
save "clean/crisis_clean.dta", replace

disp "Crisis data successfully cleaned, destringed, and saved!" 