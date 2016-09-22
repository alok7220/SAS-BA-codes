proc means data=sashelp.cars;
run;
proc means data=sashelp.cars mean;
run;

proc means data=sashelp.cars;
class enginesize;
run;
proc means data=sashelp.cars;
class enginesize type origin;
run;
proc means data=sashelp.cars;
class type;
var invoice msrp;
run;
proc means data=sashelp.cars;
class;
var;
run;
proc means data=sashelp.cars maxdec=2 printalltypes q1  ;
class sex;
var age;
run;

proc sort data=sashelp.cars out=monika;
by cylinders desc;
run;
proc print;
run;

data a;
input sal;
cards;
1
2
3
4
.
;
run;
proc print;
run;

proc means data=a missing;
run;


data a;
do i = 1 to 1000;
output;
end;
run;

proc univariate data=a;
run;



proc rank data=a out=b groups=100;
var i;
ranks rank_i;
run;
