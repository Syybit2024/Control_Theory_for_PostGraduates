clc;
close all;
clear all;

s = tf('s');
G = 1/(s*(s+1)*(s+2));

a1 = 0.5;  % Lead
a2 = 2.5;  % Lag Delay
T  = 0.1;

Gle = (s+1/T)/(s+1/(T*a1));
Gla = (s+1/T)/(s+1/(T*a2));

G1 = G*Gle;
G2 = G*Gla;

figure;
rlocus(Gle,'g-',Gla,'b--');
hh = legend('$$Lead$$','$$Lag$$');
set(hh,'Interpreter','latex'); 

figure;
step(Gle,'g-.',Gla,'b--');
hh = legend('$$Lead$$','$$Lag$$');
set(hh,'Interpreter','latex'); 

figure;
rlocus(G,'r-',G1,'g-.',G2,'b--');
hh = legend('$${G_1}$$','$${G}_{2}$$','$${G}_{3}$$');
set(hh,'Interpreter','latex'); 
 

K = 1;
H  = feedback(G,K);
H1 = feedback(G1,K);
H2 = feedback(G2,K);

figure;
step(H,'r-',H1,'g-.',H2,'b--');
hh = legend('$${G_1}$$','$${G}_{2}$$','$${G}_{3}$$');
set(hh,'Interpreter','latex'); 

figure;
bode(H,'r-',H1,'g-.',H2,'b--');
hh = legend('$${G_1}$$','$${G}_{2}$$','$${G}_{3}$$');
set(hh,'Interpreter','latex'); 

figure;
nyquist(H,'r-',H1,'g-.',H2,'b--');
hh = legend('$${G_1}$$','$${G}_{2}$$','$${G}_{3}$$');
set(hh,'Interpreter','latex'); 