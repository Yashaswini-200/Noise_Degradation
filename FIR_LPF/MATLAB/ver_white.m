clc;
clear;
close all;

PROJECT = "C:\Users\YASHASWINI\OneDrive\projects\FIR_LPF\";

Fs = 48000;

%% Load Data

x    = load(PROJECT + "input_samples.txt");
y_hw = load(PROJECT + "output_samples.txt");

x    = x/32768;
y_hw = y_hw/32768;

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

y_ref = filter(h,1,x);

%% One Sample Pipeline Alignment

y_ref = y_ref(1:end-1);
y_hw  = y_hw(2:end);

N = min(length(y_ref),length(y_hw));

y_ref = y_ref(1:N);
y_hw  = y_hw(1:N);

%% Error

err = y_hw - y_ref;

fprintf("\n=====================================\n");
fprintf("White Noise Verification\n");
fprintf("=====================================\n");

fprintf("Mean Error = %.10f\n",mean(abs(err)));
fprintf("RMS Error  = %.10f\n",rms(err));
fprintf("Max Error  = %.10f\n",max(abs(err)));

%% Time Domain

figure;

plot(y_ref(1:300),'b');
hold on;
plot(y_hw(1:300),'r--');

grid on;

legend('MATLAB','FPGA');

title('White Noise Output');

%% Spectrum

NFFT = 4096;

REF = fft(y_ref.*hann(length(y_ref)),NFFT);
HW  = fft(y_hw.*hann(length(y_hw)),NFFT);

half = NFFT/2;

f = (0:half-1)*Fs/NFFT;

REF = REF(1:half);
HW  = HW(1:half);

figure;

plot(f,...
20*log10(abs(REF)/max(abs(REF))+eps),...
'LineWidth',2);

hold on;

plot(f,...
20*log10(abs(HW)/max(abs(REF))+eps),...
'r--','LineWidth',2);

grid on;

xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

legend('MATLAB','FPGA');

title('White Noise Spectrum');

xlim([0 20000]);
ylim([-120 5]);