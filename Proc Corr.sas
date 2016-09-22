data a;
input age bp height;
cards;
20 100 5
20 100 5
25 95 5.5
25 95 5.5
30 90 5.7
30 90 5.7
35 85 5.9
35 85 5.9
40 80 6.1
40 80 6.3
45 75 6.5
45 75 6.5
50 70 6.7
50 70 6.7
55 65 6.9
55 65 6.9
60 60 7.1
60 60 7.1
65 10000 7.3
65 10000 7.3
;
run;


proc corr data=a pearson;
run;

proc corr data=a pearson;
with height;
run;


proc corr data=a pearson;
run;


proc corr data=a pearson;
where age ne 65;
run;


proc corr data=a out=b;
run;

proc corr data=a outp=b;
run;
proc corr data=a spearman;
run;

proc corr data=a spearman;
where age ne 65;
run;


proc corr data=a outs=b rank;
run;


proc corr data=a pearson spearman ;
run;
