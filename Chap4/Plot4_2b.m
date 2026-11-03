clc;
clear all;
close all;
dat=load('Data.mat','ans');
figure
plot(dat.ans.time,dat.ans.data(:,1),'-.')
legend('y(t)')
title('Step Response of Open System')

figure
plot(dat.ans.time,dat.ans.data(:,2),'-.')
legend('y(t)') 
title('Step Response of Closed-loop System - Oscillation')
 
figure
plot(dat.ans.time,dat.ans.data(:,3),'-.')
legend('y(t)') 
title('Step Response of Closed-loop System - P Control Gain')

figure
plot(dat.ans.time,dat.ans.data(:,4),'-.')
legend('y(t)')
title('Step Response of Closed-loop System- PI Control Gain')

figure
plot(dat.ans.time,dat.ans.data(:,5),'-.')
legend('y(t)')
title('Step Response of Closed-loop System- PID Control Gain')
