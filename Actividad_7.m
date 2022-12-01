clear all; close all; clc;
fs = 200;
t = 0:1/fs:4-1/fs;

figure;

% Señal uno seno 
s1 = 3*sin(2*pi*0.5*t);
subplot(7,1,1)
plot(t, s1,'b')
title('seno')
ylabel("amplitud"); xlabel("tiempo")

s2 = 2*sawtooth(2*pi*10*t);
subplot(7,1,2)
plot(t, s2, 'r')
title("triangular")
ylabel("amplitud"); xlabel("tiempo")

s3 = 2.5*cos(2*pi*5*t);
subplot(7,1,3)
plot(t, s3,'g')
title("coseno")
ylabel("amplitud"); xlabel("tiempo")

s4 = 5*square(2*pi*15*t);
subplot(7,1,4)
plot(t, s4, 'k')
title("cuadrada")
ylabel("amplitud"); xlabel("tiempo")

s5 = 8*sin(2*pi*8*t);
subplot(7,1,5)
plot(t, s5, 'b')
title("seno")
ylabel("amplitud"); xlabel("tiempo")

s6 = randn(1,fs*4);
subplot(7,1,6)
plot(t, s6, 'r')
title("ruido blanco")
ylabel("amplitud"); xlabel("tiempo")

% s7 = ecg(50);
% s7 = repmat(s7,1,7);
% subplot(7,1,6)
% plot(t, s7, 'r')
% title("ECG")
% ylabel("amplitud"); xlabel("tiempo")

% Suma de las señales
sumsig = s1+s2+s3+s4+s5+s6;
fsum = fftshift(abs(fft(sumsig)));
ls_fs = linspace(-fs/2, fs/2, length(fsum));

figure
subplot(2,2,1)
plot(t, sumsig, 'b')
title("Señal sumada")
ylabel("amplitud"); xlabel("tiempo")

subplot(2,2,2)
plot(ls_fs, fsum, 'r')
title('Espectro de fourier')
ylabel("Magnitud"); xlabel("Frecuencia")

% Filtro sobre espectro de frecuencias
of = find(abs(ls_fs) <= 4); % frecuencias ente 0 y 1

fourier_sin_ruido = fsum;
fourier_sin_ruido(1,of) = 0;

senal_sin_ruido = ifft(ifftshift(fourier_sin_ruido));

subplot(2,2,4)
plot(ls_fs, fourier_sin_ruido, 'r')
title('Fourier con filtro')
ylabel("Magnitud"); xlabel("Frecuencia")

subplot(2,2,3)
plot(ls_fs, senal_sin_ruido, 'k')
title('Señal con filtro')
ylabel("Amplitud"); xlabel("Tiempo")

s_final=s2+s3+s4+s5;
f_final = fftshift(abs(fft(s_final)));
ls_final = linspace(-fs/2, fs/2, length(f_final));

figure
subplot(2,1,1)
plot(t, s_final, 'b')
title("Señal sumada")
ylabel("amplitud"); xlabel("tiempo")

subplot(2,1,2)
plot(ls_final, f_final, 'r')
title('Espectro de fourier')
ylabel("Magnitud"); xlabel("Frecuencia")