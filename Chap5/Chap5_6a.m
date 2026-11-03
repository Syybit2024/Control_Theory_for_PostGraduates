clc
close all
clear all
%% Exam0
A = [0   1  0;
     0   0  1;
     -1 -5 -6];
B = [0;
     0;
     1];
C =  eye(3);
D =  zeros(3,1);
J1 = [-2+j*4 -2-j*4 -10];
J2 = 5*J1;
J3 = [-2+j*1 -2-j*1 -5];
J4 = 2*J3;

K1 = place(A,B,J1); %   acker(A,B,J1)
K2 = place(A,B,J2); %   acker(A,B,J2)
K3 = place(A,B,J3); %   acker(A,B,J2)
K4 = place(A,B,J4); %   acker(A,B,J2)
 
%% Transfer function response with zero initials 
[Num1,Den1] = ss2tf(A-B*K1,B,C,D);
[Num2,Den2] = ss2tf(A-B*K2,B,C,D);


figure
step(Num1,Den1)

figure
set(gcf, 'Position', [100, 100, 800, 600])

step(Num2,Den2)
%% Non zero initials
sys1 = ss(A-B*K1, B, C, D);
sys2 = ss(A-B*K2, B, C, D);
sys3 = ss(A-B*K3, B, C, D);
sys4 = ss(A-B*K4, B, C, D);

t = 0:0.01:4;
x1 = initial(sys1,[1;0;0],t);
x2 = initial(sys2,[1;0;0],t);
x3 = initial(sys3,[1;0;0],t);
x4 = initial(sys4,[1;0;0],t);

%%
figure
set(gcf, 'Position', [100, 100, 800, 600])

subplot(3,1,1)
plot(t(1,:), x1(:,1),'-', t(1,:),x2(:,1),'-.',t(1,:),x3(:,1),':',t(1,:),x4(:,1),'--')
hh = legend('$x_{1}$ under $K_1$'  ,'$x_{1}$ under $K_2$', '$x_{1}$ under $K_3$' ,'$x_{1}$ under $K_4$');
set(hh,'Interpreter','latex');

subplot(3,1,2)
plot(t(1,:), x1(:,2),'-', t(1,:),x2(:,2),'-.',t(1,:),x3(:,2),':',t(1,:),x4(:,2),'--')
hh = legend('$x_{2}$ under $K_1$'  ,'$x_{2}$ under $K_2$', '$x_{2}$ under $K_3$' ,'$x_{2}$ under $K_4$');
set(hh,'Interpreter','latex');

subplot(3,1,3)
plot(t(1,:), x1(:,3),'-', t(1,:),x2(:,3),'-.',t(1,:),x3(:,3),':',t(1,:),x4(:,3),'--')
hh = legend('$x_{3}$ under $K_1$'  ,'$x_{3}$ under $K_2$', '$x_{3}$ under $K_3$' ,'$x_{3}$ under $K_4$');
set(hh,'Interpreter','latex');
%% Control input
u1= K1*x1';
u2= K2*x2';
u3= K3*x3';
u4= K4*x4';

figure
set(gcf, 'Position', [100, 100, 800, 600])

plot(t,u1,'-',t,u2,'-.',t,u3,':',t,u4,'--')
hh = legend('$u$ under    $K_1$',...
             '$u$ under $K_2$',...
             '$u$ under  $K_3$',...
             '$u$ under   $K_4$');
set(hh,'Interpreter','latex');
axis([0,4,-2000,2000]);
