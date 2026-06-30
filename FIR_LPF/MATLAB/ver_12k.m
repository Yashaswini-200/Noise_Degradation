clc;
clear;
close all;

%% Parameters

Fs = 48000;

%% Load Files

x = load("C:\Users\YASHASWINI\OneDrive\projects\FIR_LPF\input_samples.txt");
y_fpga = load("C:\Users\YASHASWINI\OneDrive\projects\FIR_LPF\output_samples.txt");

x = double(x)/32768;
y_fpga = double(y_fpga)/32768;

%% FIR Coefficients

h = [
0
38
48
0
-85
-114
0
200
258
0
-414
-518
0
798
992
0
-1582
-2074
0
4416
8970
10903
8970
4416
0
-2074
-1582
0
992
798
0
-518
-414
0
258
200
0
-114
-85
0
48
38
0
]/32768;

%% MATLAB Reference

y_matlab = filter(h,1,x);

%% Equal Length

N = min(length(y_matlab),length(y_fpga));

y_matlab = y_matlab(1:N);
y_fpga   = y_fpga(1:N);

%% Plot

figure;

plot(y_matlab(1:200),'b','LineWidth',2);

hold on;

plot(y_fpga(1:200),'r--','LineWidth',2);

grid on;

legend('MATLAB','FPGA');

title('12 kHz Output Comparison');

xlabel('Sample');

ylabel('Amplitude');

%% Error

err = y_fpga-y_matlab;

fprintf("\nMean Error = %.10f\n",mean(abs(err)));
fprintf("RMS Error  = %.10f\n",rms(err));
fprintf("Max Error  = %.10f\n",max(abs(err)));

%% FFT Comparison

NFFT = length(y_matlab);

REF = fft(y_matlab,NFFT);
HW  = fft(y_fpga,NFFT);

half = floor(NFFT/2);

f = (0:half-1)*Fs/NFFT;

figure;

plot(f,...
20*log10(abs(REF(1:half))/max(abs(REF))+eps),...
'b','LineWidth',2);

hold on;

plot(f,...
20*log10(abs(HW(1:half))/max(abs(REF))+eps),...
'r--','LineWidth',2);

grid on;

legend('MATLAB','FPGA');

title('12 kHz Spectrum');

xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

xlim([0 20000]);
ylim([-120 5]);