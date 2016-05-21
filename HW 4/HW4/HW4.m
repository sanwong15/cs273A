% HONG SAN WONG (57328824)
% CS 273A HW4

clc;
clear;
% Problem 1
iris=load('data/iris.txt');
X = iris(:,1:2); Y = iris(:,end);
XA = X(Y<2,:);  YA=Y(Y<2)*2-1;

% Use either "quadprog" "qp" to solve SVM quadratic program
    % quadprog Quadratic programming. 
%     X = quadprog(H,f,A,b) attempts to solve the quadratic programming 
%     problem:
%  
%              min 0.5*x'*H*x + f'*x   subject to:  A*x <= b 
%               x    

% X = quadprog(H,f,A,b,Aeq,beq,LB,UB) defines a set of lower and upper
%     bounds on the design variables, X, so that the solution is in the 
%     range LB <= X <= UB. Use empty matrices for LB and UB if no bounds 
%     exist. Set LB(i) = -Inf if X(i) is unbounded below; set UB(i) = Inf if 
%     X(i) is unbounded above.

% Primal
H = [2 0 0; 0 2 0; 0 0 0];
f = zeros(3,1);
B = 0;
%x = [w1 w2 B];
b = -ones(size(XA,1),1)

A_temp1 = zeros(size(XA,1),2);
for i= 1: size(XA,1)
    for j=1:2
        A_temp1(i,j) = XA(i,j)*YA(i,:);
    end
end

%A_temp2 = B*ones(size(XA,1),1)
A_temp2 = YA
A = -[A_temp1 A_temp2];

W = quadprog(H,f,A,b)

% Boundary Plot for Primal
learner = logisticClassify();
learner = setClasses(learner, unique(YA));
weights = [W(3) W(1) W(2)];
learner = setWeights(learner, weights);

figure(1)
plotClassify2D(learner,XA,YA)

% Dual
K = XA*XA'% Gram Matrix: K =V'V
f_d = -ones(size(XA,1),1);
%H_d = YA*YA'*K;
H_d = diag(YA)*K*diag(YA);
A_d = zeros(99,99);
A_d(1,:) = YA;
b_d = zeros(size(XA,1),1);
Aeq_d = A_d;
beq_d = b_d;
lb = 0;
up = inf;

 W_d = quadprog(H_d,f_d,Aeq_d,beq_d,lb);

% Identify support vector
% Boundary Plot for Dual

% Problem 3
% Split Data
% kaggle_x1_train=load('data/kaggle.X1.train.txt');
% kaggle_x2_train=load('data/kaggle.X2.train.txt');
% kaggle_y_train=load('data/kaggle.Y.train.txt');
% [kaggle_x1_train kaggle_y_train] = shuffleData(kaggle_x1_train, kaggle_y_train);
% [kaggle_x2_train kaggle_y_train] = shuffleData(kaggle_x2_train, kaggle_y_train);
% [kaggle_x1_train_tr kaggle_x1_train_va kaggle_y_train_tr kaggle_y_train_va] = splitData(kapple_x1_train, kapple_y_train ,.75);
% [kaggle_x2_train_tr kaggle_x2_train_va kaggle_y_train_tr kaggle_y_train_va] = splitData(kapple_x2_train, kapple_y_train, .75);
% 
% dt = treeRegress(kaggle_x1_train_tr, kaggle_y_train_tr, 'maxDepth', 20);
% dt = treeRegress(kaggle_x2_train_tr, kaggle_y_train_tr, 'maxDepth', 20);
% 
% Problem 4 (Random Forests)

