Fs = 30:30:150;
F = 15;

figure('Name','Actividad 2','NumberTitle','off')

for i = 1:5
    Ts = 1/Fs(i);
    t = Ts:Ts:3;

    S=sin(2*pi*F*t);

    subplot(5,1,i)
    plot(t,S)
end
