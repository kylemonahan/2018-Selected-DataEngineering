
// Cleaning data, started by Kyle Monahan at Tufts University

summarize 

tab age
tab sex
tab disabled

//Creates a sex variable 
tabulate sex, generate(sex_tab)

//where sex_tab1 is males 
//sex_tab2 is females 

//Show the codebook to investigate what the numbers mean 
//codebook 
//Uncomment if you have an hour or so to watch

//Otherwise, call out directly 
//codebook sex_tab1

// Create dis_tab 1,2,3,4 which correspond to DISABLED 0,1,2,9
//DISTAB 1 = NIU - no data
//DISTAB 2 = disabled
//DISTAB 3 = not disabled
//DISTAB 4 = unknown
// https://international.ipums.org/international-action/downloads/extract_files/ipumsi_00005.cbk

tabulate disabled, generate(dis_tab)

//Export the data
// export delimited using "S:\Temp\Vietnam\ipumsi_0005_small.csv", nolabel replace

tabulate age2, generate(age2_tab)

//age2tab1 is children 0 - 4 years old
//age2tab2 5- 9 years old 

//export delimited using "S:\Temp\Vietnam\ipumsi_0005_small.csv", nolabel replace


//Started to clean the data

use "C:\Users\kmonah02\Downloads\ipumsi_00005_small.dta",replace


tabulate electric, generate(elec_tab)
tabulate watsup, generate(wat_tab)
tabulate lit, generate(lit_tab)


collapse (sum) girls=sex_tab2 boys=sex_tab1 ///
			disabNA=dis_tab1 disabY=dis_tab2 /// Where NA is Not in Universe and Y is Disabled
			disabN=dis_tab3 disabUK=dis_tab4 /// Where UK = Unknown and N is Not disabled
			/// Missing a bunch of the labels here, forgot to save.
, by(geolev2)

//Saved out as VietnamCEnsus_byDistrict.dta
