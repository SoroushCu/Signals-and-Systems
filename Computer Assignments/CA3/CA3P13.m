clc
clear all
fs = 500;
fc = 100;
f=linspace(0,fs/2,10000);
N = input('Enter N : ');
FreqAns = sqrt(1./(1+(2*pi.*f./(1i*fc)).^(2*N)));
plot(f,FreqAns,'b');
    xlabel('Frequency')
    ylabel('Amplitude')
 title('Frequency Response')