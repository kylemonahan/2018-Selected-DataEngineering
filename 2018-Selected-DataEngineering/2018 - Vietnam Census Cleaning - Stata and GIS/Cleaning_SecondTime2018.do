
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

//Started to clean again 4-26-2018

use "C:\Users\username\Downloads\ipumsi_00005_small.dta",replace

tabulate electric, generate(elec_tab)
tabulate watsup, generate(wat_tab)
tabulate lit, generate(lit_tab)
tabulate chborn, generate(chb_tab)

gen wom_ch=1 if (sex==2) & (chborn != 0) | (chborn != 99) & (sex==2)

collapse (sum) girls=sex_tab2 boys=sex_tab1 ///
			disabNA=dis_tab1 disabY=dis_tab2 /// Where NA is Not in Universe and Y is Disabled
			disabN=dis_tab3 disabUK=dis_tab4 /// Where UK = Unknown and N is Not disabled
			age0=age2_tab1 age5=age2_tab2    ///
			age10=age2_tab3 age15=age2_tab4    ///
			age20=age2_tab5 age25=age2_tab6    ///
			age30=age2_tab7 age35=age2_tab8    ///
			age40=age2_tab9 age45=age2_tab10    ///
			age50=age2_tab11 age55=age2_tab12    ///
			age60=age2_tab13 age65=age2_tab14    ///
			age70=age2_tab15 age75=age2_tab16    ///
			age80=age2_tab17    ///
			watsP=wat_tab1 watsPP=wat_tab2 ///
			watsN=wat_tab3 watsUK=wat_tab4 ///
			LitNA=lit_tab1 LitN=lit_tab2 ///
			LitY=lit_tab3 chbN=chb_tab1 ///
			chb1=chb_tab2 chb2=chb_tab3 /// 
			chb3=chb_tab4 chb4=chb_tab5 ///
			chb5=chb_tab6 chb6=chb_tab7 ///
			chb7=chb_tab8 chb8=chb_tab9 ///
			chb9=chb_tab10 chb10=chb_tab11 ///
			chb11=chb_tab12 chb12=chb_tab13 ///
			chb13=chb_tab14 chbUK=chb_tab15 ///
			chbNIU=chb_tab16  ///
			womch=wom_ch /// where this is the number of people where sex = women and childborn is not Unknown or 0 
, by(geolev2)

//Saved out as VietnamCEnsus_byDistrict.dta
