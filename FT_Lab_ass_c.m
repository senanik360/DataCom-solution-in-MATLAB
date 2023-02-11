G = 8;
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
axis([ 0 bp*length(x) -50 50]);
xlabel('Time(Sec)');
ylabel('Amplitude(Volt)');
title('Modulated Signal at Transmitter');
