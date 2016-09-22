libname loc '/folders/myshortcuts/pst';

data logit;
 set loc.pst;
 honcomp = (write >= 60);
run;

proc logistic data= logit; 
 model honcomp = female read science;
run;

proc logistic data= logit descending; 
 model honcomp = female read science;
run;


proc logistic data= logit; 
 model honcomp = female read science;
 output out=abc p=predicted;
run;



proc logistic data= logit outest=sanjay; 
 model honcomp = female read science;
 output out=abc p =pred;
run;


proc logistic data= logit ;
/* outest=est;  */
 model honcomp = female read science;
/*  /ctable; */
 output out=abc p=pred1 pred=pred2 predicted=pred3;
run;


proc logistic data= logit ;

 model honcomp = female read science;
 output out=abc p=pred1 
/*  pred=pred2 predicted=pred3; */
run;


proc logistic data= logit ;

 model honcomp = female read science;
 output out=abc  pred=pred2; 
/*  p=pred1  predicted=pred3; */
run;



proc logistic data= logit ;

 model honcomp = female read science;
 output out=abc  predicted=pred3; 
/*  p=pred1  ; */
run;


proc logistic data= logit ;

 model honcomp = female read science;
 output out=abc  pred=pred2 p=pred1  predicted=pred3;
run;

proc logistic data=logit plots=effect plots=roc;
model honcomp = female read science /outroc = rocout ;
output out=estimated predicted=estprob l=lower95 u=upper95;  
run;


