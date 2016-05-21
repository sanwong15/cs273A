clc;
clear;

iris=load('D:\Document (Shared)\Google Drive\UCI Grad School School Work\CS 273A\HW\HW 1\HW1\data\iris.txt');
y=iris(:,end);
x=iris(:,1:end-1);
whos

% Shuffle Data
[x_s y_s] = shuffleData(x,y);
% Split Data
% split data into training and test sets
% [xTrain xTest yTrain yTest] = splitData(X,Y,trainFraction) splits the (X,Y) data into training and test sets
%   where the training data are the first (trainFraction) part of the data.
[Xtr Xte Ytr Yte] = splitData(x_s,y_s, 0.75);

% knnClassify(X,Y,...) : create k-nearest-neighbors classifier
% takes no arguments, or training data to be used in constructing the classifier
% alpha: weighted average coefficient (Gaussian weighting); alpha=0 => simple average
% For k = 1
knn = knnClassify( Xtr, Ytr, 1); % replace or set K to some integer

% Yhat = predict(knn, Xtest) : make a nearest-neighbor prediction on test data
YteHat = predict( knn, Xte); % make predictions on Xtest

% plotClassify2D(learner,X,Y [,pre]) : plot data and classifier outputs on two-dimensional data
% This function plots the data (X,Y) and "predict(learner,X,Y)" together.
%    The learner is predicted on a dense grid covering the data X, to show its decision boundary
%
% Optional arguments: 
%    pre : function handle applied to X before predict, e.g., predict(learner,pre(X),Y)
% Ex: pre = @(x) fpoly(x,2);                         % applies a polynomial expansion before prediction
% Ex: [Xtr,M,S]=whiten(Xtr); pre=@(x) whiten(x,M,S); % applies whitening transform before predict
plotCkassify2D( knn, Xtr, Ytr); % make 2D classification plot with data (Xtr, Ytr)
