clc
clear all
close all
%%
num = [1];
den = [1 0 1];
w = logspace(-1,1,200);
bode(num,den,w)
title('Bode Diagram of 1/(s^2+1)')
grid on
%%
num = [4];
den = [1 0 1 0];
w = logspace(-1,1,200);
bode(num,den,w)
title('Bode Diagram of 4/[s(s^2+1)]')
grid on
%%
figure
num = [20 4];
den = [1 0 1 0];
w = logspace(-2,1,101);
bode(num,den,w)
title('Bode Diagram of G(s) = 4(5s+1)/[s(s^2+1)]')
grid on

%%
figure
num = [5 21 4];
den = [1 0 1 0];
w = logspace(-2,2,100);
bode(num,den,w)
title('Bode Diagram of 4(5s+1)(0.25s+1)/[s(s^2+1)]')
grid on

%% Closed loop response 
%***** Unit-step response *****
figure
num = [5 21 4];
den = [1 5 22 4];
t = 0:0.01:14;
c = step(num,den,t);
plot(t,c)
grid
suptitle('Unit-Step Response of Compensated System')
xlabel('t (sec)')
ylabel('Output c(t)')
%***** Unit-ramp response *****
figure
num1 = [5 21 4];
den1 = [1 5 22 4 0];
t = 0:0.02:20;
c = step(num1,den1,t);
subplot(2,1,1)
plot(t,c,'-',t,t,'--')
ylabel('Unit-Ramp Input and Output c(t)')

legend('Output','Reference')
subplot(2,1,2)
plot(t,t-c')
legend('error')
xlabel('t (sec)')
ylabel('Error under Unit-Ramp Input')
 

suptitle('Unit-Ramp Response of Compensated System')
