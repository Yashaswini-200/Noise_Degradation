clc;
clear;
close all;

%% Project Folder

PROJECT = "C:\Users\YASHASWINI\OneDrive\projects\FIR_LPF\";

Fs = 48000;

%% Load Signals

x    = load(PROJECT + "input_samples.txt");
y_hw = load(PROJECT + "output_samples.txt");

x    = x/32768;
y_hw = y_hw/32768;

%% FIR Coefficients (Q1.15)

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

%% Make Lengths Equal

N = min(length(y_ref),length(y_hw));

y_ref = y_ref(1:N);
y_hw  = y_hw(1:N);

%% Error

err = y_hw(2:end) - y_ref(1:end-1);

fprintf("\n=========================================\n");
fprintf("Verification Results\n");
fprintf("=========================================\n");
fprintf("Mean Error = %.10f\n",mean(abs(err)));
fprintf("RMS Error  = %.10f\n",rms(err));
fprintf("Max Error  = %.10f\n",max(abs(err)));

%% First 80 Samples

disp(' ');
disp('==============================================================');
disp(' Index      MATLAB         FPGA         Error');
disp('==============================================================');

for i=1:80
    fprintf('%5d %14.6f %12.6f %12.6f\n',...
        i,y_ref(i),y_hw(i),err(i));
end

%% Time Domain

figure;

plot(y_ref(1:200),'b','LineWidth',2);
hold on;
plot(y_hw(1:200),'r--','LineWidth',2);

grid on;
legend('MATLAB','FPGA');

xlabel('Sample');
ylabel('Amplitude');

title('Mixed Signal Output Comparison');

%% Spectrum

NFFT = length(y_ref);

REF = fft(y_ref.*hann(NFFT));
HW  = fft(y_hw.*hann(NFFT));

half = floor(NFFT/2);

REF = REF(1:half);
HW  = HW(1:half);

f = (0:half-1)*Fs/NFFT;

figure;

plot(f,...
20*log10(abs(REF)/max(abs(REF))+eps),...
'b','LineWidth',2);

hold on;

plot(f,...
20*log10(abs(HW)/max(abs(REF))+eps),...
'r--','LineWidth',2);

grid on;

legend('MATLAB','FPGA');

xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

title('Mixed Signal Spectrum');

xlim([0 20000]);
ylim([-120 5]);

%% Peak Measurements

[~,idx2]  = min(abs(f-2000));
[~,idx12] = min(abs(f-12000));

fprintf("\nSpectrum Comparison\n");
fprintf("---------------------------------\n");

fprintf("2 kHz MATLAB : %.2f dB\n",...
20*log10(abs(REF(idx2))/max(abs(REF))+eps));

fprintf("2 kHz FPGA   : %.2f dB\n",...
20*log10(abs(HW(idx2))/max(abs(REF))+eps));

fprintf("\n");

fprintf("12 kHz MATLAB : %.2f dB\n",...
20*log10(abs(REF(idx12))/max(abs(REF))+eps));

fprintf("12 kHz FPGA   : %.2f dB\n",...
20*log10(abs(HW(idx12))/max(abs(REF))+eps));

fprintf("---------------------------------\n");