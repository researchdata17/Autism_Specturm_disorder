function [] = test()
%% This script generates and plots 3D data, and performs a principal
%% component analysis to decorrelate the data, and to reduce the
%% dimensionality of the feature space.

% Note that matlab has an optimized function to perform PCA: princomp()
% However, in this script we perform PCA manually by calculating the
% eigenvectors, for demonstration/educational purposes.

clear all;
close all;

% Create some random data
s = [2 2 2];  % skew factor
x = randn(334,1);
y1 = normrnd(s(1).*x,1)+3;
y2 = normrnd(s(2).*x,1)+2;
y3 = normrnd(s(3).*x,1)+1;
data = [y1 y2 y3];

%%%%%%%%%%%%% PLOT THE ORIGINAL DATA %%%%%%%%%%%
% Get the coordinates of the data mean
avg = mean(data);
% Calculate the eigenvectors and eigenvalues
covariance = cov(data);
[coeff,score,latent] = pca(ingredients);

end

