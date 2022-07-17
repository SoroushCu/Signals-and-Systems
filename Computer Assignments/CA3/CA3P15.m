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

f_line = 50;
c = [1, (-2)*cos(2*pi*f_line/fs), 1];
d = [1];
ecg_filtered = filter(c, d, ecg_lp);
[cor, lag] = xcorr(ecg_filtered);
figure
plot(lag,cor)
title('Auto-correlation function of filtered ECG')
xlabel('samples')