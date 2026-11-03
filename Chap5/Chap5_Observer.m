clc
close all
clear all
%% Exam0
A = [0 1 0;
     0 0 1;
     -1 -5 -6];
B = [0;0;1];
C = [1 0 0;
     0 1 0];
D =  zeros(2,1);
Jc  = [-2+j*4 -2-j*4 -10];
JO1 = [-2 -3 -4];
JO2 = 5*[-2 -3 -4];
JO3 = [-5+8*j  -5-8*j  -8];
JO4 = [-3+3*j  -3-3*j  -4];

K    = place(A,B,Jc);   %   acker(A,B,Jc)
L1T    = place(A',C',JO1) %   acker(A',C',JO1)
L2T    = place(A',C',JO2) %   acker(A',C',JO2)
 

L1= L1T';
L2= L2T';
 
%% Augmented System
A_bar1 = [A-B*K B*K; zeros(3,3) A-L1*C];
A_bar2 = [A-B*K B*K; zeros(3,3) A-L2*C];
 

B_bar =  zeros(6,1); C_bar = eye(6); D_bar = zeros(6,1);

sys1 = ss(A_bar1,B_bar,C_bar,D_bar);
sys2 = ss(A_bar2,B_bar,C_bar,D_bar);
 

t = 0:0.01:4;
x1 = initial(sys1,[1;0;0;1;0;0],t);
x2 = initial(sys2,[1;0;0;1;0;0],t);
 

%% Observer under different observer gains
figure
subplot(3,1,1)
plot(t(1,:), x1(:,1)-x1(:,4),'-', t(1,:),x2(:,1)-x2(:,4),'-.')
hh = legend('$e_{1}$ under Low  $L_1$',...
             '$e_{1}$ under High $L_2$');
set(hh,'Interpreter','latex');

subplot(3,1,2)
plot(t(1,:), x1(:,2)-x1(:,5),'-', t(1,:),x2(:,2)-x2(:,5),'-.')
hh = legend('$e_{2}$ under Low  $L_1$',...
             '$e_{2}$ under High $L_2$');
set(hh,'Interpreter','latex');

subplot(3,1,3)
plot(t(1,:), x1(:,3)-x1(:,6),'-', t(1,:),x2(:,3)-x2(:,6),'-.')
hh = legend('$e_{3}$ under Low  $L_1$',...
             '$e_{3}$ under High $L_2$');
set(hh,'Interpreter','latex');

sgtitle('Observer Errors under Low and High Observer Gains');

%% State responses under different observer gains
figure
subplot(3,1,1)
plot(t(1,:), x1(:,1),'-', t(1,:),x2(:,1),'-.')
hh = legend('$x_{1}$ under Low  $L_1$',...
             '$x_{1}$ under High $L_2$');
set(hh,'Interpreter','latex');

subplot(3,1,2)
plot(t(1,:), x1(:,2),'-', t(1,:),x2(:,2),'-.')
hh = legend('$x_{2}$ under Low  $L_1$',...
             '$x_{2}$ under High  $L_2$');
set(hh,'Interpreter','latex');

subplot(3,1,3)
plot(t(1,:), x1(:,3),'-', t(1,:),x2(:,3),'-.')
hh = legend('$x_{3}$ under Low  $L_1$',...
             '$x_{3}$ under High  $L_2$');
set(hh,'Interpreter','latex');

 
sgtitle('State Responses under Low and High Observer Gains');
%% Observer errors under different observer gains
figure
subplot(3,1,1)
plot(t(1,:), x1(:,4),'-', t(1,:),x2(:,4),'-.')
hh = legend('$\tilde{x}_{1}$ under Low  $L_1$',...
             '$\tilde{x}_{1}$ under High $L_2$');
set(hh,'Interpreter','latex');

subplot(3,1,2)
plot(t(1,:), x1(:,5),'-', t(1,:),x2(:,5),'-.')
hh = legend('$\tilde{x}_{2}$ under Low  $L_1$',...
             '$\tilde{x}_{2}$ under High  $L_2$');
set(hh,'Interpreter','latex');

subplot(3,1,3)
plot(t(1,:), x1(:,6),'-', t(1,:),x2(:,6),'-.')
hh = legend('$\tilde{x}_{3}$ under Low  $L_1$',...
             '$\tilde{x}_{3}$ under High  $L_2$');
set(hh,'Interpreter','latex');

sgtitle('Observer State under Low and High Gains');
%% Control input under different observer gains

u1=   K * [x1(:,1)'-x1(:,4)';  x1(:,2)'-x1(:,5)';  x1(:,3)'-x1(:,6)'];
u2=   K * [x2(:,1)'-x2(:,4)';  x2(:,2)'-x2(:,5)';  x2(:,3)'-x2(:,6)'];
 

figure
plot(t,u1,'-',t,u2,'-.')
hh = legend( '$u$ under  $L_1$',...
             '$u$ under  $L_2$');
set(hh,'Interpreter','latex');

sgtitle('Low and High Gains based Controller');
