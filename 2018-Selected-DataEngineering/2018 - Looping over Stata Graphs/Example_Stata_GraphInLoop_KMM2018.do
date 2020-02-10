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
//  Date: 2-6-2018
//  By: Kyle Monahan
//  Version: Stata 15.0
//  ----------------------------------------
//
//
//  To access other online resources on statistics, see go.tufts.edu/stats

/*-------------------- Getting Started ------------------
 
For: Sara
Department: Community Health

The goal of this document is to teach students how to run a loop to create
graphs according to a certain variable. In this case, we are looping over a
list of variables, but you can do the same for values of a variable.  

  ---------------------------------------------------------*/
  

* Adapted from https://www.stata.com/statalist/archive/2011-07/msg00320.html
* First check where we are in the directory: 
pwd

* Now we adjust our directory cd or change directory, you should change yours 
* accordingly: 
  
cd "C:\Users\username\Desktop"

*------------- begin example from website --------------
 sysuse nlsw88, clear
 foreach var of varlist wage hours ttl_exp {
    twoway scatter `var' grade || ///
           lfit `var' grade,      ///
           saving(gr`var', replace)  
}
*--------------- end example from website --------------

* Note that naming(gr`var', replace) will just display the graphs 
* I added saving to save them.
