clc;
clear all;
n=0:999;
fs=8192;
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
StID=[8,1,0,1,9,8,4,7,2];
space=zeros(1,100);
Nber=[Key(StID(1)+1,:),space,Key(StID(2)+1,:),space,Key(StID(3)+1,:),space,Key(StID(4)+1,:),space,Key(StID(5)+1,:),space,Key(StID(6)+1,:),space,Key(StID(7)+1,:),space,Key(StID(8)+1,:),space,Key(StID(9)+1,:),space];
Encrypted=csvread('phone.csv');
space=zeros(1,100);
Encrypted2=[Encrypted,space];
Decrypter=zeros(length(Encrypted2)/1100,1000);
Decrypter2=zeros(length(Nber)/1100,1000);
i=1;
q=1;
z=1;
PNumber=[0,0,0,0,0,0,0];
SIDNumber=[0,0,0,0,0,0,0,0,0];
while i<=7
    Decrypter(i,:)=Encrypted2(((i-1)*1100)+1:(1100*(i-1))+1000);
    i=i+1;
end
while q<=9
    Decrypter2(q,:)=Nber(((q-1)*1100)+1:(1100*(q-1))+1000);
    q=q+1;
end
for j=1:7
    for k=1:10
        if(corrcoef(Decrypter(j,:),Key(k,:))>0.9)
            PNumber(j)=k-1;
        end
    end
end
for f=1:9
    for k=1:10
        if(corrcoef(Decrypter2(f,:),Key(k,:))>0.9)
             SIDNumber(f)=k-1;
        end
    end
end
while z<=7
   [Decrypterf,trash,f]=my_fft_full(Decrypter(z,:),fs);
   subplot(5,2,z);
   plot(f,Decrypterf,'g')
   title(['NO',num2str(z)]);
   z=z+1;
end

fprintf('The Phone Number is\n');
disp(PNumber)
fprintf('My student number is\n');
disp(SIDNumber)