clc;
clear;
close all;

N = 4096;

x = zeros(N,1);

% Full-scale impulse
x(1) = 32767;

writematrix(x,'input_samples.txt');

disp('Impulse input generated.');