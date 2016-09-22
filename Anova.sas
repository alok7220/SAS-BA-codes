DATA ACHE;
INPUT BRAND RELIEF;
CARDS;
1 24.5
1 23.5
1 26.4
1 27.1
1 29.9
2 28.4
2 34.2
2 29.5
2 32.2
2 30.1
3 26.1
3 28.3
3 24.3
3 26.2
3 27.8
;


PROC ANOVA DATA=ACHE;
    CLASS BRAND;
    MODEL RELIEF=BRAND;
    MEANS BRAND/DUNNET ;
TITLE 'COMPARE RELIEF ACROSS MEDICINES  - ANOVA EXAMPLE';
RUN;
QUIT;
PROC GPLOT;
       PLOT RELIEF*BRAND;
run;
PROC BOXPLOT;
    PLOT RELIEF*BRAND;
       TITLE 'ANOVA RESULTS';
RUN;
QUIT;


proc glm data = PST;
 class female ;
 model write = female ;
run; 
quit;

proc anova data = PST;
 class female ;
 model write = female ;
run; 
quit;
