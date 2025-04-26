clc;
clear;
close all;

EbN0dB = 0:2:12; % SNR in dB
EbN0 = 10.^(EbN0dB/10); % SNR in linear scale
SNR = EbN0; % SNR is same as Eb/N0 for BPSK modulation using Q-function
BER = 0.5*erfc(sqrt(SNR)); % Theoretical BER for BPSK
% Also use approximate equation of BER which is BER = exp(-SNR./2)

%% Plotting
semilogy(EbN0dB, BER, 'b-o');
grid on;
xlabel('Eb/N0 (dB)');
ylabel('Bit Error Rate (BER)');
title('Bit Error Rate (BER) for BPSK Modulation');