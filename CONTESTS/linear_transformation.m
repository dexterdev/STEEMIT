clear  %clear all variables from matlab memory workspace
close all % close all figure windows (like previous plots)
clc % clear the screen

%% This section just creates a square 2D mesh of vectors
[X Y] = meshgrid(-10:1:10); % coordinates for vector positions
VX = X; % X,Y components of vector
VY = Y;
quiver(X, Y, VX, VY, 2)
title('Input: The 2D space')
axis square

%% reshaping the vectors for linear transformation
YY=reshape(VY,[1 21*21]);
XX=reshape(VX,[1 21*21]);
XY=[XX ;YY];

A=[1 0.5;0.5 1]; % Our transformation matrix A
XY_t=A*XY; % linear transform operation

%% This section just creates a "transformed" 2D mesh of vectors
X_t=reshape(XY_t(1,:),[21 21]);
Y_t=reshape(XY_t(2,:),[21 21]);
figure
quiver(X_t, Y_t, VX, VY, 2)
axis square
title('Output: The transformed 2D space')
