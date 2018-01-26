*Greg Robinson
*Empirical Corporate Finance
*Dr. Feng Zhang
*Assignment 1

*Step 1 - do before you bring to SAS


*Import SDC data to STATA

import excel "/Users/gregoryrobinson/Desktop/ Greg Mac/Eccles/CLASSES/Spring 2016/Empirical Corporate Fin - Zhang/Feng_Assignment2/SDC.xlsx", sheet("Request 5") firstrow clear

*Drop if Target firm in not U.S.
drop if TGT_NAT != "United States"

*Keep only the variables we need
keep DateAnnounced DateEffective ACQ_CUSIP TGT_CUSIP 

*Export to Excel format for SAS
export excel using "/Users/gregoryrobinson/Desktop/Feng2/SDCclean.xls", firstrow(variables)

***************************************************
*Step 1 - NuVasive only
clear all

import excel "/Users/gregoryrobinson/Desktop/NuVasive/NuVasiveOnlySat.xls", sheet("Request 6") firstrow

drop if DateAnnounced ==.

keep DateAnnounced DateEffective ACQ_CUSIP TGT_CUSIP 

export excel using "/Users/gregoryrobinson/Desktop/NuVasive/NuVasiveOnlySatCleanF.xls", firstrow(variables) replace

***************************************************
*Step 2 - All SIC: 3841 BUT NuVasive - Acquiror Primary SIC Code ==3841 ONLY

*Date Announced: 5/13/2004 - present
*Date Effective: 5/13/2004 - present
*Acquirer All SIC: 3841 
*Target All SIC - Exclude 60-67
*Acquiror: NOT NuVasive (670704)
*DealType:
*Disclosed Value M&As
*Undisclosed Value M&As
*Leveraged Buyouts
*Exchange Offers
*TenderOffers
*Recapitalizations

clear all

import excel "/Users/gregoryrobinson/Desktop/NuVasive/All3841ButNuvF.xls", sheet("Request 6") firstrow

drop if TargetNation != "United States"
drop if AcquirorNation != "United States"

drop if DateAnnounced ==.
drop if OwnedAfterTransaction !=100
drop if AcquirorPrimarySICCode !=3841

drop if TargetPrimarySICCode ==6519
drop if TargetPrimarySICCode ==6726
drop if TargetPrimarySICCode ==6794
drop if TargetPrimarySICCode ==6799

keep DateAnnounced DateEffective AcquirorCUSIP TargetCUSIP 

*565 obs

export excel using "/Users/gregoryrobinson/Desktop/NuVasive/AllSICButNuVasiveAcq3841PrimOnlyCleanF.xls", firstrow(variables) replace

******************************************************
*Step 3 - All SIC: 3841 BUT NuVasive - Acquiror contains SIC Code ==3841

clear all

import excel "/Users/gregoryrobinson/Desktop/NuVasive/All3841ButNuvF.xls", sheet("Request 6") firstrow

drop if TargetNation != "United States"
drop if AcquirorNation != "United States"

drop if DateAnnounced ==.
drop if OwnedAfterTransaction !=100

drop if TargetPrimarySICCode ==6311
drop if TargetPrimarySICCode ==6321
drop if TargetPrimarySICCode ==6519
drop if TargetPrimarySICCode ==6552
drop if TargetPrimarySICCode ==6719
drop if TargetPrimarySICCode ==6726
drop if TargetPrimarySICCode ==6794
drop if TargetPrimarySICCode ==6799

keep DateAnnounced DateEffective AcquirorCUSIP TargetCUSIP 

*1,124 obs

export excel using "/Users/gregoryrobinson/Desktop/NuVasive/AllSICButNuVasiveAllAcq3841CleanF.xls", firstrow(variables) replace

******************************************************
*Step 4 - All excluding financial services (SIC 60-67)

clear all

use "/Users/gregoryrobinson/Desktop/NuVasive/AllManToServSun234.dta"

append using "/Users/gregoryrobinson/Desktop/NuVasive/AllServToTradeSun254.dta"

append using "/Users/gregoryrobinson/Desktop/NuVasive/AllServToTradeSun254.dta"

save "/Users/gregoryrobinson/Desktop/NuVasive/AllFinal.dta", replace

*Exclude Financial Services Industry - Rerun SDC Query
drop if TargetNation != "United States"
drop if AcquirorNation != "United States"

drop if TargetPrimarySICCode =="6021"
drop if TargetPrimarySICCode =="6022"
drop if TargetPrimarySICCode =="6029"
drop if TargetPrimarySICCode =="6035"
drop if TargetPrimarySICCode =="6036"
drop if TargetPrimarySICCode =="6061"
drop if TargetPrimarySICCode =="6062"
drop if TargetPrimarySICCode =="6099"
drop if TargetPrimarySICCode =="6111"
drop if TargetPrimarySICCode =="6141"
drop if TargetPrimarySICCode =="6153"
drop if TargetPrimarySICCode =="6159"
drop if TargetPrimarySICCode =="6162"
drop if TargetPrimarySICCode =="6163"
drop if TargetPrimarySICCode =="619A"
drop if TargetPrimarySICCode =="619B"
drop if TargetPrimarySICCode =="6211"
drop if TargetPrimarySICCode =="6221"
drop if TargetPrimarySICCode =="6231"
drop if TargetPrimarySICCode =="6282"
drop if TargetPrimarySICCode =="6289"
drop if TargetPrimarySICCode =="6311"
drop if TargetPrimarySICCode =="6321"
drop if TargetPrimarySICCode =="6324"
drop if TargetPrimarySICCode =="6331"
drop if TargetPrimarySICCode =="6351"
drop if TargetPrimarySICCode =="6361"
drop if TargetPrimarySICCode =="6371"
drop if TargetPrimarySICCode =="6399"
drop if TargetPrimarySICCode =="6411"
drop if TargetPrimarySICCode =="6512"
drop if TargetPrimarySICCode =="6513"
drop if TargetPrimarySICCode =="6514"
drop if TargetPrimarySICCode =="6515"
drop if TargetPrimarySICCode =="6517"
drop if TargetPrimarySICCode =="6519"
drop if TargetPrimarySICCode =="6531"
drop if TargetPrimarySICCode =="6541"
drop if TargetPrimarySICCode =="6552"
drop if TargetPrimarySICCode =="6553"
drop if TargetPrimarySICCode =="6712"
drop if TargetPrimarySICCode =="6719"
drop if TargetPrimarySICCode =="6722"
drop if TargetPrimarySICCode =="6726"
drop if TargetPrimarySICCode =="6732"
drop if TargetPrimarySICCode =="6733"
drop if TargetPrimarySICCode =="6794"
drop if TargetPrimarySICCode =="6798"
drop if TargetPrimarySICCode =="6799"

drop if AcquirorPrimarySICCode =="6019"
drop if AcquirorPrimarySICCode =="6021"
drop if AcquirorPrimarySICCode =="6022"
drop if AcquirorPrimarySICCode =="6029"
drop if AcquirorPrimarySICCode =="6099"
drop if AcquirorPrimarySICCode =="6141"
drop if AcquirorPrimarySICCode =="6153"
drop if AcquirorPrimarySICCode =="6159"
drop if AcquirorPrimarySICCode =="6162"
drop if AcquirorPrimarySICCode =="6163"
drop if AcquirorPrimarySICCode =="6211"
drop if AcquirorPrimarySICCode =="6221"
drop if AcquirorPrimarySICCode =="6231"
drop if AcquirorPrimarySICCode =="6282"
drop if AcquirorPrimarySICCode =="6289"
drop if AcquirorPrimarySICCode =="6311"
drop if AcquirorPrimarySICCode =="6321"
drop if AcquirorPrimarySICCode =="6324"
drop if AcquirorPrimarySICCode =="6331"
drop if AcquirorPrimarySICCode =="6361"
drop if AcquirorPrimarySICCode =="6399"
drop if AcquirorPrimarySICCode =="6411"
drop if AcquirorPrimarySICCode =="6512"
drop if AcquirorPrimarySICCode =="6513"
drop if AcquirorPrimarySICCode =="6514"
drop if AcquirorPrimarySICCode =="6517"
drop if AcquirorPrimarySICCode =="6531"
drop if AcquirorPrimarySICCode =="6541"
drop if AcquirorPrimarySICCode =="6552"
drop if AcquirorPrimarySICCode =="6719"
drop if AcquirorPrimarySICCode =="6722"
drop if AcquirorPrimarySICCode =="6726"
drop if AcquirorPrimarySICCode =="6732"
drop if AcquirorPrimarySICCode =="6794"
drop if AcquirorPrimarySICCode =="6798"
drop if AcquirorPrimarySICCode =="6799"

drop if DateAnnounced ==.
drop if OwnedAfterTransaction !=100

keep DateAnnounced DateEffective ACQ_CUSIP TGT_CUSIP 

*54,994 obs

save "/Users/gregoryrobinson/Desktop/NuVasive/AllCleanFINAL.dta"

export excel using "/Users/gregoryrobinson/Desktop/NuVasive/AllCleanFINAL.dta", firstrow(variables) replace


