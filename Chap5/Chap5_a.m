clc
close all
clear all

A = [0 1 0;0 0 1;-1 -5 -6];
B = [0;0;1];
C = [1 1 0];
D = 0;
J = [-2+j*4 -2-j*4 -10];
K = acker(A,B,J)
 
ss = ss2tf(A-B*K,B,C,D)
step(ss)