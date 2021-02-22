clc
clear

%%%GRAPH1
fs = 1000;
dt = 1/fs;
t = 0:dt:2-dt; %time
graph1 = sawtooth(2*pi*10*t);
subplot(2,2,1); %2x1 grid first graph
plot(t,graph1);

%%%GRAPH2
graph2 = fftshift(abs(fft(graph1)));
size = length(graph1);
f = -fs/2:fs/(size-1):fs/2;
subplot(2,2,2); %2x1 grid second graph
plot(f,graph2);
xlim([0 200]);
ylim([0 1000]);

%%GRAPH3
T=1/10;
N=10;
SUM = 0;
for n=1:N
    SUM = SUM + ((-1)^(n+1))*(1/n)*sin(n*2*pi*t/T);
end
graph3 = 2* (1/pi) * SUM;
subplot(2,2,3);  %2x1 grid third graph
plot(t,graph3);



%%%GRAPH4
graph4 = fftshift(abs(fft(graph3)));
size = length(graph3);
f = -fs/2:fs/(size-1):fs/2;
subplot(2,2,4); %2x1 grid fourth graph
plot(f,graph4);
xlim([0 200]);
ylim([0 1000]);

print();