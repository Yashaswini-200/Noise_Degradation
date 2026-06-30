clc;
clear;
close all;

N = 4096;

x = zeros(N,1);

x(21:end) = 32767;

writematrix(x,'input_samples.txt');
fprintf('\nFirst 120 Output Samples\n');
fprintf('------------------------\n');

disp(y(1:120));

figure;
stairs(x);
grid on;
title('Step Input');
xlabel('Sample');
ylabel('Amplitude');