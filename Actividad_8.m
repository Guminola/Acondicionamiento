clc; clear all; close all;
fs = 200; %frecuencia de muestreo
T = 6; %Tiempo de muestreo
t = 0:1/fs:T-1/fs; %duracion
figure;
% Señal 1 - Seno
ss = 3 * sin( 2* pi * 5 * t);
subplot(2 , 1 , 1);
plot( t , ss , 'b');
title (' Seno ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
% Señal 2 - Coseno
sc = 5 * cos( 2* pi * 3 * t);
subplot(2 , 1 , 2);
plot( t , sc , 'g' );
title (' Coseno ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;

figure;
%Distribuicion de las señales
subplot(2 , 2 , 1);

%S representa la matriz con las señales observadas
%A contiene los coeficientes de mezcla
%X simboliza las señales mezcla
plot( ss , sc , '.b' );
ylabel ( 'Señal 2') ; xlabel (' Señal 1' ) ;
S = [ss ; sc ];
A = [ .5 -.3 ; .3 -.8 ] ;
X = A * S ;

%Obtención de las señales individuales de la matriz X
X1 = X ( 1, : );
X2 = X ( 2, : );

subplot(2 , 2 , 2);
plot( X1 , X2 , '.r' ); %Gráfico de la distribución de las señales mezcla
ylabel ( ' X1 ') ; xlabel (' X2 ' ) ;

%Proceso de obtención de la matriz W.
%W representa la matriz de blanqueamiento
%Z contiene las señales blanqueadas
Rx = cov(X');
[V, D ] = eig(Rx) ;
W = D ^(-0.5) * V';
Z = W * X ;

%Obtención de las señales individuales de la matriz Z
Z1 = Z ( 1, : );
Z2 = Z ( 2, : );
subplot(2 , 2 , 3);
plot( Z1 , Z2 , '.k' ); %Gráfico de la distribución de las señales blanqueadas
ylabel ( ' Z1 ') ; xlabel (' Z2 ' ) ;

%Por medio de la función fastica se obtiene la matriz AA, matriz de mezcla estimada
%Proceso de obtención de la matriz Y, donde Y contiene las señales estimadas
[AA , B ] = fastica( X );
Y = inv(AA) * X;
Y1 = Y ( 1, : ); %Obtención de las señales individuales de la matriz Y
Y2 = Y ( 2, : );
subplot(2 , 2 , 4);
plot( Y1 , Y2 , '.k' ); %Gráfico de la distribución de las señales estimadas

%SEPARACIÓN
figure;
Y1 = Y ( 1, : ); %Obtención de señales individuales de la matriz Y
Y2 = Y ( 2, : );

% Señal Estimada 1
subplot(2 , 1 , 1);
plot( t , Y1 , 'b');
title (' Senal Estimada 1 ' );
ylabel ( 'Amplitud') ;
xlabel (' Tiempo ' ) ;
% Señal Estimada 2
subplot(2 , 1 , 2);
plot( t , Y2 , 'g' ); %Se grafica individualmente cada señal estimada obtenida
title (' Señal Estimada 2 ' );
ylabel ( 'Amplitud') ;
xlabel (' Tiempo ' ) ;

%COMPARACIÓN DE ALGORITMOS
clc; clear all; close all;
fs = 200; %frecuencia de muestreo
T = 6; %Tiempo de muestreo
t = 0:1/fs:T-1/fs; %duracion
figure;
s1 = 3 * sin( 2* pi * 3 * t);
subplot(6 , 1 , 1);
plot( t , s1 , 'b');
title (' Seno ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
s2 = 2 * sawtooth( 2* pi * 15 * t);
subplot(6 , 1 , 2);
plot( t , s2 , 'r');
title (' Triangular ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
s3 = 2.5 * cos( 2* pi * 12 * t);
subplot(6 , 1 , 3);
plot( t , s3 , 'g' );
title (' Coseno ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
s4 = 5 * square( 2* pi * 11 * t);
subplot(6 , 1 , 4);
plot( t , s4 , 'k' );
title (' Cuadrangular ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
s5 = 4 * sawtooth( 2* pi * 7 * t);
subplot(6 , 1 , 5);
plot( t , s5 , 'r' );
title (' Triangular ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
s6 = 3 * cos( 2* pi * 1 * t);
subplot(6 , 1 , 6);
plot( t , s6 , 'g');
title (' Coseno ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
S = [s1 ; s2 ; s3 ; s4 ; s5 ; s6];
A = [ .5 -.3 .4 -.5 .1 -.9; .3 -.8 .8 -.9 .7 -.2;
.8 .7 -.4 .3 -.9 -.6; -.6 .5 .9 .9 .5 .8;
.9 .4 -.7 .7 .8 .7; .9 .4 -.3 -.2 -.8 -.9] ;
X = A * S ;


%ALGORITMO FASTICA
figure;
[ U , B ] = fastica( X );
YF = inv(U) * X;
YF1 = YF ( 1, : );
YF2 = YF ( 2, : );
YF3 = YF ( 3, : );
YF4 = YF ( 4, : );
YF5 = YF ( 5, : );
YF6 = YF ( 6, : );
subplot(6 , 1 , 1); plot( t , YF1 , 'b');
title (' Señales Recuperadas con Algoritmo FastICA. Señal Recuperada 1 ' );
ylabel ( 'Amplitud') ; xlabel (' Señal 1 ' ) ;
subplot(6 , 1 , 2); plot( t , YF2 , 'r');
title (' Señal Recuperada 2 ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
subplot(6 , 1 , 3); plot( t , YF3 , 'g' );
title (' Señal Recuperada 3 ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
subplot(6 , 1 , 4); plot( t , YF4 , 'k' );
title (' Señal Recuperada 4 ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
subplot(6 , 1 , 5); plot( t , YF5 , 'b' );
title (' Señal Recuperada 5 ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
subplot(6 , 1 , 6); plot( t , YF6 , 'r');
title (' Señal Recuperada 6 ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;

%ALGORITMO ACSOBIRO
figure;
H = acsobiro (X , 6 , 100);
YA = inv(H) * X ;
YA1 = YA ( 1, : );
YA2 = YA ( 2, : );
YA3 = YA ( 3, : );
YA4 = YA ( 4, : );
YA5 = YA ( 5, : );
YA6 = YA ( 6, : );
subplot(6 , 1 , 1); plot( t , YA1 , 'b');
title (' Señales Recuperadas con Algoritmo Acsobiro. Señal Recuperada 1 ' );
ylabel ( 'Amplitud') ; xlabel (' Señal 1 ' ) ;
subplot(6 , 1 , 2); plot( t , YA2 , 'r');
title (' Señal Recuperada 2 ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
subplot(6 , 1 , 3); plot( t , YA3 , 'g' );
title (' Señal Recuperada 3 ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
subplot(6 , 1 , 4); plot( t , YA4 , 'k' );
title (' Señal Recuperada 4 ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
subplot(6 , 1 , 5); plot( t , YA5 , 'b' );
title (' Señal Recuperada 5 ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
subplot(6 , 1 , 6); plot( t , YA6 , 'r');
title (' Señal Recuperada 6 ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;

%ALCORITMO COMBI
figure;
B = combi (X , 6 , 100);
YC= B * X ;
YC1 = YC ( 1, : );
YC2 = YC ( 2, : );
YC3 = YC ( 3, : );
YC4 = YC ( 4, : );
YC5 = YC ( 5, : );
YC6 = YC ( 6, : );
subplot(6 , 1 , 1); plot( t , YC1 , 'b');
title (' Señales Recuperadas con Algoritmo Combi. Señal Recuperada 1 ' );
ylabel ( 'Amplitud') ; xlabel (' Señal 1 ' ) ;
subplot(6 , 1 , 2); plot( t , YC2 , 'r');
title (' Señal Recuperada 2 ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
subplot(6 , 1 , 3); plot( t , YC3 , 'g' );
title (' Señal Recuperada 3 ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
subplot(6 , 1 , 4); plot( t , YC4 , 'k' );
title (' Señal Recuperada 4 ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
subplot(6 , 1 , 5); plot( t , YC5 , 'b' );
title (' Señal Recuperada 5 ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
subplot(6 , 1 , 6); plot( t , YC6 , 'r');
title (' Señal Recuperada 6 ' );
ylabel ( 'Amplitud') ; xlabel (' Tiempo ' ) ;
