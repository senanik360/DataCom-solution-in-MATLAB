close all;
clc;
A = 2; 
B = 0; 
C = 4; 
D = 2; 
E = 1; 
F = 3; 
G = 8; 
H = 1;
a1 = G+3;
a2 = G+5;
a3 = G+4;
f1 = G+1;
f2 = G+9;
f3 = G+7;
L1 = 6;
L2 = 14;
fs = 700;
t = 0:1/fs:0.06;
bits = 3;
sig_ct = a1*sin(2*pi*f1*t) + a2*cos(2*pi*f2*t + pi/6) + a3*cos(2*pi*f3*t)
delta=(max(sig_ct)-min(sig_ct))/(L1-1);
sig_ctq = min(sig_ct)+(round((sig_ct-min(sig_ct))/delta)).*delta;
plot(t,sig_ct,'*', 'linewidth',1.5);
hold on;
plot(t,sig_ctq,'x', 'linewidth',1.5);
xlabel('time')
ylabel('amplitude')
title('manual quantization')
legend('Original signal','quantized signal')