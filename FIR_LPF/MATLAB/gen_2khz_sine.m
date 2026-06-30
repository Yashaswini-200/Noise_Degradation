clc;
clear;
close all;

Fs = 48000;
N  = 4096;

t = (0:N-1)'/Fs;

%% Pure 2 kHz sine

f = 2000;

x = 0.8*sin(2*pi*f*t);

%% Convert to Q1.15

xq = int16(round(x*32767));

%% Save for Vivado
PROJECT = "C:\Users\YASHASWINI\OneDrive\projects\FIR_LPF\";

writematrix(xq, PROJECT + "input_samples.txt");
%% Plot

figure;
plot(x(1:300),'LineWidth',2);
grid on;
title('Input Signal (2 kHz)');
xlabel('Sample');
ylabel('Amplitude');

disp('Pure 2 kHz input generated.');