%Generating a composite signal using three simple signals :
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
fs = 1000; % Sampling frequency
t = 0:1/fs:1; % Time duration = 1 s
nt = length(t);
x1 = a1*cos(2*pi*f1*t);
x2 = a2*sin(2*pi*f2*t);
x3 = a3*cos(2*pi*f3*t);
signal_x = x1 + x2 + x3;
f_signal_x = abs(fftshift(fft(signal_x)))/(nt/2);
freq = linspace( -fs/2, fs/2, nt);
subplot(2,1,1)
plot(t, signal_x, 'linewidth', 2)
xlabel('Time');
ylabel('Amplitude');
title('Time-Domain Representation of Composite Periodic Signal');
subplot(2,1,2)
bar(freq, f_signal_x)
xlim([-10 10])
xlabel('Frequency');
ylabel('Amplitude');
title('Frequency-Domain Representation of Composite Periodic Signal ');