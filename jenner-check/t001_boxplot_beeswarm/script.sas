/* Adapted from utl-graphics-boxplots-with-jiggled-point-values-alongside.sas
   The author's INPUT DATA step, kept verbatim; the only change is the target
   library (upstream `libname sd1 "d:/sd1"` -> WORK) so the run is self-contained.
   The R ggbeeswarm/geom_boxplot solution renders a boxplot of these values;
   PROC BOXPLOT is the native SAS analog and produces the same boxplot here. */

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

ods listing;
proc boxplot data=have;
   plot value*variable;
   title "Boxplots by group (control vs treat)";
run;
