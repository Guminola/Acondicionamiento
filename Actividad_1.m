Fs = 99;
Ts = 1/Fs;
t = Ts:Ts:3;
F1 = 2;
F2=Fs/8;
F3=Fs/4;
F4=Fs/2;
F5=F4+20;

S1=sin(2*pi*F1*t);
S2=sin(2*pi*F2*t);
S3=sin(2*pi*F3*t);
S4=sin(2*pi*F4*t);
S5=sin(2*pi*F5*t);

figure('Name','Actividad 1','NumberTitle','off')
subplot(5,1,1)
plot(t,S1)
subplot(5,1,2)
plot(t,S2)
subplot(5,1,3)
plot(t,S3)
subplot(5,1,4)
plot(t,S4)
subplot(5,1,5)
plot(t,S5)

clear all