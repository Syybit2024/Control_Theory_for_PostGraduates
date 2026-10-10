clc
clear all

global A B 
%% Magnitude of Random Noise
Mrn= 0.01;
%%
A =[-1.7 0 3.5 -1.8;
    0 -2 0 1;
    0 0.8 -1.5 0;
    -3.7 0.7 0 -4.9];
B =[0   0; 
   0   0; 
   -2  0; 
    0 2.5];
C = [1 0 0 0; 
    0 1 0 0];
Ws =  zeros(2,1000);
NumCt =0;
 