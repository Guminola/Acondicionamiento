fs=500
n=500
t=(0:n-1)/fs;;
f=4;
x=sin(2*pi*f*t);
RMS=sqrt(mean(x.^2));
disp(RMS);
plot(t,x,'r','LineWidth',2);
xlabel('Time(sec)'); ylabel('x(t);');