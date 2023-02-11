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
A1 = (A+B+H);
A2 = (B+C+H);
s = (C+D+H)/30;
fs = 8000;
f = 400; 
t = 0:1/fs:1-1/fs;
powfund = (A1^2)/2+(A2^2)/2;
varnoise = s^2;
x = A1*sin(2*pi*(C+D+H)*100*t) + A2*cos(2*pi*(D+E+H)*100*t);
noise = s*randn(size(t));
noisySignal = x + noise;
SNR = snr(x, noise)
defSNR = 10*log10(powfund/varnoise)
