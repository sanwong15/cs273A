% HONG SAN, WONG (5732 8824)
% CS 273A    HW 3

close;
clear;
clc;

% -------------------------------- PLEASE READ ----------------------------
% Due to plotting issue, some plot might overlap. In order to resolve it,
% please run the code part by part so that plot/figure from previous part
% won't overlap with others

% ------------------------------------ Thanks -----------------------------

% Problem 1
% Build a logistic regression classifier and train it on separable and
% non-separable data. Start by building two binary classification problem
iris = load ('data/iris.txt');
X = iris(:,1:2); Y = iris(:,end);   % X is the first two features; Y is the result value (i.e. Class)
[X Y] = shuffleData(X,Y);
X = rescale(X);
XA = X(Y<2,:); YA=Y(Y<2); % get class 0 vs 1
XB = X(Y>0,:); YB=Y(Y>0); % get class 1 vs 2

% Focus on the learning alg rather than performance -> Don't bother
% splitting data for training and validation -> Use all data for training
% ** Shuffle Data before doing SGD in part f

% PART A: Show two classes in a scatter plot and verify that one is
% linearly separable while the other is not.

%Class 0 vs 1
figure (1)
XA_1 = X(Y==1,:);
XA_0 = X(Y==0,:);
hold on;
scatter(XA_1(:,1),XA_1(:,2),'b','filled')
scatter(XA_0(:,1),XA_0(:,2),'r','filled')
title('Scatter Plot: Class 0 vs Class 1')
  xlabel('Feature 1')
  ylabel('Feature 2')
hold off;

%Class 1 vs 2
figure (2)
XB_1 = X(Y==1,:);
XB_2 = X(Y==2,:);
hold on;
scatter(XB_1(:,1),XB_1(:,2),'b','filled')
scatter(XB_2(:,1),XB_2(:,2),'r','filled')
title('Scatter Plot: Class 1 vs Class 2')
  xlabel('Feature 1')
  ylabel('Feature 2')
hold off;

% % PART B: 
% % [n,d] = size(X);
% % th = [0.5 1 -0.25];
% % f = zeros(n,1);
% % f_sum = zeros(n,1);
% % yhat = zeros(n,1);
% % for i=1:n
% %     x = [1, X(i,1) X(i,2)];
% %     f(i) = th*x';
% %     f_sum(i)= sum(th.*x);
% %     yhat(i) = sign(f_sum(i)); 
% % end
% % figure(3)
% % index = [1:n]
% % scatter(index', yhat, 'b','filled')
% % 
% % Boundary = solve(th*x')==0
% 
% % To demo
% % ------------------------- INFO -------------------------------------
%         % function obj=setClasses(obj,c)
%         % % obj=setClasses(obj,classes) : set the list of class IDs associated with this classifier
%         % %   classes should be a column vector of IDs
%         % 
%         % obj.classes = c;
% % -----------------------------------------------------------------------
learner = logisticClassify2();  % Create "blank" learner
learner = setClasses(learner, unique(YA)); % Define class labels using YA or YB
wts = [0.5 1 -0.25]; % [theta0 theta1 theta2];
learner = setWeights(learner,wts); % Set the learner's parameters

figure(3)
plot2DLinear(learner, XA, YA)
figure(4)
plot2DLinear(learner, XB, YB)

% Part C: Complete predict.m
Y_predict_A = predict(learner,XA);
Y_predict_B = predict(learner,XB);

figure(5)
plotClassify2D(learner,XA,YA);
figure(6)
plotClassify2D(learner,XB,YB);
    
error_A = err(learner, XA, YA)
error_B = err(learner, XB, YB)

% Part E & F: Train Function
% Please comment or uncomment either one for data set A and data set B
      
      %train(learner, XA, YA, 'stopiter', 200, 'stoptol', 0.02);
      %train(learner, XB, YB, 'stopiter', 200, 'stoptol', 0.001);
     



