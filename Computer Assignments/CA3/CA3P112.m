clc
clear all
ecg_data = load('ecg.dat');
fs = 500;
T = 1/fs;
ecg_data_short = ecg_data(1:5*fs);
t = 0+T:T:5;
f=linspace(-fs/2,fs/2,numel(ecg_data_short));
y = fft(ecg_data_short);
yshift=fftshift(y);
plot(f,abs(yshift)/250,'g');
    xlabel('Frequency')
    ylabel('Amplitude')
 title('ECG-Short')
