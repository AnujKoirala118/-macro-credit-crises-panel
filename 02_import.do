* ==============================================================
* Project: Credit Booms & Banking Crises Panel
* Script: 02_import.do
* Purpose: Convert raw Excel datasets into native Stata (.dta) format
* ==============================================================

clear all
set more off

* Set working directory to project root
cd "U:\Projects\credit-crisis-panel"

* --------------------------------------------------------------
* STEP A: Import Raw WDI Data (Sheet: Data)
* --------------------------------------------------------------
* Load raw Excel file into memory from the 'Data' sheet, using 1st row as variable names
import excel "raw/WDI_Raw.xlsx", sheet("Data") firstrow clear

* Save as Stata data file (.dta) in the clean folder
save "clean/wdi_temp.dta", replace

* --------------------------------------------------------------
* STEP B: Import Raw Banking Crisis Data (Sheet: Crisis Years)
* --------------------------------------------------------------
* Clear WDI data from memory before loading Crisis data
clear all

* Load raw Banking Crisis Excel file from the 'Crisis Years' sheet
import excel "raw/Banking crisis dataset.xlsx", sheet("Crisis Years") firstrow clear

* Save as Stata data file (.dta) in the clean folder
save "clean/crisis_temp.dta", replace

* --------------------------------------------------------------
* STEP C: Confirmation Message
* --------------------------------------------------------------
display "Import complete! Both files successfully saved to clean/ folder."