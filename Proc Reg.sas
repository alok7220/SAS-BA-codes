libname loc 'C:\Users\als15012\Downloads';
data pst1;
set pst;
if race=1 then race1=1 ;
else race1=0;
if race=2 then race2=1 ;
else race2=0;
if race=3 then race3=1 ;
else race3=0;
if ses=1 then ses1=1 ;
else ses1=0;
if ses=2 then ses2=1 ;
else ses2=0;
if schtyp=1 then schtyp1=1 ;
else schtyp1=0;
if schtyp=2 then schtyp2=1 ;
else schtyp2=0;
if prog=1 then prog1=1 ;
else prog1=0;
if prog=2 then prog2=1 ;
else prog2=0;

run;



proc reg data = pst1 plots=none;
model math = science read
write
socst
female
race1
race2
race3
ses1
ses2
schtyp1
prog1
prog2;
run;
quit;





proc reg data = pst1 plots=none;
model math = 
science 
read
write
socst
female
race1
race2
race3
ses1
ses2
schtyp1
prog1
prog2
/vif;
run;
quit;
proc reg data = pst1 plots=none;
model math = 
science 
read
write
socst
female
race1
race2
race3
ses1
ses2
schtyp1
prog1
prog2
/vif selection=backward sls=0.05;
run;
quit;





proc reg data = pst1 plots=none;
model math = 
science 
read
write
socst
female
race1
race2
race3
ses1
ses2
schtyp1
prog1
prog2
/vif selection=stepwise sls=0.1 sle=0.05;
run;
quit;

proc reg data = pst1 plots=none;
model math = 
science 
read
write
socst
female
race1
race2
race3
ses1
ses2
schtyp1
prog1
prog2
/vif selection=forward sle=0.05;
run;
quit;
