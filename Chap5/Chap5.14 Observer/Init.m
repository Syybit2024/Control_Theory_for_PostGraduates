clc
close all
clear all

global A B C L1 L2 L3 L4
A = [0 1 0;
     0 0 1;
     -1 -0.35 -2];
B = [0;0;1];
C = [1 0 0;
     0 2 0];

JO1 = [-2 -3+3j -3-3j];
JO2 = [-2 -3 -3];
JO3 = 5*JO1 ;
JO4 = 5*JO2;


L1T    = place(A',C',JO1);%   acker(A',C',JO1)
L2T    = place(A',C',JO2);%   acker(A',C',JO2)
L3T    = place(A',C',JO3);%   acker(A',C',JO3)
L4T    = place(A',C',JO4);%   acker(A',C',JO4)

L1 = L1T';
L2 = L2T';
L3 = L3T';
L4 = L4T';