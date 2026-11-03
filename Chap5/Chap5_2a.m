clc
close all
clear all
%% Exam0
A = [0 1 0;0 0 1;-1 -5 -6];
B = [0;0;1];
C = [1 1 0];
D = 0;
J = [-2+j*4 -2-j*4 -10];
K = acker(A,B,J)
 
[Num,Den] = ss2tf(A-B*K,B,C,D)
figure
step(Num,Den)

%% Exam1
num = [10 10];
den = [1 6 5 10];
[A,B,C,D] = tf2ss(num,den)
figure
step(num,den)


%% Exam2
A = [0 1 0;0 0 1;-5.008 -25.1026 -5.03247];
B = [0;25.04; -121.005];
C = [1 0 0];
D = [0];
[num,den] = ss2tf(A,B,C,D)
figure
step(num,den)

%% Exam Mimo
A = [0 1;-25 -4];
B = [1 1;0 1];
C = [1 0;0 1];
D = [0 0;0 0];
[NUM1,den1] = ss2tf(A,B,C,D,1)
[NUM2,den2] = ss2tf(A,B,C,D,2)
figure
step(NUM1,den1)

figure
step(NUM2,den2)
