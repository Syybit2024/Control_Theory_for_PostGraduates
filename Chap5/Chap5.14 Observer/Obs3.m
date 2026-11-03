function [sys,x0,str,ts]= Obs3(t,x,u,flag)

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
sizes.NumInputs      = 3;
sizes.DirFeedthrough = -1;
sizes.NumSampleTimes = 1;
sys=simsizes(sizes);
x0= [0 0 0];
str=[];
ts=[-1 0];

function sys=mdlDerivatives(t,x,u)
global A B L3 C

y   = [u(1); u(2)];
Uin = [u(3)];

sys    =  A*x+ B*Uin+ L3*(y-C*x);
 

function sys=mdlOutputs(t,x,u)
sys=x;


