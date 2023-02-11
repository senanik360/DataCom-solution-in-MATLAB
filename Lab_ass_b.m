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
a1 = G+2;
a2 = G+6;
a3 = G+4;
a4 = G+8;
f1 = G+5;
f2 = G+3;
f3 = G+9;
f4 = G+7;
L = 8; 
fs = 200; 
t = 0:1/fs:0.25; 
sig_ct = a1*sin(2*pi*f1*t) + a2*cos(2*pi*f2*t) + a3*cos(2*pi*f3*t) + a4*sin(2*pi*f4*t);
partition = [-7, -5, -3, -1 , 1, 3, 5, 7];
codebook = [-8, -6, -4, -2, 0, 2, 4, 6, 8];
[index,quants] = quantiz(sig_ct,partition,codebook);
figure
plot(t,sig_ct,'x',t,quants,'*', 'linewidth', 2)
xlabel('Time')
ylabel('Amplitude')
title('Uniform Quantization')
legend('Original signal','Quantized signal');
