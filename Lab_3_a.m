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
L = (2^H)+2;
bit = 2; 
f = 50;
fs = 8000; 
t = 0:1/fs:0.01; 
y = (H+5)*cos(2*pi*((D+E+5)*10)*t) + (H+7)*sin(2*pi*((E+F+10)*10)*t);
Nsamples=length(y); 
quantised_out=zeros(1,Nsamples);
del=(max(y)-min(y))/(2^bit);
Llow = min(y) + del/2;
Lhigh = max(y) - del/2;
for i = Llow:del:Lhigh
for j=1:Nsamples
if(((i-del/2)<=y(j))&&(y(j)<=(i+del/2)))
quantised_out(j)=i;
end 
end 
end
plot(t,y,'*', 'linewidth',2);
hold on;
plot(t,quantised_out,'x', 'linewidth',2);
xlabel('Time')
ylabel('Amplitude')
title('Example of manual quantization method 1')
legend('Original Signal','Quantized Signal')