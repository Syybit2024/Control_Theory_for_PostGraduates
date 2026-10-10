function [sys,x0,str,ts]=T20201214Robotics(t,x,u,flag)
switch flag,
%Initialization
case 0,
    [sys,x0,str,ts]=mdlInitializeSizes;
case 1,
    sys=mdlDerivatives(t,x,u);
%Outputs
  case 3,
    sys=mdlOutputs(t,x,u);
%Unhandled flags
  case {2, 4, 9 }
    sys = [];
%Unexpected flags
  otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end

function [sys,x0,str,ts]=mdlInitializeSizes
 
sizes = simsizes;
sizes.NumContStates  = 3;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 3;
sizes.NumInputs      = 1;
sizes.DirFeedthrough = 0;
sizes.NumSampleTimes = 1;
sys=simsizes(sizes);
x0=[1 -6.5 0];
% x0=[0 0 0];
str=[];
ts=[-1 0];

function [sys,x0,str,ts]=mdlDerivatives(t,x,u)
Dx1 = x(2);
Dx2 = -40.69*sin(x(1))-0.1*x(2)+8.996*x(3);
Dx3 = -28.89*x(2)-722.2*x(3)+555.5*u;
 

sys= [Dx1; Dx2; Dx3];

function [sys,x0,str,ts]=mdlOutputs(t,x,u)
sys(1)  = x(1);
sys(2)  = x(2);
sys(3)  = x(3);
 