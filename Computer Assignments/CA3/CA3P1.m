clc
clear all
ecg_data = load('ecg.dat');
fs = 500;
T = 1/fs;
ecg_data_short = ecg_data(1:5*fs);
t = 0+T:T:5;
plot(t, ecg_data_short,'r');
title('ecg-data-short')
xlabel('Time(s)') 
ylabel('ECG') 

