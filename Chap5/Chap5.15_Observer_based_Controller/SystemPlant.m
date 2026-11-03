function [sys,x0,str,ts]=SystemPlant(t,x,u,flag)
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
x0=[-9 20 -6];
str=[];
ts=[-1 0];

function [sys,x0,str,ts]=mdlDerivatives(t,x,u)
global A B 
 
sys=A*x + B*u;

function [sys,x0,str,ts]=mdlOutputs(t,x,u)
sys(1)  = x(1);
sys(2)  = x(2);
sys(3)  = x(3);
 