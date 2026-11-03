clc;
close all;
clear all;
A = [0 1 0;0 0 1;-35 -27 -9];
B = [0;0;1];
C = eye(3);
D = zeros(3,1);
Q1 = [1 0 0;0 1 0;0 0 1];
R1 = [1];
%% Changed Parameters K
K=100;
Q2=K*Q1;
R2=K*R1;
%%
Q3=K*Q1;
R3=R1;
%%
Q4=Q1;
R4=K*R1;


[K1,P1,E1] = lqr(A,B,Q1,R1);
[K2,P2,E2] = lqr(A,B,Q2,R2);
[K3,P3,E3] = lqr(A,B,Q3,R3);
[K4,P4,E4] = lqr(A,B,Q4,R4);

sys1 = ss(A-B*K1,B,C,D);
sys2 = ss(A-B*K2,B,C,D);
sys3 = ss(A-B*K3,B,C,D);
sys4 = ss(A-B*K4,B,C,D);


t = 0:0.01:4;
x1 = initial(sys1,[1;0;0 ],t);
x2 = initial(sys2,[1;0;0 ],t);
x3 = initial(sys3,[1;0;0 ],t);
x4 = initial(sys4,[1;0;0 ],t);

u1 =   K1*x1';
u2 =   K2*x2';
u3 =   K3*x3';
u4 =   K4*x4';
%% Figure plots
figure
subplot(3,1,1)
plot(t,x1(:,1),'-',t,x2(:,1),'--',t,x3(:,1),'-.',t,x4(:,1),':')
hh = legend('$x_{1}$ under  $K_1$', '$x_{1}$ under  $K_2$',...
             '$x_{1}$ under $K_3$','$x_{1}$ under  $K_4$');
set(hh,'Interpreter','latex');

subplot(3,1,2)
plot(t,x1(:,2),'-',t,x2(:,2),'--',t,x3(:,2),'-.',t,x4(:,2),':')
hh = legend('$x_{2}$ under   $K_1$', '$x_{2}$ under   $K_2$',...
             '$x_{2}$ under   $K_3$','$x_{2}$ under  $K_4$');
set(hh,'Interpreter','latex');

subplot(3,1,3)
plot(t,x1(:,3),'-',t,x2(:,3),'--',t,x3(:,3),'-.',t,x4(:,3),':')
hh = legend('$x_{3}$ under   $K_1$', '$x_{3}$ under  $K_2$',...
             '$x_{3}$ under   $K_3$','$x_{3}$ under   $K_4$');
set(hh,'Interpreter','latex');


figure
plot(t,u1,'-',t,u2,'--',t,u3,'-.',t,u4,':')
hh = legend('$u(t)$ under  $K_1$', '$u(t)$ under  $K_2$',...
             '$u(t)$ under   $K_3$','$u(t)$ under  $K_4$');
set(hh,'Interpreter','latex');

eig(A-B*K1)