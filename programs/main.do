local pwd : pwd
cd ..
global basepath : pwd      // change this for your specific system
cd "`pwd'"

global icpsrpath "$basepath/data/ICPSR_13568/DS0002"  /* local relative path */
global inputdata "$basepath/data/inputdata"  // this is where you would read data acquired elsewhere
global outputdata "$basepath/data/outputdata" // this is where you would write the data you create in this project
global results "$basepath/tables_and_figure"       // All tables for inclusion in your paper go here
global programs "$basepath/programs"    // All programs (which you might "include") are to be found here
global adobase  "$basepath/programs/ado" // Ado packages used by the project are to be found here
global dtam  "$outputdata/analysis-lars.dta"  /* Stata PUMS merged data */


cap mkdir "$outputdata"
cap mkdir "$results"

/* from here, no further edits necessary */

do "$programs/00_setup_stata.do"
do "$programs/01_dataclean.do"
do "$programs/02_table1.do"
