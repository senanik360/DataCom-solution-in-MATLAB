clc
clear all
close all
F= 3;
G= 5;
fs= 4243;
t= 0:1/fs:1-1/fs;
a1= F+4;
f1= G+3;
s1= a1*cos(2*pi*f1*t);
a2= F+2;
f2= G+5;
s2= a2*cos(2*pi*f2*t);
 
cm1= 1;
fc1= 420;
c1= cm1*cos(2*pi*fc1*t);
cm2=1;
fc2= 550;
c2= cm2*cos(2*pi*fc2*t);
x = (s1).*c1+(s2).*c2;
figure
subplot(2,1,1)
plot(t, s1)
xlabel('Time');
ylabel('Amplitude')
title('S1 in Time Domain');
ylim([-a1 a1]);
subplot(2,1, 2)
plot(t,s2)
xlabel('Time');
ylabel('Amplitude')
title('S2 in Time Domain');
ylim([-a2 a2])
M1 = abs(fftshift(fft(s1)))/(fs/2); 
M2 = abs(fftshift(fft(s2)))/(fs/2); 
X = abs(fftshift(fft(x)))/(fs/2);
f = fs/2*linspace(-1,1,fs);
figure
subplot(2,1,1)
stem(f,M1)
xlabel('frequency')
ylabel('amplitude')
title('Message Signal 1 in Frequency Domain')
axis([-17 17 0 9])
subplot(2,1,2)
stem(f,M2)
xlabel('frequency')
ylabel('amplitude')
title('Message Signal 2 in Frequency Domain')
axis([-17 17 0 7])
figure
subplot(2,1,1)
plot(t,x)
xlabel('time')
ylabel('amplitude')
title('Composite Signal in Time Domain')
subplot(2,1,2)
stem(f,X)
xlabel('frequency')
ylabel('amplitude')
title('Composite Signal in Frequency Domain')
axis([-770 770 0 9.5])
[num1, den1] = butter(5, [(fc1-f1-6)/(fs/2),(fc1+f1+6)/(fs/2)]);
bpf1 = filter(num1,den1,x);
[num2, den2] = butter(5, [(fc2-f2-6)/(fs/2),(fc2+f2+6)/(fs/2)]);
bpf2 = filter(num2,den2,x);
z1 = 2*bpf1.*c1;
z2 = 2*bpf2.*c2;
[num3, den5] = butter(5, (f1+3)/(fs/2));
rec1 = filter(num3,den5,z1); 
[num4, den4] = butter(5, (f2+3)/(fs/2)); 
rec2 = filter(num4,den4,z2);
figure
subplot(2,1,1)
plot(t,rec1)
xlabel('time')
ylabel('amplitude')
title('received signal 1 in time domain')
ylim([-a1 a1])
subplot(2,1,2)
plot(t,rec2)
xlabel('time')
ylabel('amplitude')
title('received signal 2 in time domain')
ylim([-a2 a2])
R1 = abs(fftshift(fft(rec1)))/(fs/2); 
R2 = abs(fftshift(fft(rec2)))/(fs/2);
figure
subplot(2,1,1)
stem(f,R1)
xlabel('frequnecy')
ylabel('amplitude')
title('received signal 1 in frequnecy domain')
axis([-17 17 0 9])
subplot(2,1,2)
stem(f,R2)
xlabel('frequnecy')
ylabel('amplitude')
title('received signal 2 in frequnecy domain')
axis([-17 17 0 7])