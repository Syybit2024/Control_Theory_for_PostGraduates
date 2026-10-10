clc
clear all
close all


A =[0 0 1 0;
    0 0 0 1;
    0 0.8 -1.5 0;
    -0.8 -1.5 0 -4.9];

B =[0   0; 
    0   0; 
   -2   0; 
    0  2.5];

C = [1 0 0 0; 
     0 1 0 0];
D = [0 0; 0 0];

Tf_Ss   =ss(A,B,C,D)

Tf_Css0 = c2d(Tf_Ss,1,'foh')
Tf_Css1 = c2d(Tf_Ss,0.1,'foh')
Tf_Css2 = c2d(Tf_Ss,0.01,'foh')
Tf_Css3 = c2d(Tf_Ss,0.001,'foh')


figure(1)
step(Tf_Ss)

figure(2)
step(Tf_Css0,Tf_Css1,Tf_Css2,Tf_Css3)