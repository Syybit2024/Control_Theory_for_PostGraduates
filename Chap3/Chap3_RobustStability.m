clc
close all
clear all

m1 = ureal('m1', 1, 'percent', 20);
m2 = ureal('m2', 1, 'percent', 20);
k = ureal('k', 1, 'percent', 20);
s = zpk('s');
G1 = 1/(m1 * s^2);
G2 = 1/(m2 * s^2);
systemnames = 'G1 G2 k';
inputvar = '[u]';
outputvar = '[G2]';

input_to_G1 = '[u - k]';
input_to_G2 = '[k]';
input_to_k = '[G1 - G2]';
G = sysic; % builds uncertain subsystem
systemnames = 'G';
inputvar = '[d; n; r; u]';
outputvar = '[G + d - r; r - n - d - G]';
input_to_G = '[u]';
olic = sysic; % builds uncertain interconnection
% nominal stabilizing controller
K = 29.434 * (s + 0.2329) * (s^2 - 0.7687*s + 2.917) / (s + 9.843) / ...
(s + 2.227) / (s^2 + 1.81*s + 4.063);
clic = lft(olic, K);
cl0 = usubs(clic, 'm1', 1, 'm2', 1, 'k', 1); % nominal system
clr = usample(clic, 10); % some samples
max(real(eig(cl0)));
plot(squeeze(eig(clr)),'*');

figure;
step(clic)