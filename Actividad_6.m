EOG_raw = importdata('C:\Users\lenin\OneDrive\Documents\CODE\Matlab\EOG.txt');
ECG_raw = importdata('C:\Users\lenin\OneDrive\Documents\CODE\Matlab\ECG.txt');
EMG_raw = importdata('C:\Users\lenin\OneDrive\Documents\CODE\Matlab\EMG.txt');

%% Electro-oculograma
eog = EOG_raw(:,1);

fs = 50;
N = length(eog);
t = (1:N)/fs;

plot(t,eog,'k');
hold on;

std_dev = sqrt(sum((eog-mean(eog)).^2)/(N-1));
std_dev_1 = std(eog);
avg = mean(eog);

disp([std_dev std_dev_1])
plot([t(1) t(end)], [std_dev+avg std_dev+avg], ':r');
plot([t(1) t(end)], [-std_dev+avg -std_dev+avg], ':r');

%% Electro-oculograma
