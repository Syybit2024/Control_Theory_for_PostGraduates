close all;
clear all；
clc;
Tend = max(NonState.Time)
%%
figure(1)
subplot(3,1,1)
plot(NonState.Time,NonState.Data(:,1),'-',PwlState.Time,PwlState.Data(:,1),'--')
hh = legend('Non-State $x_1(t)$','PWL-State $x_1(t)$');
set(hh,'Interpreter','latex');
 
subplot(3,1,2)
plot(NonState.Time,NonState.Data(:,2),'-',PwlState.Time,PwlState.Data(:,2),'--')
hh = legend('Non-State $x_2(t)$','PWL-State $x_2(t)$');
set(hh,'Interpreter','latex');
 
subplot(3,1,3)
plot(NonState.Time,NonState.Data(:,3),'-',PwlState.Time,PwlState.Data(:,3),'--')
hh = legend('Non-State $x_3(t)$','PWL-State $x_3(t)$');
set(hh,'Interpreter','latex');
hx = xlabel('Time(s)');
set(hx,'Interpreter','latex');

figure(2)
subplot(3,1,1)
plot(NonState.Time,NonState.Data(:,1)-PwlState.Data(:,1),'-')
hh = legend('$e_1(t)$');
set(hh,'Interpreter','latex');
 
subplot(3,1,2)
plot(NonState.Time,NonState.Data(:,2)-PwlState.Data(:,2),'-')
hh = legend('$e_2(t)$');
set(hh,'Interpreter','latex');
 
subplot(3,1,3)
plot(NonState.Time,NonState.Data(:,3)-PwlState.Data(:,3),'-')
hh = legend('$e_3(t)$');
set(hh,'Interpreter','latex');
hx = xlabel('Time(s)');
set(hx,'Interpreter','latex');


%  axis([0,Tend,-10,10])
% subplot(2,2,1)
% plot(State1.Time,State1.Data(:,1)-ObSta1.Data(:,1))
% axis([0,Tend,-0.1,0.1])
% hh = legend('$\epsilon_{1}$');
% set(hh,'Interpreter','latex');
% hx = xlabel('Time(s)');
% set(hx,'Interpreter','latex');
% 
% subplot(2,2,2)
% plot(State1.Time,State1.Data(:,2)-ObSta1.Data(:,2))
% axis([0,Tend,-0.1,0.1])
% hh = legend('$\epsilon_{2}$');
% set(hh,'Interpreter','latex');
% hx = xlabel('Time(s)');
% set(hx,'Interpreter','latex');
% 
% subplot(2,2,3)
% plot(State1.Time,State1.Data(:,3)-ObSta1.Data(:,3))
% axis([0,Tend,-0.3,0.3])
% hh = legend('$\epsilon_{3}$');
% set(hh,'Interpreter','latex');
% hx = xlabel('Time(s)');
% set(hx,'Interpreter','latex');
% 
% subplot(2,2,4)
% plot(State1.Time,State1.Data(:,4)-ObSta1.Data(:,4))
% axis([0,Tend,-0.1,0.1])
% hh = legend('$\epsilon_{4}$');
% set(hh,'Interpreter','latex');
% hx = xlabel('Time(s)');
% set(hx,'Interpreter','latex');
% 
% suptitle('Adaptive Gain Observer Error under Controller')
% %% Observing Error of High Gain
% 
% %%
% figure(2)
% subplot(2,2,1)
% plot(State1.Time,State1.Data(:,1),State1.Time,ObSta1.Data(:,1))
% hh = legend('$x_{1}$','$\hat{x}_{1}$');
% set(hh,'Interpreter','latex');
% hx = xlabel('Time(s)');
% set(hx,'Interpreter','latex');
% 
% subplot(2,2,2)
% plot(State1.Time,State1.Data(:,2),State1.Time,ObSta1.Data(:,2))
% hh = legend('$x_{2}$','$\hat{x}_{2}$');
% set(hh,'Interpreter','latex');
% hx = xlabel('Time(s)');
% set(hx,'Interpreter','latex');
% 
% subplot(2,2,3)
% plot(State1.Time,State1.Data(:,3),State1.Time,ObSta1.Data(:,3))
% hh = legend('$x_{3}$','$\hat{x}_{3}$');
% set(hh,'Interpreter','latex');
% hx = xlabel('Time(s)');
% set(hx,'Interpreter','latex');
% 
% subplot(2,2,4)
% plot(State1.Time,State1.Data(:,4),State1.Time,ObSta1.Data(:,4))
% hh = legend('$x_{4}$','$\hat{x}_{4}$');
% set(hh,'Interpreter','latex');
% hx = xlabel('Time(s)');
% set(hx,'Interpreter','latex');
% 
% suptitle('Adaptive Gain Observer under Controller')
% 
% %% ControlInput under Small Observer Gain
% figure(3)
% plot(ControlInput1.Time,ControlInput1.Data(:,1),'-',ControlInput1.Time,ControlInput1.Data(:,2),'-.')
% hh = legend('$u_{1}$','$u_{2}$');
% set(hh,'Interpreter','latex');
% hx = xlabel('Time(s)');
% set(hx,'Interpreter','latex');
% axis([0,Tend,-50,50]);
% 
% suptitle('Control Input with Adaptive Observer Observer') 
% %% Windows Statis Data 
% figure(4)
% subplot(2,1,1)
% plot(StatisData.Time,StatisData.Data(:,1),'-',StatisData.Time,StatisData.Data(:,2),'-.')
% hh = legend('Windowed Mean Value $x_{1}$','Windowed Mean Value $x_{2}$');
% set(hh,'Interpreter','latex');
% hx = xlabel('Time(s)');
% set(hx,'Interpreter','latex');
% axis([0,Tend,-.00001,.00002]);
% 
% 
% subplot(2,1,2)
% plot(StatisData.Time,StatisData.Data(:,3),'-',StatisData.Time,StatisData.Data(:,4),'-.')
% hh = legend('Windowed Std Value $x_{1}$','Windowed Std Value $x_{2}$');
% set(hh,'Interpreter','latex');
% hx = xlabel('Time(s)');
% set(hx,'Interpreter','latex');
% axis([0,Tend,-.00001,.00002]);