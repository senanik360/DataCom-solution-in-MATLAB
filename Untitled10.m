clc;
clear all;
close all;
Transmitted_Message= '3Ao6'
%Converting Information Message to bit%
x=asc2bn(Transmitted_Message); % Binary Information
disp(' Binary information at Transmitter :');
disp(x);
%%%%%%%%B%%%%%%%
clc;
G=8;
br=(G+2)*10;
bp=1/br;
bit=[];
for n=1:2:length(x)
if x(n)==0&&x(n+1)==0;
se=0*zeros(1,100);
elseif x(n)==0&&x(n+1)==1
se=(G+5)*ones(1,100);
elseif x(n)==1&&x(n+1)==0
se=(2*(G+5))*ones(1,100);
else
se=(3*(G+5))*ones(1,100);
end
bit=[bit se];
end
t1=bp/50:bp/50:50*length(x)*(bp/50);
figure;
subplot(3,1,1);
plot(t1,bit,'lineWidth',2.5);
grid on;
axis([ 0 bp*length(x) -5 20]);
ylabel('Amplitude(Volt)');
xlabel(' Time(Sec)');
title('Transmitting information as Digital Signal');
%%%%%c%%%%%
G = 3;
a1 = 0;
a2 = (G+5);
a3 = 2*(G+5);
a4 = 3*(G+5);
br = (G+2)*10;
bp = 1/br;
f=br*((G+2)*100);
t2=bp/100:bp/100:bp;
ss=length(t2);
m=[];
for i=1:2:length(x)
if (x(i)==0&&x(i+1)==0)
y=a1*cos(2*pi*f*t2);
elseif (x(i)==0&&x(i+1)==1)
y=a2*cos(2*pi*f*t2);
elseif (x(i)==1&&x(i+1)==0)
y=a3*cos(2*pi*f*t2);
else
y=a4*cos(2*pi*f*t2);
end
m=[m y];
end
t3=bp/50:bp/50:bp*length(x);
figure;
subplot(3,1,1);
plot(t3,m);
axis([ 0 bp*length(x) -20 20]);
xlabel('Time(Sec)');
ylabel('Amplitude(Volt)');
title('Modulated Signal at Transmitter');
%%%%%D%%%%%
clc;
%Channel Noise%
t4=bp/50:bp/50:bp*length(x);
Rec=awgn(m,15);
figure
subplot(2,1,1);
plot(t4,Rec);
axis([ 0 bp*length(x) -20 20]);
xlabel('Time(sec)');
ylabel('Amplitude(volt)');
title('Received Signal at Receiver');
%%%%%E%%%%%
clc;
mn=[];
for n=ss:ss:length(Rec)
t=bp/100:bp/100:bp;
y=cos(2*pi*f*t); % carrier signal
mm=y.*Rec((n-(ss-1)):n);
t5=bp/100:bp/100:bp;
z=trapz(t5,mm) ; % intregation
zz=round((1*z/bp));
if(zz<=(a1+a2)/2)
a=0;
a1=0;
elseif(zz>(a1+a2)/2 && zz<=(a2+a3)/2)%logic level
a=0;
a1=1;
elseif(zz>(a2+a3)/2 && zz<= (a3+a4)/2)%logic level
a=1;
a1=0;
else
a=1;
a1=1;
end
mn=[mn a a1];
end
disp(' Recover the bit sequence from the Received Noisy Signal :');
disp(mn);
%%%%%F%%%%%
clc;
brN=(G+50)*200;
bpN=1/brN;
bit=[];
for n=1:2:length(mn)
if mn(n)==0&&mn(n+1)==0;
se=0*zeros(1,100);
elseif mn(n)==0&&mn(n+1)==1
se=(G+5)*ones(1,100);
elseif mn(n)==1&&mn(n+1)==0
se=(2*(G+5))*ones(1,100);
else
se=(3*(G+5))*ones(1,100);
end
bit=[bit se];
end
t5=bpN/50:bpN/50:50*length(mn)*(bpN/50);
figure;
subplot(3,1,1)
plot(t5,bit,'lineWidth',2.5);
grid on;
axis([ 0 bpN*length(mn) -5 10]);
ylabel('Amplitude(Volt)');
xlabel(' Time(Sec)');
title('Demodulated Signal at Receiver');
%%%%%%%G%%%%%%
clc;
%Converting bit to text%

%Converting bit to text%
Message = bin2asc(mn);
disp(' Regenerated text Mesaage :');
disp(Message);