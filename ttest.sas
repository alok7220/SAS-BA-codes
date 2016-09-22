data PST;
set "C:\Users\als15012\Downloads\PST.sas7bdat";
run;
proc means data=PST;
var write;
run;
/*See T statistics value*/
proc ttest data=PST H0=10;
var write;
run;

/*See T statistics value*/
proc ttest data=PST H0=20;
var write;
run;

/*See T statistics value*/
proc ttest data=PST H0=40;
var write;
run;

/*See T statistics value*/
proc ttest data=PST H0=50;
var write;
run;


/*See T statistics value*/
proc ttest data=PST H0=52.775;
var write;
run;

/*See T statistics value*/
proc ttest data=PST H0=60;
var write;
run;

/*See T statistics value*/
proc ttest data=PST H0=80;
var write;
run;

/*See T statistics value*/
proc ttest data=PST H0=90;
var write;
run;

/*The above are all examples of 1 sample T-test We observe that as the sample mean approaches 
the population mean the t statistics approaches 0 and the P value approaches 1.
As we move away from the population mean the t statistics changes
We get +ve t statistics if H0 is greater than population mean else -ve statistics*/


/*An example of two sample t test*/
proc ttest data=PST;
class female;
var write;
run;

data cereal;
 input brand $ weight 7.4 @@;
cards;
Kellogs 14.9982 Nestle 15.0136 Kellogs 15.0100 Nestle 14.9982 Kellogs 15.0052
Nestle 14.9930 Kellogs 14.9733 Nestle 15.0812
Kellogs 15.0037 Nestle 15.0418 Kellogs 14.9957 Nestle 15.0639 Kellogs 15.0099
Nestle 15.0613 Kellogs 14.9943 Nestle 15.0255
Kellogs 14.9779 Nestle 15.0176 Kellogs 14.9862 Nestle 15.0122 Kellogs 14.9907
Nestle 15.0122 Kellogs 14.9785 Nestle 15.0322
Kellogs 15.0716 Nestle 15.0164 Kellogs 14.9787 Nestle 15.0093 Kellogs 14.9935
Nestle 15.0156 Kellogs 15.0270 Nestle 15.0393
Kellogs 14.9855 Nestle 15.0298 Kellogs 14.9982 Nestle 15.0204 Kellogs 15.0194
Nestle 15.0633 Kellogs 14.9720 Nestle 15.0464
Kellogs 14.9793 Nestle 15.0858 Kellogs 15.0304 Nestle 15.0418 Kellogs 15.0187
Nestle 15.0101 Kellogs 15.0134 Nestle 15.0580
Kellogs 14.9930 Nestle 15.0550 Kellogs 14.9690 Nestle 15.0500 Kellogs 14.9955
Nestle 15.0868 Kellogs 15.0032 Nestle 15.0196
Kellogs 14.9737 Nestle 15.0413 Kellogs 15.0254 Nestle 15.0267 Kellogs 14.9885
Nestle 15.0374 Kellogs 15.0223 Nestle 15.0437
Kellogs 15.0057 Nestle 15.0194 Kellogs 15.0039 Nestle 15.0623 Kellogs 14.9515
Nestle 15.0980 Kellogs 14.9894 Nestle 15.0234
Kellogs 15.0169 Nestle 14.9831 Kellogs 14.9803 Nestle 15.0435 Kellogs 14.9730
Nestle 15.0497 Kellogs 14.9779 Nestle 15.0096
;
 run;
proc ttest data=cereal;
 class brand;
 var weight;
 title 'Testing the Equality of Means for Two Cereal Brands';
run;



data efh;
   input cond $ test msat;
   label cond = 'Experimental condition';
   label test = 'Fraction correct on post-test';
   label msat = 'Math SAT score';
   datalines;
A       0.71    650
A       0.82    710
A       0.82    510
A       0.76    590
A       0.76    500
A       0.71    730
A       0.71    570
A       0.82    780
B       0.65    690
B       0.53    710
B       0.88    780
B       0.59    690
B       0.76    730
B       0.59    700
B       0.65    740
;
 
proc print data=efh;
run;
 
proc ttest data=efh;
   class cond;
   var test;
run; 



data hci;
   input new old;
   label new = 'Time in minutes needed with new interface';
   label old = 'Time in minutes needed with old interface';
   improv=old-new;
   datalines;
4.5 5.2
4.2 5.7
3.4 3.2
4.3 5.1
4.3 4.5
3.9 3.7
4.7 5.1
3.4 3.4
;
 
proc print data=hci;
run;
 
proc univariate data=hci;
   var improv;
run;



DATA relieftime;
	INPUT relief;
DATALINES;
90
93
93
99
98
100
103
104
99
102
;
PROC UNIVARIATE DATA = relieftime normal plot;
	VAR relief;
	histogram relief / midpoints = 80 to 120 by 5 normal;
RUN;


PROC TTEST DATA = relieftime h0=100;
	TITLE 'One-sample T-test example' ;
	VAR relief;
RUN;


DATA study;
	INPUT before after;
DATALINES;
90 95
87 92
100 104
80 89
95 101
90 105
;
PROC UNIVARIATE DATA = study normal plot;
	VAR before after;
	histogram before after / normal;
RUN;


DATA study;
	INPUT before after;
DATALINES;
90 95
87 92
100 104
80 89
95 101
90 105
;
PROC UNIVARIATE DATA = study normal plot;
	VAR before after;
	histogram before after / normal;
RUN;


data Wine2;
input WineType $ VisitLength @@;
datalines;
white 80 white 98 white 115 white 89 white 103
white 91 white 119 white 31 white 109 white 95
white 71 white 105 white 66 white 141 white 79
white 113 white 69 white 120 white 87
red 93 red 87 red 106 red 76 red 121 red 143
red 81 red 97 red 74 red 107 red 112 red 67
red 107 red 72 red 116 red 99 red 104 red 91
red 132 red 78 red 107 red 101 red 92
;
run;

proc ttest data=Wine2;
class WineType;
var VisitLength;
run;

