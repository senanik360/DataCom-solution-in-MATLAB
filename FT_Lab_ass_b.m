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
axis([ 0 bp*length(x) -5 50]);
ylabel('Amplitude(Volt)');
xlabel(' Time(Sec)');
title('Transmitting information as Digital Signal');