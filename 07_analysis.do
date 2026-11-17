* ==========================================
* 07_analysis.do: Credit Booms & First Regressions
* ==========================================
clear all
set more off
cd "U:\Projects\credit-crisis-panel"

* Always start with the pristine panel dataset
use "clean/panel.dta", clear

* 1. Check exact full variable names
ds Domestic* GDPgrowth* Inflation*



* 2. Rename explicitly to avoid wildcard ambiguity
rename Domesticcredittoprivatesecto credit_priv
rename GDPgrowthannua* gdp_growth
rename Inflationcons* inflation

* ==========================================
* 3. Set panel structure and build credit boom variable
* ==========================================
xtset id year

gen d3_credit = credit_priv - L3.credit_priv

* --- DATA CLEANING LOG: STRUCTURAL BREAKS ---
* Denmark: structural break in WDI credit series in 2000 (34 -> 132 in one year)
* Treated as missing to avoid false-positive credit boom flags.
replace d3_credit = . if iso3=="DNK" & inrange(year, 2000, 2002)
* ---------------------------------------------

* Re-generate the boom indicator after the fix
gen boom = (d3_credit > 10) if !missing(d3_credit)

* Verification checks
summarize d3_credit
tab boom, missing

* ==========================================
* 4. Regressions
* ==========================================
gen ln_infl = ln(1 + inflation/100)

* A. Pooled, all countries
reg banking_crisis L.d3_credit L.gdp_growth L.ln_infl, robust

* B. Country and year fixed effects
xtreg banking_crisis L.d3_credit L.gdp_growth L.ln_infl i.year, fe vce(cluster id)

* C. Without the extreme cases
reg banking_crisis L.d3_credit L.gdp_growth L.ln_infl if !inlist(iso3, "BRA", "ZWE", "ISL", "CYP"), robust