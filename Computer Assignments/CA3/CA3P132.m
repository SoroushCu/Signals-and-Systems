clc
clear all
ecg_data = load('ecg.dat');
fs = 500;
T = 1/fs;
ecg_data_short = ecg_data(1:5*fs);
t = 0+T:T:5;
ecg_highpassed = (fs/2)*filter([1,0,-1], [1], ecg_data_short);
fc = 70;
wn = fc/(fs/2);
n = 8;
[b, a] = butter(n, wn,'low');
ecg_lp = filter(b, a, ecg_highpassed);
plot(t, ecg_lp,'r');
title('ecg-lp')
xlabel('Time(s)') 
ylabel('ECG') 