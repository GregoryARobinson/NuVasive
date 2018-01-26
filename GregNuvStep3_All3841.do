*Greg Robinson
*Empirical Corporate Finance
*Dr. Feng Zhang
*Assignment 2

*All NuVasive

*Step 3 - After SAS
clear all

*Import MASTERDATA from SAS / Excel
import delimited "/Users/gregoryrobinson/Desktop/NuVasive/SASOutput/MD_AllPrime3841SUNDAY.csv", clear
save "/Users/gregoryrobinson/Desktop/NuVasive/SASOutput/MD_AllPrime3841SUNDAY.dta", replace
*1073

*1.  generate table for deals per year

gen sdateannounced = date(dateannounced, "MDY")
format sdateannounced %d
drop dateannounced
rename sdateannounced dateannounced
gen year = year(dateannounced)
tab year

*2. Calculate Acquirer Abnormal Returns [-2,2]: acar
sum acar
ttest acar = 0


*3. Calculate Target Abnormal Returns [-2,2]: tcar
sum tcar
ttest tcar = 0


*4. Balculate Acquirer Buy-and-hold Abnormal Returns, 36 months: bhar
sum bhar3 
ttest bhar3 = 0

*5. FF 3 factor data
import delimited "/Users/gregoryrobinson/Desktop/NuVasive/FF3.csv", encoding(ISO-8859-1)clear

tostring date, gen(DATE)
gen year2=substr(DATE,1,4)
gen month2=substr(DATE,5,2)
destring year2, gen(year)
destring month2, gen(month)
save "/Users/gregoryrobinson/Desktop/NuVasive/FF3.dta", replace

*6. FF 5 factor data
import delimited "/Users/gregoryrobinson/Desktop/NuVasive/FF5.csv", encoding(ISO-8859-1)clear

tostring date, gen(DATE)
gen year2=substr(DATE,1,4)
gen month2=substr(DATE,5,2)
destring year2, gen(year)
destring month2, gen(month)
save "/Users/gregoryrobinson/Desktop/NuVasive/FF5.dta", replace

*7. Momentum data
import delimited "/Users/gregoryrobinson/Desktop/NuVasive/MOM.csv", encoding(ISO-8859-1)clear

tostring date, gen(DATE)
gen year2=substr(DATE,1,4)
gen month2=substr(DATE,5,2)
destring year2, gen(year)
destring month2, gen(month)
save "/Users/gregoryrobinson/Desktop/NuVasive/MOM.dta", replace

*8. Form portfolio of acquirers that completed acquisition during prev. 36 months, equal & mkt. weighted
import delimited "/Users/gregoryrobinson/Desktop/NuVasive/SASOutput/Mretsff_ALLPRIME3841SUNDAY.csv", encoding(ISO-8859-1)clear
save "/Users/gregoryrobinson/Desktop/NuVasive/SASOutput/Mretsff_ALLPRIME3841SUNDAY.dta", replace

*8.1 calc equally weighted rets
*destring(aret), gen(aret1) force
*drop aret
*rename aret1 aret
bysort year month: egen ewrets = mean(aret)

*8.2 Calculat mkt. cap. (tmc)
bysort year month: egen tmc = sum(mcap)

*8.3 generate weights
gen weights = mcap/tmc

*8.4 generate value-weighted rets
gen vwretstemp = weights*aret
bysort year month: egen vwrets = sum(vwretstemp)

*8.5 clean
keep year month ewrets vwrets
duplicates drop year month, force

*8.6 merge with FF3 factors
merge 1:1 year month using "/Users/gregoryrobinson/Desktop/NuVasive/FF3.dta"
drop if _merge==2
drop _merge

*8.7 merge with FF5 factors
merge 1:1 year month using "/Users/gregoryrobinson/Desktop/NuVasive/FF5.dta"
drop if _merge==2
drop _merge

*8.8 merge with MOM
merge 1:1 year month using "/Users/gregoryrobinson/Desktop/NuVasive/MOM.dta"
drop if _merge==2
drop _merge

*8.9 divide FF data by 100
replace ff3_rf = ff3_rf / 100

*8.10 subtract rf from ewrets port
gen ewretsrf = ewrets - ff3_rf

*8.11 subtract rf from vwrets port
gen vwretsrf = vwrets - ff3_rf

*8.12 FF 4 factor model regression - equal weighted
reg ewretsrf ff3_mktrf ff3_smb ff3_hml mom

*8.13 FF 4 factor model regression - value weighted
reg vwretsrf ff5_mktrf ff5_smb ff5_hml mom

*8.14 FF 5 factor model regression - equal weighted
reg ewretsrf ff5_mktrf ff5_smb ff5_hml ff5_rmw ff5_cma

*8.15 FF 5 factor model regression - value weighted
reg vwretsrf ff5_mktrf ff5_smb ff5_hml ff5_rmw ff5_cma

