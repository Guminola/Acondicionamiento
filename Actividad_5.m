Fs = 500;

F1 = 5;
F2 = 10;
F3 = 17;
F4 = 23;

t=1/Fs:1/Fs:2;
t2 = 1/Fs:1/Fs:8;

f = Fs*(0:((Fs*t(end))/2))/(Fs*t(end));
f2 = Fs*(0:((Fs*t2(end))/2))/(Fs*t2(end));

s1 = sin(2*pi*F1*t);
s2 = sin(2*pi*F2*t);
s3 = sin(2*pi*F3*t);
s4 = sin(2*pi*F4*t);

figure('name','señales sinusoidales', 'units', 'normalized')

subplot(4,1,1);
plot(t,s1);
title(['señal Sinusoidal ', num2str(F1),' HZ']);
xlabel('tiempo (s)')
ylabel('amplitud (Hz)')

subplot(4,1,2);
plot(t,s2);
title(['señal Sinusoidal ', num2str(F2),' HZ']);
xlabel('tiempo (s)')
ylabel('amplitud (Hz)')

subplot(4,1,3);
plot(t,s3);
title(['señal Sinusoidal ', num2str(F3),' HZ']);
xlabel('tiempo (s)')
ylabel('amplitud (Hz)')

subplot(4,1,4);
plot(t,s4);
title(['señal Sinusoidal ', num2str(F4),' HZ']);
xlabel('tiempo (s)')
ylabel('amplitud (Hz)')

fourier1 = fft(s1);
fourier2 = fft(s2);
fourier3 = fft(s3);
fourier4 = fft(s4);

mag1 = abs(fourier1/(Fs*t(end)));
mag2 = abs(fourier2/(Fs*t(end)));
mag3 = abs(fourier3/(Fs*t(end)));
mag4 = abs(fourier4/(Fs*t(end)));

norm1=mag1(1:(Fs*t(end))/2+1);
norm1(2:end-1) = 2*norm1(2:end-1);
norm2=mag2(1:(Fs*t(end))/2+1);
norm2(2:end-1) = 2*norm2(2:end-1);
norm3=mag3(1:(Fs*t(end))/2+1);
norm3(2:end-1) = 2*norm3(2:end-1);
norm4=mag4(1:(Fs*t(end))/2+1);
norm4(2:end-1) = 2*norm4(2:end-1);

figure('name','Individual fourier', 'units', 'normalized')

subplot(4,2,1)
plot(t,s1)
title(['Señal sinusoidal de ',num2str(F1),' Hz']);
xlabel('Tiempo (s)');
ylabel('amplitud')

subplot(4,2,3)
plot(t,s2)
title(['Señal sinusoidal de ',num2str(F2),' Hz']);
xlabel('Tiempo (s)');
ylabel('amplitud')

subplot(4,2,5)
plot(t,s3)
title(['Señal sinusoidal de ',num2str(F3),' Hz']);
xlabel('Tiempo (s)');
ylabel('amplitud')

subplot(4,2,7)
plot(t,s4)
title(['Señal sinusoidal de ',num2str(F4),' Hz']);
xlabel('Tiempo (s)');
ylabel('amplitud')


subplot(4,2,2)
plot(f,norm1)
axis([0 50 0 1])
title(['Señal normalizada de ',num2str(F1),' Hz']);
xlabel('frequencia');

subplot(4,2,4)
plot(f,norm2)
axis([0 50 0 1])
title(['Señal normalizada de ',num2str(F2),' Hz']);
xlabel('frequencia');

subplot(4,2,6)
plot(f,norm3)
axis([0 50 0 1])
title(['Señal normalizada de ',num2str(F3),' Hz']);
xlabel('frequencia');

subplot(4,2,8)
plot(f,norm4)
axis([0 50 0 1])
title(['Señal normalizada de ',num2str(F4),' Hz']);
xlabel('frequencia');

%Señales sumadas 
SumSeniales = s1+s2+s3+s4;

%Señales concatenadas
CatSeniales = [s1 s2 s3 s4];

figure('name', 'comparacion de señales', 'units', 'normalized', 'outerposition', [0 0 1 1 ])
subplot(2,1,1)
plot(t,SumSeniales)
title('suma de señales')
xlabel('Tiempo (s)')
ylabel('Amplitud')

subplot(2,1,2)
plot(t2,CatSeniales);
title('cooncatenciaon de las señales');
xlabel('Tiempo (s)')
ylabel('Amplitud')

%Espectro de fourier de la señal sumada
FourierSum = fft(SumSeniales);

%Espectro fourier señales concatenadas
FourierCat = fft(CatSeniales);

%Magnitud espectral normalizada
MagSum = abs(FourierSum/(Fs*t(end)));
MagCat = abs(FourierCat/(Fs*t2(end)));

%Se acomodan las frecuencias
NormSum = MagSum(1:(Fs*t(end))/2+1);
NormSum(2:end-1) = 2*NormSum(2:end-1);

NormCat = MagCat(1:(Fs*t2(end))/2+1);
NormCat(2:end-1) = 2*NormCat(2:end-1);

%Graficar resultados 
figure('Name', 'Suma-concatenacion', 'units', 'normalized', 'outerposition', [0 0 1 1])
subplot(2,2,1)
plot(t,SumSeniales)
title('Suma de señales');
xlabel('Tiempo (s)')
ylabel('Amplitud')

subplot(2,2,3)
plot(t2,CatSeniales)
title('Catecatenacion de señales');
xlabel('Tiempo (s)')
ylabel('Amplitud')

subplot(2,2,2)
plot(f,NormSum)
axis([0 50 0 1])
title('Espector de fourier de las señales sumadas');
xlabel('Frecuencia (Hz)')

subplot(2,2,4)
plot(f2,NormCat)
axis([0 30 0 .3])
title('Espector de fourier señales concatenadas');
xlabel('Frecuencia (Hz)')

% Agregr un desface a las señales sinusoidales
s5 = sin(2*pi*F1*t+pi/3); % Señal  desfasada pi/3
s6 = sin(2*pi*F2*t+pi/2); % Señal  desfasada pi/2
s7 = sin(2*pi*F3*t+pi/3); % Señal  desfasada pi/
s8 = sin(2*pi*F4*t+pi); % Señal  desfasada pi

figure('name', 'señales y defase', 'units', 'normalized', 'outerposition', [0 0 1 1])

subplot(4,2,2)
plot(t,s5)
title(['Señal sinusaoidal de ',num2str(F1), 'Hz']);
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,4)
plot(t,s6)
title(['Señal sinusaoidal de ',num2str(F2), 'Hz con phi=\pi/3']);
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,6)
plot(t,s7)
title(['Señal sinusaoidal de ',num2str(F3), 'Hz con phi=\pi/2']);
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,8)
plot(t,s8)
title(['Señal sinusaoidal de ',num2str(F4), 'Hz con phi=\pi/3']);
xlabel('tiempo (s)'); ylabel('Amplitud')

%% Aplicar la transformada de fourier 
fourier5 = fft(s5);
fourier6 = fft(s6);
fourier7 = fft(s7);
fourier8 = fft(s8);

%tiene componentes imaginarios
mag5 = abs(fourier5/(Fs*t(end)));
mag6 = abs(fourier6/(Fs*t(end)));
mag7 = abs(fourier7/(Fs*t(end)));
mag8 = abs(fourier8/(Fs*t(end)));

% Normalizacion correcta
norm5 = mag5(1:(FS*t(end))/2+1);
norm5(2:end-1) = 2*norm5(2:end-1);
norm6 = mag6(1:(FS*t(end))/2+1);
norm6(2:end-1) = 2*norm6(2:end-1);
norm7 = mag7(1:(FS*t(end))/2+1);
norm7(2:end-1) = 2*norm7(2:end-1);
norm8 = mag8(1:(FS*t(end))/2+1);
norm8(2:end-1) = 2*norm8(2:end-1);

% Graficar las figuras 
figure('name', 'fourier señales en fase y desfase', 'units', 'normalized', 'outerposition', [0 0 1 1])

subplot(4,2,1)
plot(f,norm1)
axis([0 50 0 1])
title('Espector señal ', num2str(F1), 'Hz')
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,3)
plot(f,norm2)
axis([0 50 0 1])
title('Espector señal ', num2str(F2), 'Hz')
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,5)
plot(f,norm3)
axis([0 50 0 1])
title('Espector señal ', num2str(F3), 'Hz')
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,7)
plot(f,norm4)
axis([0 50 0 1])
title('Espector señal ', num2str(F4), 'Hz')
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,2)
plot(f,norm5)
axis([0 50 0 1])
title('Espector señal ', num2str(F5), 'Hz')
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,4)
plot(f,norm6)
axis([0 50 0 1])
title('Espector señal ', num2str(F6), 'Hz')
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,6)
plot(f,norm7)
axis([0 50 0 1])
title('Espector señal ', num2str(F7), 'Hz')
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,8)
plot(f,norm8)
axis([0 50 0 1])
title('Espector señal ', num2str(F8), 'Hz')
xlabel('tiempo (s)'); ylabel('Amplitud')

%Fase de la señal de fourier
magAng1 = angle(fourier1/(Fs*t(end)));
magAng2 = angle(fourier2/(Fs*t(end)));
magAng3 = angle(fourier3/(Fs*t(end)));
magAng4 = angle(fourier4/(Fs*t(end)));
magAng5 = angle(fourier5/(Fs*t(end)));
magAng6 = angle(fourier6/(Fs*t(end)));
magAng7 = angle(fourier7/(Fs*t(end)));
magAng8 = angle(fourier8/(Fs*t(end)));

NormAng1 = magAng1(1:(Fs*t(end))/2+1);
NormAng2 = magAng2(1:(Fs*t(end))/2+1);
NormAng3 = magAng3(1:(Fs*t(end))/2+1);
NormAng4 = magAng4(1:(Fs*t(end))/2+1);
NormAng5 = magAng5(1:(Fs*t(end))/2+1);
NormAng6 = magAng6(1:(Fs*t(end))/2+1);
NormAng7 = magAng7(1:(Fs*t(end))/2+1);
NormAng8 = magAng8(1:(Fs*t(end))/2+1);

% Graficar las figuras 
figure('name', 'fase de fourier', 'units', 'normalized', 'outerposition', [0 0 1 1])

subplot(4,2,1)
plot(f,NormAng1)
axis([0 50 0 1])
title('Espector de fourier')
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,3)
plot(f,norm2)
axis([0 50 0 1])
title('Espector señal ', num2str(F2), 'Hz')
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,5)
plot(f,norm3)
axis([0 50 0 1])
title('Espector señal ', num2str(F3), 'Hz')
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,7)
plot(f,norm4)
axis([0 50 0 1])
title('Espector señal ', num2str(F4), 'Hz')
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,2)
plot(f,norm5)
axis([0 50 0 1])
title('Espector señal ', num2str(F5), 'Hz')
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,4)
plot(f,norm6)
axis([0 50 0 1])
title('Espector señal ', num2str(F6), 'Hz')
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,6)
plot(f,norm7)
axis([0 50 0 1])
title('Espector señal ', num2str(F7), 'Hz')
xlabel('tiempo (s)'); ylabel('Amplitud')

subplot(4,2,8)
plot(f,norm8)
axis([0 50 0 1])
title('Espector señal ', num2str(F8), 'Hz')
xlabel('tiempo (s)'); ylabel('Amplitud')
