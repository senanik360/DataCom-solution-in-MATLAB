close all
clc
A = 2;
B = 0;
C = 4;
D = 2;
E = 1;
F = 3;
G = 8;
H = 1;
f1 = (E+1);
f2 = (F+1);
f3 = (G+1);
p1 = (E+1);
p2 = (F+1);
p3 = (G+1);
sd = (H+1);
fs = 5000; % Sampling frequency
f = 400; %Hz
t = 0:1/fs:1-1/fs;
a = 3.0;
powfund = a^2/2
varnoise = sd^2;
sig = p1*sin(2*pi*f1*t) + p2*sin(2*pi*f2*t) + p3*sin(2*pi*f3*t);
noise = sd*randn(size(sig));
noisySignal = sig + noise;
SNR = snr(noisySignal) %Calculation of SNR using snr function
defSNR = 10*log10(powfund/varnoise) %Calculation of SNR following the definition