/* Adapted from utl-graphics-boxplots-with-jiggled-point-values-alongside.sas
   The author's INPUT DATA step, kept verbatim; the only change is the target
   library (upstream `libname sd1 "d:/sd1"` -> WORK) so the run is self-contained.
   PROC MEANS reports the per-group summary statistics that sit behind the
   boxplot the tutorial draws (the control/treat medians of 4 and 8 match the
   author's example output). */

options validvarname=upcase;
data have (drop=i j);
   do i = 1 to 2;
      input variable $ @@;
      variable2=cats(variable,'2');
      do j = 1 to 15;
         input value @@;
         output;
      end;
   end;
cards4;
control 4 6 3 4 7 8 2 3 4 1 3 8 9 5 6
treat 8 9 7 8 6 7 6 7 9 8 9 8 7 8 5
;;;;
run;quit;

proc print data=have (obs=8);
   title "SD1.HAVE (first 8 of 30 obs)";
run;

proc means data=have n mean median min max maxdec=2;
   class variable;
   var value;
   title "Boxplot summary statistics by group";
run;
