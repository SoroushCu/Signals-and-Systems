clc
clear all
ecg_data = load('ecg.dat');
fs = 500;
T = 1/fs;
ecg_data_short = ecg_data(1:5*fs);
t = 0+T:T:5;
ecg_highpassed = (fs/2)*filter([1,0,-1], [1], ecg_data_short);
plot(t, ecg_highpassed,'r');
title('ecg-highpassed')
xlabel('Time(s)') 
ylabel('ECG') 

