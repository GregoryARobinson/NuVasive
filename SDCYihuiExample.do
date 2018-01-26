clear all
set more off

*clean SDC txt data

import delimited "/Users/gregoryrobinson/Dropbox/Greg/YihuiAssignments/SDC845pm.TXT", delimiter("^") encoding(ISO-8859-1)clear

drop v1 v2

drop targetshortbusinessdescription targetindustrysector
rename targetprimarysiccode tgt_sic
drop acquirorshortbusinessdescription acquirorindustrysector 
rename acquirorprimarysiccode acq_sic
rename ofsharesacq percsharesacq
rename ownedaftertransaction percsharesownedafter
rename valueoftransactionmil transactionvalue
drop targetnetassetsmil targettotalassetsmil targetbookvaluepershareltmus targetcommonequitymil 
rename acquirorcusip acq_cusip
rename targetcusip tgt_cusip 
rename ofcash perccash
rename ofstock percstock 
drop dcnnumber dealnumber v30

gen day = substr(dateeffective,1,2)
destring day, replace
gen month = substr(dateeffective,4,2)
destring month, replace
gen year = substr(dateeffective,7,2)
destring year, replace

order dateeffective day month year

gen year1 = 1900 + year if year>=84
replace year1 = 2000 + year if year<=11

order dateeffective day month year year1
drop year day month
rename year1 year


destring tgt_sic, generate(ntgt_sic) force
*list tgt_sic if ntgt_sic>=.
drop tgt_sic
rename ntgt_sic tgt_sic

destring acq_sic, generate(nacq_sic) force
drop acq_sic
rename nacq_sic acq_sic

destring transactionvalue, generate(ntransactionvalue) ignore(",")
list transactionvalue if ntransactionvalue>=.
drop transactionvalue 
rename ntransactionvalue transactionvalue 

rename tgt_cusip TGT_CUSIP
rename acq_cusip ACQ_CUSIP

order year targetname TGT_CUSIP tgt_sic targetnation acquirorname ACQ_CUSIP acq_sic acquirornation status percsharesacq percsharesownedafter transactionvalue tenderoffer perccash percstock attitude

save "/Users/gregoryrobinson/Dropbox/Greg/YihuiAssignments/SDCClean.dta", replace

*make CUSIPS 6 digits for target
clear all
set more off

use "/Users/gregoryrobinson/Dropbox/Greg/YihuiAssignments/CompustatHW1.dta", replace
gen cusip6 = substr(cusip,1,6)
drop cusip
rename cusip6 TGT_CUSIP
rename fyear year
drop datadate indfmt consol popsrc datafmt curcd costat

rename gvkey TGT_gvkey
rename conm TGT_NAME 
rename at TGT_at
rename bkvlps TGT_bkvlps
rename csho TGT_csho
rename dlc TGT_dlc
rename dlcch TGT_dlcch
rename dltt TGT_dltt
rename lt TGT_lt
rename mkvalt TGT_mkvalt
rename prcc_f TGT_prcc_f
rename sic TGT_sic

save "/Users/gregoryrobinson/Dropbox/Greg/YihuiAssignments/CompustatHW1TGT.dta", replace

*make CUSIPS 6 digits for acquirer
clear all
set more off

use "/Users/gregoryrobinson/Dropbox/Greg/YihuiAssignments/CompustatHW1.dta", replace
gen cusip6 = substr(cusip,1,6)
drop cusip
rename cusip6 ACQ_CUSIP
rename fyear year
drop datadate indfmt consol popsrc datafmt curcd costat

rename gvkey ACQ_gvkey
rename conm ACQ_NAME 
rename at ACQ_at
rename bkvlps ACQ_bkvlps
rename csho ACQ_csho
rename dlc ACQ_dlc
rename dlcch ACQ_dlcch
rename dltt ACQ_dltt
rename lt ACQ_lt
rename mkvalt ACQ_mkvalt
rename prcc_f ACQ_prcc_f
rename sic ACQ_sic

save "/Users/gregoryrobinson/Dropbox/Greg/YihuiAssignments/CompustatHW1ACQ.dta", replace

*merge SDC with CompustatCRSP

clear all
set more off

use "/Users/gregoryrobinson/Dropbox/Greg/YihuiAssignments/SDCClean.dta", replace

merge m:m TGT_CUSIP year using "/Users/gregoryrobinson/Dropbox/Greg/YihuiAssignments/CompustatHW1TGT.dta"

keep if _merge ==3
drop _merge

merge m:m ACQ_CUSIP year using "/Users/gregoryrobinson/Dropbox/Greg/YihuiAssignments/CompustatHW1ACQ.dta"

keep if _merge ==3
drop _merge

rename acq_sic sic
ffind sic, newvar(ffi) type(48)

gen relativesize2 = (TGT_mkvalt / ACQ_mkvalt)
gen TGTMKTVAL = (TGT_prcc_f*TGT_csho)
gen Q = ((TGT_prcc)+(TGT_dltt+TGT_dlc))/TGT_at


/*
gen industry =""
replace industry ="Agriculture" if inrange(acq_sic,0100,0199)
replace industry ="Agriculture" if inrange(acq_sic,0200,0299)
replace industry ="Agriculture" if inrange(acq_sic,0700,0799)
replace industry ="Agriculture" if inrange(acq_sic,2048,2048)

replace industry ="Food Products" if inrange(acq_sic,2000,2009)
replace industry ="Food Products" if inrange(acq_sic,2010,2019)
replace industry ="Food Products" if inrange(acq_sic,2020,2029)
replace industry ="Food Products" if inrange(acq_sic,2030,2039)
replace industry ="Food Products" if inrange(acq_sic,2040,2046)
replace industry ="Food Products" if inrange(acq_sic,2050,2059)
replace industry ="Food Products" if inrange(acq_sic,2060,2063)
replace industry ="Food Products" if inrange(acq_sic,2070,2079)
replace industry ="Food Products" if inrange(acq_sic,2090,2092)
replace industry ="Food Products" if inrange(acq_sic,2095,2095)
replace industry ="Food Products" if inrange(acq_sic,2098,2099)

replace industry ="Candy & Soda" if inrange(acq_sic,2064,2068)
replace industry ="Candy & Soda" if inrange(acq_sic,2086,2086)
replace industry ="Candy & Soda" if inrange(acq_sic,2087,2087)
replace industry ="Candy & Soda" if inrange(acq_sic,2096,2096)
replace industry ="Candy & Soda" if inrange(acq_sic,2097,2097)

replace industry ="Beer & Liquor" if acq_sic ==2080
replace industry ="Beer & Liquor" if acq_sic ==2082
replace industry ="Beer & Liquor" if acq_sic ==2083
replace industry ="Beer & Liquor" if acq_sic ==2084
replace industry ="Beer & Liquor" if acq_sic ==2085

replace industry ="Tobacco Products" if inrange(acq_sic,2100,2199)

replace industry ="Recreation" if inrange(acq_sic,0920,0999)
replace industry ="Recreation" if inrange(acq_sic,3651,3651)
replace industry ="Recreation" if acq_sic ==3652
replace industry ="Recreation" if acq_sic ==3732
replace industry ="Recreation" if inrange(acq_sic,3930,3931)
replace industry ="Recreation" if inrange(acq_sic,3940,3949)

replace industry ="Entertainment" if inrange(acq_sic,7800,7829)
replace industry ="Entertainment" if inrange(acq_sic,7830,7833)
replace industry ="Entertainment" if inrange(acq_sic,7840,7841)
replace industry ="Entertainment" if acq_sic ==7900
replace industry ="Entertainment" if inrange(acq_sic,7910,7911)
replace industry ="Entertainment" if inrange(acq_sic,7920,7929)
replace industry ="Entertainment" if inrange(acq_sic,7930,7933)
replace industry ="Entertainment" if inrange(acq_sic,7940,7949)
replace industry ="Entertainment" if acq_sic ==7980
replace industry ="Entertainment" if inrange(acq_sic,7990,7999)





          2700-2709 Printing publishing and allied
          2710-2719 Newspapers: publishing-printing
          2720-2729 Periodicals: publishing-printing
          2730-2739 Books: publishing-printing
          2740-2749 Misc publishing
          2770-2771 Greeting card publishing
          2780-2789 Book binding
          2790-2799 Service industries for print trade

*/

