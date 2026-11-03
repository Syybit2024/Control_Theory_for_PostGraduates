clc
close all
clear all

A = [0 1 0;
     0 0 1;
     1 1 2];
B = [0;0;1];
C = [1 1 0 ];

rank([B,A*B,A*A*B])

rank([C;C*A;C*A*A])