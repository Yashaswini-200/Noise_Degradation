clc;
clear;
close all;

y = load('output_samples.txt');

figure;
plot(y,'LineWidth',2);
grid on;
xlabel('Sample');
ylabel('Amplitude');
title('FPGA Step Response');

xlim([0 120]);