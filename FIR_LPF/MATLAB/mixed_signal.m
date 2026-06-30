clc;
clear;
close all;

PROJECT = "C:\Users\YASHASWINI\OneDrive\projects\FIR_LPF\";

Fs = 48000;
N  = 4096;

t = (0:N-1)/Fs;

x = 0.8*sin(2*pi*2000*t) + ...
    0.2*sin(2*pi*12000*t);

x = x/max(abs(x));

xq = round(x*32767);

writematrix(xq',PROJECT + "input_samples.txt");

disp("Mixed signal generated.");