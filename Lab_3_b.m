%Code Snippet :
clc
close all
A = 2;
B = 0;
C = 4;
D = 2;
E = 1;
F = 3;
G = 8;
H = 1;
fs = 7000;
f = 50;
t = 0:1/fs:0.01;
x = (H+5)*cos(2*pi*((D+E+5)*10)*t) + (H+7)*sin(2*pi*((E+F+10)*10)*t);
bits = 4;
L = 12-(2^H);
delta=(max(x)-min(x))/(L-1);
xq = min(x)+(round((x-min(x))/delta)).*delta;
plot(t,x,'r-.', 'linewidth',1.5);
hold on;
plot(t,xq,'k-.', 'linewidth',1.5);
xlabel('Time')
ylabel('Amplitude')
title('Example of manual quantization method 2')
legend('Original Signal','Quantized Signal')