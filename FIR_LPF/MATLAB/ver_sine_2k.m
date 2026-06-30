clc;
clear;
close all;

Fs = 48000;

%% Read files

x = load('input_samples.txt');
y_fpga = load('output_samples.txt');

x = double(x)/32768;
y_fpga = double(y_fpga)/32768;

%% Same coefficients as RTL

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

%% MATLAB reference

y_matlab = filter(h,1,x);

%% Equal lengths

N = min(length(y_matlab),length(y_fpga));

y_matlab = y_matlab(1:N);
y_fpga   = y_fpga(1:N);

%% Plot first 200 samples

figure;

plot(y_matlab(1:200),'b','LineWidth',2);

hold on;

plot(y_fpga(1:200),'r--','LineWidth',2);

grid on;

legend('MATLAB','FPGA');

title('2 kHz Output Comparison');

xlabel('Sample');

ylabel('Amplitude');

%% Error

err = y_fpga-y_matlab;

fprintf('\nMean Error : %.10f\n',mean(abs(err)));
fprintf('RMS Error  : %.10f\n',rms(err));
fprintf('Max Error  : %.10f\n',max(abs(err)));

%% First 80 samples

disp(table((1:80)',...
           y_matlab(1:80),...
           y_fpga(1:80),...
           err(1:80),...
'VariableNames',{'Index','MATLAB','FPGA','Error'}));