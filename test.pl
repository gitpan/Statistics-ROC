# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN { $| = 1; print "1..8\n"; }
END {print "not ok 1\n" unless $loaded;}
use Statistics::ROC;
$loaded = 1;
print "ok 1\n";

######################### End of black magic.


$test_num=2;
eval{
     if(loggamma(10) - 12.801827 < 0.000001)
     {
       print "ok ",$test_num++,"\n";
     }
     else{
       print "NOT ok ",$test_num++,"\n";
     }
     
     if(Xinbta(3,4,Betain(.6,3,4)) - 0.599999 < 0.000001)
     {
       print "ok ",$test_num++,"\n";
     }
     else{
       print "NOT ok ",$test_num++,"\n";
     }
     

     @e=(0.7, 0.7, 0.9, 0.6, 1.0, 1.1, 1,.7,.6);
     
     if(join(" ",rank('low',@e)) eq "3 3 6 1 7 9 7 3 1")
     {
       print "ok ",$test_num++,"\n";
     }
     else{
       print "NOT ok ",$test_num++,"\n";
     }
     
     if(join(" ",rank('high',@e)) eq "5 5 6 2 8 9 8 5 2")
     {
       print "ok ",$test_num++,"\n";
     }
     else{
       print "NOT ok ",$test_num++,"\n";
     }
     
     if(join(" ",rank('mean',@e)) eq "4 4 6 1.5 7.5 9 7.5 4 1.5")
     {
       print "ok ",$test_num++,"\n";
     }
     else{
       print "NOT ok ",$test_num++,"\n";
     }

     @var_grp=([1.5,0],[1.4,0],[1.4,0],[1.3,0],[1.2,0],[1,0],[0.8,0],
               [1.1,1],[1,1],[1,1],[0.9,1],[0.7,1],[0.7,1],[0.6,1]);

     @curves=roc('decrease',0.95,@var_grp);
     if($curves[0][2][0] - 0.464301 < 0.000001)
     {
       print "ok ",$test_num++,"\n";
     }
     else{
       print "NOT ok ",$test_num++,"\n";
     }
     
     if($curves[0][2][1] - 0.025629 < 0.000001)
     {
       print "ok ",$test_num++,"\n";
     }
     else{
       print "NOT ok ",$test_num++,"\n";
     }
}    


