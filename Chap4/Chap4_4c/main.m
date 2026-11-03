clear all;
close all;
K_pid0=[0 0 0];
LB=[0 0 0];
UB=[100 100 100];
K_pid = lsqnonlin('plant',K_pid0,LB,UB)  %求解非线性最小二乘（非线性数据拟合）问题
sim('chapsim')

% 1.3132    0.0046    0.1637