clc;
clear all;
close all;
dat=load('Data.mat','ans');

figure
plot(dat.ans.time,dat.ans.data(:,1)-dat.ans.data(:,2),'-.')
legend('Error e(t)') 
title('Ideal Tracking Error')
 
 
figure
plot(dat.ans.time,dat.ans.data(:,1)-dat.ans.data(:,3),'-.')
legend('Error e(t)') 
title('Tracking Error with Direct Derivative') 
 

figure
plot(dat.ans.time,dat.ans.data(:,1)-dat.ans.data(:,4),'-.')
legend('Error e(t)') 
title('Tracking Error with Modified Derivative') 
 
