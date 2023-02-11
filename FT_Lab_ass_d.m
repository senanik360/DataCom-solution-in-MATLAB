clc;
%Channel Noise%
t4=bp/50:bp/50:bp*length(x);
Rec=awgn(m,15);
figure
subplot(2,1,1);
plot(t4,Rec);
axis([ 0 bp*length(x) -50 50]);
xlabel('Time(sec)');
ylabel('Amplitude(volt)');
title('Received Signal at Receiver');