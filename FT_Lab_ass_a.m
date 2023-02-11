clc;
clear all;
close all;
Transmitted_Message = '3Ao6'
%Converting Information Message to bit%
x=asc2bn(Transmitted_Message); % Binary Information
disp(' Binary information at Transmitter :');
disp(x);