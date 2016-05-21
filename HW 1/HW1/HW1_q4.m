clc;
clear;

% iris=load('D:\Documents (D)\Google Drive\UCI Grad School School Work\CS 273A\HW\HW 1\HW1\data\iris.txt');
 iris=load('D:\Document (Shared)\Google Drive\UCI Grad School School Work\CS 273A\HW\HW 1\HW1\data\iris.txt');
y=iris(:,end);
x=iris(:,1:2);
whos

num_features = size(x,2)
num_datapt = size(x,1)

% Part A: Splitting the training data by class, compute the empirical mean
% vector and covariance matrix 

%Find indicies of y = 0
y_index_0 = find (y==0);
length(y_index_0);
%Find indicies of y = 1
y_index_1 = find (y==1);
length(y_index_1);
%Find indicies of y = 2
y_index_2 = find (y==2);
length(y_index_2);

% Split data by class
x_split_0 = x(1:length(y_index_0),1:2);
y_split_0 = y(1:length(y_index_0),end);
iris_split_0 = iris(1:length(y_index_0),1:end);

x_split_1 = x(length(y_index_1):length(y_index_0)+length(y_index_1),1:2);
y_split_1 = y(length(y_index_1):length(y_index_0)+length(y_index_1),end);
iris_split_1 = iris(length(y_index_1):length(y_index_0)+length(y_index_1),1:end);

x_split_2 = x(length(y_index_0)+length(y_index_1)+1:end,1:2);
y_split_2 = y(length(y_index_0)+length(y_index_1)+1:end,end);
iris_split_2 = iris(length(y_index_0)+length(y_index_1)+1:end,1:end);

% Shuffled and Split into traning and test set
% Shuffle Data
[x0_s y0_s] = shuffleData(x_split_0,y_split_0);
% Split Data
[Xtr_0 Xte_0 Ytr_0 Yte_0] = splitData(x0_s,y0_s, 0.75);

[x1_s y1_s] = shuffleData(x_split_1,y_split_1);
[Xtr_1 Xte_1 Ytr_1 Yte_1] = splitData(x1_s,y1_s, 0.75);

[x2_s y2_s] = shuffleData(x_split_2,y_split_2);
[Xtr_2 Xte_2 Ytr_2 Yte_2] = splitData(x2_s,y2_s, 0.75);

% Find the empirical mean vectore of Traning data (Class = 0)
mean_traindata_0 = mean (Xtr_0)
cov_traindata_0 = cov(Xtr_0)

mean_traindata_1 = mean (Xtr_1)
cov_traindata_1 = cov(Xtr_1)

mean_traindata_2 = mean (Xtr_2)
cov_traindata_2 = cov(Xtr_2)


% Part B Plot a scatterplot of Training data
figure(1);
hold on;
scatter(Xtr_0(:,1),Xtr_0(:,2), 'r+')
scatter(Xtr_1(:,1),Xtr_1(:,2), 'g+')
scatter(Xtr_2(:,1),Xtr_2(:,2), 'b+')

figure(2);
hold on;
scatter(Xte_0(:,1),Xte_0(:,2), 'r^')
scatter(Xte_1(:,1),Xte_1(:,2), 'g^')
scatter(Xte_2(:,1),Xte_2(:,2), 'b^')

figure(3);
hold on;
scatter(x_split_0(:,1),x_split_0(:,2), 'rd')
scatter(x_split_1(:,1),x_split_1(:,2), 'gd')
scatter(x_split_2(:,1),x_split_2(:,2), 'bd')

% Part C
% H = plotGauss2D( mean, cov, colorString, ...)
figure (4)
 hold on;
plotGauss2D(mean_traindata_0,cov_traindata_0, 'r-')
% figure (5)
 plotGauss2D(mean_traindata_1,cov_traindata_1, 'g-')
% figure (6)
 plotGauss2D(mean_traindata_2,cov_traindata_2, 'b-')
 hold off;
 
 % Part D
    %gaussBayesClassify(X,Y,...) : train a Bayes classifier with Gaussian class-conditional distributions
    % takes no arguments, or see gaussBayesClassify/train for training options
 bc_0 = gaussBayesClassify( Xtr_0, Ytr_0);
 bc_1 = gaussBayesClassify( Xtr_1, Ytr_1);
 bc_2 = gaussBayesClassify( Xtr_2, Ytr_2);
 
%  figure(5)
%  %hold on;
%     % plotClassify2D(learner,X,Y [,pre]) : plot data and classifier outputs on two-dimensional data
%     % This function plots the data (X,Y) and "predict(learner,X,Y)" together.
%     %    pre : function handle applied to X before predict, e.g., predict(learner,pre(X),Y)
%     % Ex: pre = @(x) fpoly(x,2);       % applies a polynomial expansion before prediction
%     % Ex: [Xtr,M,S]=whiten(Xtr); pre=@(x) whiten(x,M,S);   % applies whitening transform before predict
%  plotClassify2D(bc_0, Xtr_0, Ytr_0);
%  figure (6)
%  plotClassify2D(bc_1, Xtr_1, Ytr_1);
%  figure (7)
%  plotClassify2D(bc_2, Xtr_2, Ytr_2);

 % Part E
 err_0_tr = err(bc_0, Xtr_0, Ytr_0)
 err_1_tr = err(bc_1, Xtr_1, Ytr_1)
 err_2_tr = err(bc_2, Xtr_2, Ytr_2)

 err_0_te = err(bc_0, Xte_0, Yte_0)
 err_1_te = err(bc_1, Xte_1, Yte_1)
 err_2_te = err(bc_2, Xte_2, Yte_2)

