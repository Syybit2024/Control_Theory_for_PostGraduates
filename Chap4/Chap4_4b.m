clc
clear all
close all
K = 2:0.2:3;
a = 0.5:0.2:1.5;
% Evaluate closed-loop unit-step response at each 'K' and 'a' combination
% that will yield the maximum overshoot less than 10%
t = 0:0.01:5;
g = tf([1.2],[0.36 1.86 2.5 1]);
k = 0;
for i = 1:6;
for j = 1:6;
gc = tf(K(i)*[1 2*a(j) a(j)^2], [1 0]); % controller
G = gc*g/(1 + gc*g);                    % closed-loop transfer function
y = step(G,t);
m = max(y);                             % not proper for all overshot calculation
if m < 1.10 & m >1
k = k+1;
solution(k,:) = [K(i) a(j) m];
end
end
end
k
Sort_Solution=sortrows(solution,3);




 
figure;
for(i=1:k)
K(i)=Sort_Solution(i,1);
a(i)=Sort_Solution(i,2);
gc   =tf(K(i)*[1 2*a(i) a(i)^2],[1 0])
G    = gc*g/(1+gc*g);
step(G,t);
hold on
end

legend(['K=',num2str(K(1)),',a=',num2str(a(1))],...
       ['K=',num2str(K(2)),',a=',num2str(a(2))],...
       ['K=',num2str(K(3)),',a=',num2str(a(3))],...
       ['K=',num2str(K(4)),',a=',num2str(a(4))],...
       ['K=',num2str(K(5)),',a=',num2str(a(5))]);

% K=Sort_Solution(k-1,1);
% a=Sort_Solution(k-1,2);
% 
% hold on 
% step(G,t)
% legend(['K=',num2str(K),',a=',num2str(a)]);

