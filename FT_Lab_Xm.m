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
%% Message Signal Generation
fs = 4001;
t = 0:1/fs:1-1/fs;
a1 = F+4; 
f1 = (G+3);
s1 = a1*cos(2*pi*f1*t); 
a2 = F+2; 
f2 = (G+5); 
s2 = a2*cos(2*pi*f2*t); 
a3 = F+3;
f3 = (G+4); 
s3 = a3*cos(2*pi*f3*t); 
%% Carrier Signal Generation
Cm1 = 1; 
fc1 = 810; 
c1 = Cm1*cos(2*pi*fc1*t);
Cm2 = 1; 
fc2 = 1125;
c2 = Cm2*cos(2*pi*fc2*t); 
Cm3 = 1; 
fc3 = 1440; 
c3 = Cm3*cos(2*pi*fc3*t); 
%%
%% Multiplexed Signal Generation
x = (s1).*c1+(s2).*c2+(s3).*c3;
%%%% Plotting the Signals in Time-Domain and Frequency-Domain
figure
subplot(3,1,1)
plot(t,s1)
xlabel('Time')
ylabel('Amplitude')
title('s1 in Time Domain')
ylim([-a1 a1])
subplot(3,1,2)
plot(t,s2)
xlabel('Time')
ylabel('Amplitude')
title('s2 in Time Domain')
ylim([-a2 a2])
subplot(3,1,3)
plot(t,s3)
xlabel('Time')
ylabel('Amplitude')
title('s3 in Time Domain')
ylim([-a3 a3])
M1 = abs(fftshift(fft(s1)))/(fs/2); %Fourier Transformation of s1
M2 = abs(fftshift(fft(s2)))/(fs/2); %Fourier Transformation of s2
M3 = abs(fftshift(fft(s3)))/(fs/2); %Fourier Transformation of s3
X = abs(fftshift(fft(x)))/(fs/2); %Fourier Transformation of x
f = fs/2*linspace(-1,1,fs);
figure
subplot(3,1,1)
stem(f,M1)
xlabel('Frequency')
ylabel('Amplitude')
title('s1 in Frequency Domain')
axis([-20 20 0 10])
subplot(4,1,2)
stem(f,M2)
xlabel('Frequency')
ylabel('Amplitude')
title('s2 in Frequency Domain')
axis([-20 20 0 10])
subplot(4,1,3)
stem(f,M3)
xlabel('Frequency')
ylabel('Amplitude')
title('s3 in Frequency Domain')
axis([-20 20 0 10])
figure
subplot(2,1,1)
plot(t,x)
xlabel('Time')
ylabel('Amplitude')
title('Multiplexed Signal in Time Domain')
subplot(2,1,2)
stem(f,X)
xlabel('Frequency')
ylabel('Amplitude')
title('Multiplexed Signal in Frequency Domain')
axis([-1500 1500 0 5])
%%
%% Passing the Multiplexed Signal Through Bandpass Filter
[num1, den1] = butter(5, [(fc1-f1-6)/(fs/2),(fc1+f1+6)/(fs/2)]);
%Butterworth Filter Window Determining for Bandpass Filter
bpf1 = filter(num1,den1,x); %Filtering is done here
[num2, den2] = butter(5, [(fc2-f2-6)/(fs/2),(fc2+f2+6)/(fs/2)]);
%Butterworth Filter Window Determining for Bandpass Filter
bpf2 = filter(num2,den2,x); %Filtering is done here
[num3, den3] = butter(5, [(fc3-f3-6)/(fs/2),(fc3+f3+6)/(fs/2)]);
%Butterworth Filter Window Determining for Bandpass Filter
bpf3 = filter(num3,den3,x); %Filtering is done here
%%
%% Mixing
z1 = 2*bpf1.*c1;
z2 = 2*bpf2.*c2;
z3 = 2*bpf3.*c3;
%%
%% Passing the Mixed Signals Through Lowpass Filter
[num4, den4] = butter(5, f1/(fs/2)); %Low pass filter is made here
rec1 = filter(num4,den4,z1); %Filtering is done here
[num5, den5] = butter(5, f2/(fs/2)); %Low pass filter is made here
rec2 = filter(num5,den5,z2); %Filtering is done here
[num6, den6] = butter(5, f3/(fs/2)); %Low pass filter is made here
rec3 = filter(num6,den6,z3); %Filtering is done here
%%
%% Plotting the Received Signals in Time-Domain and Frequency Domain
figure
subplot(3,1,1)
plot(t,rec1)
xlabel('Time')
ylabel('Amplitude')
title('Recovered signal 1 in time domain')
ylim([-a1 a1])
subplot(3,1,2)
plot(t,rec2)
xlabel('Time')
ylabel('Amplitude')
title('Recovered signal 2 in time domain')
ylim([-a2 a2])
subplot(3,1,3)
plot(t,rec3)
xlabel('Time')
ylabel('Amplitude')
title('Recovered signal 3 in time domain')
ylim([-a3 a3])
R1 = abs(fftshift(fft(rec1)))/(fs/2); 
R2 = abs(fftshift(fft(rec2)))/(fs/2); 
R3 = abs(fftshift(fft(rec3)))/(fs/2); 
figure
subplot(3,1,1)
stem(f,R1)
xlabel('Frequnecy')
ylabel('Amplitude')
title('Recovered signal 1 in frequnecy domain')
axis([-20 20 0 5])
subplot(3,1,2)
stem(f,R2)
xlabel('Frequnecy')
ylabel('Amplitude')
title('Recovered signal 2 in frequnecy domain')
axis([-20 20 0 5])
subplot(3,1,3)
stem(f,R3)
xlabel('Frequnecy')
ylabel('Amplitude')
title('Recovered signal 3 in frequnecy domain')
axis([-20 20 0 5])
%% End