clc;
clear all;
close all;
dat  = load('Data.mat','ans');
dat2 = load('Data2.mat','ans');
dat3 = load('Data3.mat','ans');
dat4 = load('Data4.mat','ans');


%% Original Controlinput
figure
subplot(2,1,1)
plot(dat.ans.time,dat.ans.data(:,2),'-')
legend('Control Input u(t)') 

subplot(2,1,2)
plot(dat.ans.time,dat.ans.data(:,1)-dat.ans.data(:,3),'--')
legend('Tracking Performance  y(t)- r(t)') 
  axis([1 10 -1.5 .5])

suptitle('Impulsive Control and The Tracking Performance')
%% PI-D
figure
subplot(2,1,1)
plot(dat2.ans.time,dat2.ans.data(:,2),'-')
legend('Control Input u(t)') 

subplot(2,1,2)
plot(dat2.ans.time,dat2.ans.data(:,1),'-')
legend('Output y(t)') 
   
suptitle('PI-D Controller and Performance ')
%% I-PD
figure
subplot(2,1,1)
plot(dat3.ans.time,dat3.ans.data(:,2),'-')
legend('Control Input u(t)') 

subplot(2,1,2)
plot(dat3.ans.time,dat3.ans.data(:,1),'-')
legend('Output y(t)') 
   
suptitle('I-PD Controller and Performance ')


%% LPF Reference
figure
subplot(2,1,1)
plot(dat4.ans.time,dat4.ans.data(:,2),'-')
legend('Control Input u(t)') 

subplot(2,1,2)
plot(dat4.ans.time,dat4.ans.data(:,1),'-')
legend('Output y(t)') 
   
suptitle('LPF Reference based Controller and Performance ')

figure
plot(dat4.ans.time,dat4.ans.data(:,4),'-',dat4.ans.time,dat4.ans.data(:,3),'-.')
legend('Original reference r(t)','LPF reference r(t) ') 
title('The Original and LPF  References')

axis([0 10 -0.2 1.2])
 
% figure
% plot(dat.ans.time,dat.ans.data(:,2),'-.')
% legend('Control Input u(t)') 
% title('Tracking Error with Direct Derivative') 
 

% figure
% plot(dat.ans.time,dat.ans.data(:,1)-dat.ans.data(:,4),'-.')
% legend('Error e(t)') 
% title('Tracking Error with Modified Derivative') 
 
