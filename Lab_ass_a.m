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
fs = 3000; 
t = 0:1/fs:1;
nt = length(t);
sig_st = a1*sin(2*pi*f1*t);
sig_ct = a1*sin(2*pi*f1*t) + a2*cos(2*pi*f2*t) + a3*cos(2*pi*f3*t) + a4*sin(2*pi*f4*t);
f_sig_st = abs(fftshift(fft(sig_st)))/(nt/2);
f_sig_ct = abs(fftshift(fft(sig_ct)))/(nt/2);
freq = linspace( -fs/2, fs/2, nt);
plot(t, sig_st, 'linewidth', 2)
xlabel('Time in seconds');
ylabel('Amplitude in volts');
title('Simple Periodic Signal (Time Domain)');
figure
bar(freq, f_sig_st)
axis([-20 20 0 12])
xlabel('Frequency in Hz');
ylabel('Amplitude in volt');
title('Simple Periodic Signal (Frequency Domain)');
figure
plot(t, sig_ct, 'linewidth', 2)
xlabel('Time in seconds');
ylabel('Amplitude in volt');
title('Composite Periodic Signal (Time Domain)');
figure
bar(freq, f_sig_ct)
axis([-20 20 0 18])
xlabel('Frequency in Hz');
ylabel('Amplitude in volt');
title('Composite Periodic Signal (Frequency Domain)');