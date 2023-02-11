%Code Snippet :
clc
clear all
close all
A = 2;
B = 0;
C = 4;
D = 2;
E = 1;
F = 3;
G = 8;
H = 1;
a1 = A + C + 1;
a2 = A + D + 2;
a3 = A + E + 1;
f1 = A + E + 1;
f2 = A + D + 2;
f3 = A + C + 1;
fs = 250; % Sampling frequency
t = 0:1/fs:0.7; % Time duration = 1 s
f = 10;
x1 = a1*cos(2*pi*f1*t);
x2 = a2*sin(2*pi*f2*t);
x3 = a3*cos(2*pi*f3*t);
signal_x = x1 + x2 + x3;
partition = -3:3;
codebook = -4:3;
[index,quants] = quantiz(signal_x,partition,codebook); % Quantize.
figure
plot(t,signal_x,'x',t,quants,'*', 'linewidth', 2)
legend('Original Signal','Quantized Signal');