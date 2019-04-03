clear; close all; clc
x=linspace(-2,2,25);
y=linspace(-2,2,25);
[X,Y] = meshgrid(x,y);
Z=4*(X-1).^2.*(X+1).^2 + Y.^2; % potential energy landscape
hs = surf(X,Y,Z); % Get surface object
