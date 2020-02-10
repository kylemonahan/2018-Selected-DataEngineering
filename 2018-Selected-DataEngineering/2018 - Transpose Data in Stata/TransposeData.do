// Welcome to the 
//  _______     __ _         _____        _          _           _     
// |__   __|   / _| |       |  __ \      | |        | |         | |    
//    | |_   _| |_| |_ ___  | |  | | __ _| |_ __ _  | |     __ _| |__  
//    | | | | |  _| __/ __| | |  | |/ _` | __/ _` | | |    / _` | '_ \ 
//    | | |_| | | | |_\__ \ | |__| | (_| | || (_| | | |___| (_| | |_) |
//    |_|\__,_|_|  \__|___/ |_____/ \__,_|\__\__,_| |______\__,_|_.__/ 
//
//             Innovate. Analyze. Visualize. | datalab.tufts.edu
//
//  ----------------------------------------
//  Date: 5-21-2018
//  By: Kyle Monahan
//  Contact: kyle.monahan -AT- tufts.edu
//  Version: Stata 15.0
//  ----------------------------------------
//
//
//  To access other online resources on statistics, see go.tufts.edu/stats


*Loop over the values of v1 and store them

forval i = 1/3 {
	local label`i' = v1[`i']
	}
*Drop v1, use xpose as normal since there are no strings
drop v1
xpose, clear

*Add the v1 stored as local to the dataset
forval i = 1/3 {
	label var var`i' "`label`i''"
	}
