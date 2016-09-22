data cars;
set sashelp.cars;
run;

/*more univariate analysis*/
proc univariate data =cars all;
var invoice;
run; 

proc univariate data=cars plots;
var invoice;
run; 

/*xtrme values with with*/

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
