clc;
clear;
close all;

%define the parameters of the Gaussian distribution
mu = 0;     %mean
sigma = 1.5; %Standard Deviation

%Generate random samples from the Gaussian distribution
sample_size = 1000;
random_samples = mu + sigma * randn(sample_size, 1);

%Compute the PDF and CDF
%x = linspace(mu - 4*sigma, 1000); %Range of valuse for PDF and CDF
x = linspace(-5, 5, 1000);
pdf_values = (1/ (sigma * sqrt(2*pi))) * exp(-(x - mu).^2 / (2*sigma^2));
cdf_values = 0.5 * (1 + erf((x - mu) / (sigma * sqrt(2))));

%Plot the PDF
figure;
plot(x, pdf_values, '-b', 'Linewidth', 2);
title('Probability Density Function(PDF) of Gaussian Distribution');
xlabel('Random Vaiable (X)');
ylabel('PDF f(X)');
grid on;

%Plot the CDF
figure;
plot(x, cdf_values, 'r-', 'Linewidth', 2);
title('Cumulative Density Function(CDF) of Gaussian Distribution');
xlabel('Random Vaiable (X)');
ylabel('CDF f(X)');
grid on;