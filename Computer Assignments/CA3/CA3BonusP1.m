clc
clear all
[y,Fs] = audioread('tel.wav');
X=zeros(50,length(y)-49);
Xf=zeros(50,length(y)-49);
for k=1:length(y)-49
    X(:,k)=y(k:50+k-1);
end
i=1;
while i<=length(y)-49
    %Xf(:,i)=fftshift(fft(X(:,i)))/length(X(:,i));
    [Xf(:,i),trash,f]=my_fft_full(X(:,i),Fs);
    i=i+1;
end
colormap hot
imagesc(Xf)
%spectrogram(y,50,'yaxis')