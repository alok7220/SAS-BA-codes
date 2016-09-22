/*make a library*/
libname ABC 'P:\';

/*import data first*/
data cars;
set sashelp.cars; 
run; 

/* import other files*/
data uconn;
infile "P:\uconn.txt";
input name age job;
run;

/*to print on-screen*/
proc print; 
run;

/*look for the details/contents of the data*/
proc contents data=cars; 
run;

/*you can save the details in another file to use it later */
proc contents data=cars out=ABC.cars_details; 
run; 

/*numeric variable exploration*/
proc means data=cars;
run; 

proc means data=cars; 
class make;
run;


proc means data=cars; 
class make;
var invoice length mpg_city mpg_highway;
run;
proc means data=cars min max std n nmiss; 
class make;
var invoice length mpg_city mpg_highway;
run;
proc means data=cars min max std n nmiss p1 p90 kurt skew clm; 
class make;
var invoice length mpg_city mpg_highway;
run;

/*you can use proc means to find out no. of missing values in character variables*/

/*category variable exploration*/

proc freq data =cars; 
table make;
run; 

proc freq data =cars; 
table make*origin;
run; 


data cars;
set sashelp.cars;
run;

/*univariate analysis*/
proc univariate data =cars;
var invoice;
run; 

proc univariate data =cars plots;
var invoice;
run; 

proc univariate data=cars all;
var invoice;
run; 

/*xtrme values */

proc univariate data=cars;
var invoice; 
id origin make; 
run;

/*creating histogram*/
proc univariate data=cars noprint;
histogram invoice horsepower;
run;

/*proc correlation to find out interaction between any two linear variables*/

proc corr data=sashelp.cars;
run;
quit;


/*maxpoint limit on a scatterplot is 5000, do remember to put mapoints=none to plot*/
ods graphics on;
proc corr data=sashelp.cars plot(maxpoints=none)=matrix(histogram);
run;
quit;

/*correlation coefficient can be affected by outliers, it is good to use spearman corr as it is a rank based correlation*/
ods graphics on;
proc corr data=sashelp.cars plot(maxpoints=none)=matrix(histogram) spearman;
run;
quit;


/*plotting variables*/
proc gplot data =cars; 
plot invoice*horsepower;
run;

/*STANDARDIZATION: Most of the times the scales are different for variables. to make them unitless standardization is done*/

proc standard data = sashelp.cars mean=0 std=1 out=carsz;
var length invoice horsepower;
run; 
proc print data=carsz;
run;

/*one can directly use standardized variables using the 'stb option in proc reg or other modelling methods*/

proc reg data=sashelp.cars;
model invoice=horsepower length/stb;
run; 

/*/standard estimate values can be used to compare say length is twice important than horsepower. but we for a unit change concept non-standard estimates should be used*/
