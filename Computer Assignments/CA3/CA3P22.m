clc;
clear all;
fs=8192;
n=0:999;
Key0=sin(0.7217*n)+sin(1.0247*n);
Key1=sin(0.5346*n)+sin(0.9273*n);
Key2=sin(0.5346*n)+sin(1.0247*n);
Key3=sin(0.5346*n)+sin(1.1328*n);
Key4=sin(0.5906*n)+sin(0.9273*n);
Key5=sin(0.5906*n)+sin(1.0247*n);
Key6=sin(0.5906*n)+sin(1.1328*n);
Key7=sin(0.6535*n)+sin(0.9273*n);
Key8=sin(0.6535*n)+sin(1.0247*n);
Key9=sin(0.6535*n)+sin(1.1328*n);
Key=[Key0;Key1;Key2;Key3;Key4;Key5;Key6;Key7;Key8;Key9];
i=1;
while i<=10
   [Keyf,trash,f]=my_fft_full(Key(i,:),fs);
   subplot(5,2,i);
   plot(f,Keyf,'r')
   title(num2str(i-1));
   i=i+1;
end
