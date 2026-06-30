clc;
clear;
close all;

y = load('output_samples.txt');

fprintf('\nFirst 120 Output Samples\n');
fprintf('------------------------\n');

disp(y(1:120));

figure;
stem(y(1:120),'filled');
grid on;

xlabel('Sample');
ylabel('Amplitude');
title('Impulse Response');