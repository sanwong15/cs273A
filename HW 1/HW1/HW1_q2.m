clc;
clear;

%iris=load('D:\Documents (D)\Google Drive\UCI Grad School School Work\CS 273A\HW\HW 1\HW1\data\iris.txt');
 iris=load('D:\Document (Shared)\Google Drive\UCI Grad School School Work\CS 273A\HW\HW 1\HW1\data\iris.txt');

% Using the First two features
y=iris(:,end);
x=iris(:,1:2);
whos
% Shuffle Data
[x_s y_s] = shuffleData(x,y)
% Split Data
[Xtr Xte Ytr Yte] = splitData(x_s,y_s, 0.75)

% Part A: For K = 1
K = 1;
    % knnClassify(X,Y,...) : create k-nearest-neighbors classifier
    % takes no arguments, or training data to be used in constructing the classifier
    % alpha: weighted average coefficient (Gaussian weighting); alpha=0 => simple average
knn = knnClassify(Xtr, Ytr, K);
    % Yhat = predict(knn, Xtest) : make a nearest-neighbor prediction on test data
YtHat = predict( knn, Xte);  % Make predictions on Xtest

% Visualize a data set and classifier's decision regions
figure(1)
plotClassify2D( knn, Xtr, Ytr);

% For K = 5
K = 5; 
knn = knnClassify(Xtr, Ytr, K);
YtHat = predict( knn, Xte);  % Make predictions on Xtest
figure(2)
plotClassify2D( knn, Xtr, Ytr);

% For K = 10
K = 10; 
knn = knnClassify(Xtr, Ytr, K);
YtHat = predict( knn, Xte);  % Make predictions on Xtest
figure(3)
plotClassify2D( knn, Xtr, Ytr);

% For K = 50
K = 50; 
knn = knnClassify(Xtr, Ytr, K);
YtHat = predict( knn, Xte);  % Make predictions on Xtest
figure(4)
plotClassify2D( knn, Xtr, Ytr);

% Part B: Compute the Error Rate (number of misclassifications) on both the
% training and test data as a function of K = [1,2,5,10,50,100,200]
K = [1,2,5,10,50,100,200];
for i=1:length(K)
    learner = knnClassify(Xtr, Ytr, K(i));
     % knnClassify(X,Y,...) : create k-nearest-neighbors classifier
     % takes no arguments, or training data to be used in constructing the classifier
     % alpha: weighted average coefficient (Gaussian weighting); alpha=0 => simple average
    Yhat = predict(learner, Xte); % Yhat = predict(knn, Xtest) : make a nearest-neighbor prediction on test data
    errTrain(i) = err(learner, Xte, Yte);  % err(obj, X,Y)  : compute error rate on test data (X,Y)
end

    
for i=1:length(K)
    learner = knnClassify(Xtr, Ytr, K(i));
    Yhat = predict(learner, Xtr); % Yhat = predict(knn, Xtest) : make a nearest-neighbor prediction on test data
    errTrain_1(i) = err(learner, Xtr, Ytr);  % err(obj, X,Y)  : compute error rate on test data (X,Y)
end
figure; 
semilogx(errTrain, 'g');
hold on;
semilogx(errTrain_1, 'r');
hold off;