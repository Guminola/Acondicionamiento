%Señal Fs 1kHz 1.5s
Fs = 1000;      %frecuencia de muesteeo
T = 1/Fs;       %periodo de muestreo
L = 15000;      
t = (0:L-1)*T;

%Senoidal 50Hz amplitud 0.7
%senoidal 120Hz amplitud 1
S = 0.7*sin(2*pi*50*t) + sin (2*pi*120*t);

%ruido blanco (zero-mean) variabnsa 4
X = S + 2*randn(size(t));

plot(1000*t(1:50),X(1:50));
title('Senal corrompida con ruido aleatorio de media cero')
xlabel('t (milisegundos)')
ylabel('X(t)')

%Transformada de fourier
Y = fft(X);

P2 = abs(Y/L);      % Espectro bilateral
P1 = P2(1:L/2+1);   % Espectro de un solo lado
P1(2:end-1) = 2*P1(2:end-1); % Discriminamos los bordes

f = Fs*(0:(L/2))/L;
figure
plot(f,P1);
title('Espectro de amplitud de X(t)');
xlabel('f(Hz)')
ylabel('|P1(f)|')

Y = fft(S);
P2 =abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
figure;
plot(f,P1);
title('Espectro de amplitud ')