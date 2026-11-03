clc;
close all;
clear all;

A = [-1 1;0 2];
B = [0;1];
Q = [1 0; 0 1];
R = [1];
[K,P,E] = lqr(A,B,Q,R)