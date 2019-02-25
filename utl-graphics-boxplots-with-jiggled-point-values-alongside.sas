Graphics boxplots with jiggled point values alongside                                                              
                                                                                                                   
github                                                                                                             
https://tinyurl.com/y4y86cx2                                                                                       
https://github.com/rogerjdeangelis/utl-graphics-boxplots-with-jiggled-point-values-alongside                       
                                                                                                                   
StackOverflow                                                                                                      
https://tinyurl.com/y67zk8as                                                                                       
https://stackoverflow.com/questions/54672468/ggplot2-how-to-nudge-the-position-of-points-in-geom-beeswarm          
                                                                                                                   
Dominic Mart                                                                                                       
https://stackoverflow.com/users/11056832/dominic-mart                                                              
                                                                                                                   
INPUT                                                                                                              
=====                                                                                                              
                                                                                                                   
options validvarname=upcase;                                                                                       
libname sd1 "d:/sd1";                                                                                              
data sd1.have (drop=i j);                                                                                          
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
                                                                                                                   
                                                                                                                   
/*                                                                                                                 
We create a duplicate variable for second set of box and points;                                                   
                                                                                                                   
SD1.HAVE total obs=30                                                                                              
                                                                                                                   
Obs    VARIABLE    VARIABLE2    VALUE                                                                              
                                                                                                                   
  1    control     control2       4                                                                                
  2    control     control2       6                                                                                
  3    control     control2       3                                                                                
  4    control     control2       4                                                                                
  5    control     control2       7                                                                                
  6    control     control2       8                                                                                
  7    control     control2       2                                                                                
*/                                                                                                                 
                                                                                                                   
                                                                                                                   
EXAMPLE OUTPUT                                                                                                     
--------------                                                                                                     
                                                                                                                   
                                                                                                                   
  VALUE  +----------------------------------------------+                                                          
         |                                              |                                                          
         |                                              |                                                          
       9 +        |       *            |      * **      +                                                          
         |        |                    |                |                                                          
         |        |                    |                |                                                          
         |        |                    |                |                                                          
       8 +        |       * *       *-----*    *** **   +                                                          
         |        |                 |     |      *      |                                                          
         |        |                 |  +  |     *       |                                                          
         |        |                 |     |        *    |                                                          
       7 +     +-----+     *        +-----+   *   * *   +                                                          
         |     |     |                 |                |                                                          
         |     |     |      *          |                |                                                          
         |     |     |                 |                |                                                          
       6 +     |     |    *     *      |         *      +                                                          
         |     |     |                                  |                                                          
         |     |     |       *                          |                                                          
         |     |     |                                  |                                                          
       5 +     |     |         *       0      *         +                                                          
         |     |  +  |     *                            |                                                          
         |     |     |    *                             |                                                          
         |     |     |                                  |                                                          
       4 +     *-----*    ***                           +                                                          
         |     |     |                                  |                                                          
         |     |     |                                  |                                                          
         |     |     |                                  |                                                          
       3 +     +-----+   ** *                           +                                                          
         |        |                                     |                                                          
         |        |                                     |                                                          
         |        |                                     |                                                          
       2 +        |      *                              +                                                          
         |        |                                     |                                                          
         |        |                                     |                                                          
         |        |                                     |                                                          
       1 +--------+--------------------+----------------+                                                          
                Control              Treat                                                                         
                                                                                                                   
                                                                                                                   
SOLUTION                                                                                                           
========                                                                                                           
                                                                                                                   
%utl_submit_r64('                                                                                                  
library(haven);                                                                                                    
library(ggbeeswarm);                                                                                               
library(ggplot2);                                                                                                  
have<-read_sas("d:/sd1/have.sas7bdat");                                                                            
have;                                                                                                              
str(have);                                                                                                         
png(file="d:/png/utl-graphics-boxplots-with-jiggled-point-values-boxBee.png");                                     
ggplot(have,aes(VARIABLE, VALUE)) +                                                                                
  geom_beeswarm(aes(VARIABLE2),priority="random",cex=2.5) +                                                        
  geom_boxplot() +                                                                                                 
  scale_x_discrete(breaks = c("control", "treat")) +                                                               
  theme(axis.text.x = element_text(hjust=-1),                                                                      
        axis.ticks.x = element_blank(),                                                                            
        panel.grid.major.x = element_blank());                                                                     
dev.off();                                                                                                         
');                                                                                                                
                                                                                                                   
                                                                                                                   
