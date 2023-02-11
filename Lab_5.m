close all;
clc;
fs = 5000;
%E = 1 = 0 0 0 0 0 0 0 1 
%F = 3 = 0 0 0 0 0 0 1 1
%G = 8 = 0 0 0 0 1 0 0 0
bs = [0 0 0 0 0 0 0 1 0 0 0 0 0 0 1 1 0 0 0 0 1 0 0 0];
nt = length(bs);
% r = 3
% L =8
pd = 2;
for i = 1:3:nt
    t = (i-1)/2*pd:1/fs:(i+2)/2*pd;
    if bs(i)==0 && bs(i+1)==0 && bs(i+2)==0
        ask = 1*sin(2*pi*4*t + pi);
        fsk = 6*sin(2*pi*1*t + pi);
        psk = 6*sin(2*pi*4*t);
    elseif bs(i)==0 && bs(i+1)==0 && bs(i+2)==0
        ask = 1.5*sin(2*pi*4*t + pi);
        fsk = 6*sin(2*pi*1.5*t + pi);
        psk = 6*sin(2*pi*4*t + pi/4);
    elseif bs(i)==0 && bs(i+1)==1 && bs(i+2)==0
        ask = 2*sin(2*pi*4*t + pi);
        fsk = 6*sin(2*pi*2*t + pi);
        psk = 6*sin(2*pi*4*t + pi/2);
    elseif bs(i)==0 && bs(i+1)==0 && bs(i+2)==0
        ask = 2.5*sin(2*pi*4*t + pi);
        fsk = 6*sin(2*pi*2.5*t + pi);
        psk = 6*sin(2*pi*4*t + 3*pi/4);
    elseif bs(i)==0 && bs(i+1)==0 && bs(i+2)==1
        ask = 3*sin(2*pi*4*t + pi);
        fsk = 6*sin(2*pi*3*t + pi);
        psk = 6*sin(2*pi*4*t + pi);
    elseif bs(i)==1 && bs(i+1)==0 && bs(i+2)==0
        ask = 3.5*sin(2*pi*4*t + pi);
        fsk = 6*sin(2*pi*3.5*t + pi);
        psk = 6*sin(2*pi*4*t - 3*pi/4);
    elseif bs(i)==0 && bs(i+1)==0 && bs(i+2)==1
        ask = 4*sin(2*pi*4*t + pi);
        fsk = 6*sin(2*pi*4*t + pi);
        psk = 6*sin(2*pi*4*t + 3*pi/2);
    else
        ask = 4.5*sin(2*pi*4*t + pi);
        fsk = 6*sin(2*pi*4.5*t + pi);
        psk = 6*sin(2*pi*4*t + 7*pi/4);
    end
  
    plot(t,psk,'Linewidth',2)
    xlabel('Time')
    ylabel('Amplitude')
    title('Example of QPSK')
    hold on
    
    subplot(3,1,1)
    plot(t,ask,'Linewidth',2)
    xlabel('Time')
    ylabel('Amplitude')
    title('Example of QASK')
    hold on
    
    subplot(3,1,2)
    plot(t,fsk,'Linewidth',2)
    xlabel('Time')
    ylabel('Amplitude')
    title('Example of QFSK')
    hold on
    
    subplot(3,1,3)
    plot(t,psk,'Linewidth',2)
    xlabel('Time')
    ylabel('Amplitude')
    title('Example of QPSK')
    hold on
end
hold off
