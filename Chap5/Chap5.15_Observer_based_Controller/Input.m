function [sys,x0,str,ts]= Input(t,x,u,flag)

switch flag,
%Initialization
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
% case 1,
%     sys=mdlDerivatives(t,x,u);
case 3,
    sys=mdlOutputs(t,u);
%Unhandled flags
case { 2, 4, 9 }
    sys = [];
%Unexpected flags
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end

function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumOutputs     = 1;
sizes.NumInputs      = 0;
sizes.DirFeedthrough = -1;
sizes.NumSampleTimes = 1;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [-1 0];


function sys=mdlOutputs(t,u)
sys= sin(20*t);
 