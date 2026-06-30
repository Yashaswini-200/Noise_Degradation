clc;
clear;
close all;

%% Parameters

Fs = 48000;
N  = 4096;

t = (0:N-1)'/Fs;

%% Generate 12 kHz Sine

f = 12000;
A = 0.8;

x = A*sin(2*pi*f*t);

%% Convert to Q1.15

xq = int16(round(x*32767));

%% Save for Vivado

writematrix(xq,...
    "C:\Users\YASHASWINI\OneDrive\projects\FIR_LPF\input_samples.txt");

disp("12 kHz input generated successfully.");

%% Plot Input

figure;

plot(x(1:100),'LineWidth',2);

grid on;

title('12 kHz Input Signal');

xlabel('Sample');

ylabel('Amplitude');

%% Input FFT

NFFT = 4096;

X = fft(x,NFFT);

faxis = (0:NFFT/2-1)*Fs/NFFT;

figure;

plot(faxis,...
    20*log10(abs(X(1:NFFT/2))/max(abs(X))+eps),...
    'LineWidth',2);

grid on;

xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('12 kHz Input Spectrum');

xlim([0 20000]);
ylim([-120 5]);