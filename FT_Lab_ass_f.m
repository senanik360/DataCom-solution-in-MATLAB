clc;
brK=(G+50)*200;
bpK=1/brK;
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
t5=bpK/50:bpK/50:50*length(mn)*(bpK/50);
figure;
subplot(3,1,1)
plot(t5,bit,'lineWidth',2.5);
grid on;
axis([ 0 bpK*length(mn) -5 20]);
ylabel('Amplitude(Volt)');
xlabel(' Time(Sec)');
title('Demodulated Signal at Receiver');