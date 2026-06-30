clc;
clear;
close all;

PROJECT = "C:\Users\YASHASWINI\OneDrive\projects\FIR_LPF\";

Fs = 48000;
N  = 4096;

rng(1);                 % Fixed seed for repeatability

x = randn(N,1);

x = x/max(abs(x));

xq = round(x*32767);

writematrix(xq, PROJECT + "input_samples.txt");

disp("White Noise Generated Successfully");