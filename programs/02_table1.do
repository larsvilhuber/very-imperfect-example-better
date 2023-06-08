/* This file creates Table 1 in the paper.  */
/* Author: Lars Vilhuber */

/* paths */
local pwd : pwd
global basepath "`pwd'/.."      // change this for your specific system
global outputdata "$basepath/data/outputdata" // this is where you would write the data you create in this project
//global results "$basepath/tables"       // All tables for inclusion in your paper go here
global results "$basepath/text"        // Write tables to the LaTeX directory
global dtam  "$outputdata/pumsak.dta"  /* Stata PUMS merged data */

clear
use  "$dtam", clear  /* load merged data */
save "US Census 2000", replace

  /* table with appropriate weights */
  tab specific_ak [fweight=pweight_num]
  /* output the table to latex */
  label define spec 0  "Not identified" 1 "Identified with one of the four tribes"
  label value specific_ak spec
  latab specific_ak [fweight=pweight_num],  tf("$results/freq_specific_ak") replace dec(2)

rm "US Census 2000.dta"