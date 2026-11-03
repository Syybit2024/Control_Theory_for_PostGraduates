clc
clear all
close all
MaxKp=5;    MinKp=0;   StepKp=0.5;
MaxKi=10;   MinKi=0;   StepKi=1;
MaxKd=4;    MinKd=0;   StepKd=0.5;
Ikp= (MaxKp-MinKp)/StepKp+1;
Iki= (MaxKi-MinKi)/StepKi+1;
Ikd= (MaxKd-MinKd)/StepKd+1;

Kp=  MinKp:StepKp:MaxKp;
Ki=  MinKi:StepKi:MaxKi;
Kd=  MinKd:StepKd:MaxKd;
 
% Evaluate closed-loop unit-step response at each 'K' and 'a' combination
% that will yield the maximum overshoot less than 10%
t = 0:0.01:5;
g = tf([1.2],[0.36 1.86 2.5 1]);
k = 0;
for i = 1:Ikp;
 for j = 1:Iki;
     for z=1:Ikd;
      gc = tf( [Kd(z) Kp(i) Ki(j)], [1 0]); % controller
      G = gc*g/(1 + gc*g);                    % closed-loop transfer function
      y = step(G,t);
      m = max(y);                             % not proper for all overshot calculation
 if m < 1.05 & m >1.04
   k = k+1;
   solution(k,:) = [Kd(z) Kp(i) Ki(j) m];
 end
     end
  end
end
k
Sort_Solution=sortrows(solution,3);




 
figure;
for(i=1:k)
Kd(i)=Sort_Solution(i,1);
Kp(i)=Sort_Solution(i,2);
Ki(i)=Sort_Solution(i,3);
gc   =tf([Kd(i) Kp(i) Ki(i)], [1 0]);
G    = gc*g/(1+gc*g);
step(G,t);
hold on
end

% legend(['K=',num2str(K(1)),',a=',num2str(a(1))],...
%        ['K=',num2str(K(2)),',a=',num2str(a(2))],...
%        ['K=',num2str(K(3)),',a=',num2str(a(3))],...
%        ['K=',num2str(K(4)),',a=',num2str(a(4))],...
%        ['K=',num2str(K(5)),',a=',num2str(a(5))]);

% K=Sort_Solution(k-1,1);
% a=Sort_Solution(k-1,2);
% 
% hold on 
% step(G,t)
% legend(['K=',num2str(K),',a=',num2str(a)]);

