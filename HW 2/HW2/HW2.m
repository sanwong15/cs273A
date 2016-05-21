% HONG SAN WONG (57328824)
% CS 273A

%----------------------------  PROBLEM 1  ------------------------%

close;
clc;
clear;

load 'data/curve80.txt'

% PART A: (Split the data into 75% for training, 25% for testing

data_tr = curve80(1:60,:);
data_te = curve80(61:80,:);
Xtr = data_tr(:,1);
Xte = data_te(:,1);
Ytr = data_tr(:,2);
Yte = data_te(:,2);

% PART B: Use "linearRegress" to create a linear regression predictor of y
% given x. Plot the resulting function by evaluating th emodel at a large
% number of x values, xs

lr = linearRegress(Xtr,Ytr); % Create and train model
xs = [0: .05: 10]'; % Densely sample possible x-values: note transpose
ys = predict( lr, xs);

% Plot the training data with predition function in a single plot
figure (1)
hold on;
scatter(Xtr,Ytr,'r')
plot(xs,ys)
hold off;

% Calculate and report MSE
MSE_te = mse(lr,Xte,Yte)   %MSE on Test Data
MSE_tr = mse(lr,Xtr,Ytr)   %MSE on Train Data

% PART C: Try fitting y = f(x) using a polynomial function f(x) of
% increasing order

% degree;
% Phi = @(x) rescale(fpoly(x,degree,false), M,S);

% Add the all-one constant feature
degree = 1;
XtrP = fpoly(Xtr,degree,false); %create poly features up to given degree; no "1" feature
[XtrP, M,S] = rescale(XtrP); % Rescale the features
lr_P = linearRegress( XtrP,Ytr); %Create and Train model
XteP = rescale( fpoly(Xte,degree,false), M,S); %Apply the same polynomial expansion & scaling to Xtest
ys_P_1 = predict( lr_P, rescale( fpoly(xs,degree,false), M,S));

MSE_te_1 = mse(lr_P,XteP,Yte)   %MSE on Test Data
MSE_tr_1 = mse(lr_P,XtrP,Ytr)   %MSE on Train Data
figure (2)
hold on;
scatter(Xtr,Ytr,'r')
plot(xs,ys_P_1)
hold off;

degree = 3;
XtrP = fpoly(Xtr,degree,false); %create poly features up to given degree; no "1" feature
[XtrP, M,S] = rescale(XtrP); % Rescale the features
lr_P = linearRegress( XtrP,Ytr); %Create and Train model
XteP = rescale( fpoly(Xte,degree,false), M,S); %Apply the same polynomial expansion & scaling to Xtest
ys_P_3 = predict( lr_P,rescale( fpoly(xs,degree,false), M,S));
MSE_te_3 = mse(lr_P,XteP,Yte)   %MSE on Test Data
MSE_tr_3 = mse(lr_P,XtrP,Ytr)   %MSE on Train Data
figure (3)
hold on;
scatter(Xtr,Ytr,'r')
plot(xs,ys_P_3)
hold off;

degree = 5;
XtrP = fpoly(Xtr,degree,false); %create poly features up to given degree; no "1" feature
[XtrP, M,S] = rescale(XtrP); % Rescale the features
lr_P = linearRegress( XtrP,Ytr); %Create and Train model
XteP = rescale( fpoly(Xte,degree,false), M,S); %Apply the same polynomial expansion & scaling to Xtest
ys_P_5 = predict( lr_P, rescale( fpoly(xs,degree,false), M,S));
MSE_te_5 = mse(lr_P,XteP,Yte)   %MSE on Test Data
MSE_tr_5 = mse(lr_P,XtrP,Ytr)   %MSE on Train Data
figure (4)
hold on;
scatter(Xtr,Ytr,'r')
plot(xs, ys_P_5)
hold off;

degree = 7;
XtrP = fpoly(Xtr,degree,false); %create poly features up to given degree; no "1" feature
[XtrP, M,S] = rescale(XtrP); % Rescale the features
lr_P = linearRegress( XtrP,Ytr); %Create and Train model
XteP = rescale( fpoly(Xte,degree,false), M,S); %Apply the same polynomial expansion & scaling to Xtest
ys_P_7 = predict( lr_P, rescale( fpoly(xs,degree,false), M,S));
MSE_te_7 = mse(lr_P,XteP,Yte)   %MSE on Test Data
MSE_tr_7= mse(lr_P,XtrP,Ytr)   %MSE on Train Data
figure (5)
hold on;
scatter(Xtr,Ytr,'r')
plot(xs, ys_P_7)
hold off;

degree = 10;
XtrP = fpoly(Xtr,degree,false); %create poly features up to given degree; no "1" feature
[XtrP, M,S] = rescale(XtrP); % Rescale the features
lr_P = linearRegress( XtrP,Ytr); %Create and Train model
XteP = rescale( fpoly(Xte,degree,false), M,S); %Apply the same polynomial expansion & scaling to Xtest
ys_P_10 = predict( lr_P, rescale( fpoly(xs,degree,false), M,S));
MSE_te_10 = mse(lr_P,XteP,Yte)   %MSE on Test Data
MSE_tr_10 = mse(lr_P,XtrP,Ytr)   %MSE on Train Data
figure (6)
hold on;
scatter(Xtr,Ytr,'r')
plot(xs, ys_P_10)
hold off;

degree = 18;
XtrP = fpoly(Xtr,degree,false); %create poly features up to given degree; no "1" feature
[XtrP, M,S] = rescale(XtrP); % Rescale the features
lr_P = linearRegress( XtrP,Ytr); %Create and Train model
XteP = rescale( fpoly(Xte,degree,false), M,S); %Apply the same polynomial expansion & scaling to Xtest
ys_P_18 = predict( lr_P, rescale( fpoly(xs,degree,false), M,S));
MSE_te_18 = mse(lr_P,XteP,Yte)   %MSE on Test Data
MSE_tr_18 = mse(lr_P,XtrP,Ytr)   %MSE on Train Data
figure (7)
hold on;
scatter(Xtr,Ytr,'r')
plot(xs, ys_P_18)
hold off;

d = [1 3 5 7 10 18];
% Define MSE_tr array
MSE_tr_array = [MSE_tr_1 MSE_tr_3 MSE_tr_5 MSE_tr_7 MSE_tr_10 MSE_tr_18];
% Define MSE_te array
MSE_te_array = [MSE_te_1 MSE_te_3 MSE_te_5 MSE_te_7 MSE_te_10 MSE_te_18];
figure(8)
hold on;
semilogy(d, MSE_tr_array, 'b')
semilogy(d, MSE_te_array, 'g')
hold off;

%----------------------------  PROBLEM 2  ------------------------%
% 5-fold validations

% "crossValidation" split data for n-fold cross validation
% [xTrain xTest yTrain yTest] = crossValidat(X,Y,nFolds,iFold) splits the (X,Y) data into the i-th of n folds

% STEP 1: Train Xtr from the previous problem, find the 5-fold crossvalidation MSE
% if linear regression at the same degree. d=[1,2,5,7,10,18]
% STEP 2: Plot the cross-validation error with semilogy

nFolds = 5;
for iFold = 1:nFolds,
    % Xti = xTrain for cross-validation
    % Xvi = xTest for cross-validation
    % Yti = yTrain for cross-validation
    % Yvi = yTest for cross-validation
    
    % STEP 1: Split data for n-fold cross validation with Xtr in problem 1
    [Xti, Xvi, Yti, Yvi] = crossValidate(Xtr,Ytr,nFolds,iFold);  %Take ith data block as validation
    
    % Consider degree = 1
    degree = 1;
    XtiP_1 = fpoly(Xti,degree,false); %create poly features up to given degree; no "1" feature
    [XtiP_1, M,S] = rescale(XtiP_1); % Rescale the features
    XviP_1 = fpoly(Xvi,degree,false); %create poly features up to given degree; no "1" feature
    [XviP_1, M,S] = rescale(XviP_1); % Rescale the features

    % LinearRegress intake train data: Xti; Yti
    learner_1 = linearRegress(XtiP_1,Yti); % ToDo: Train on Xti, Yti, the data for this fold
    J_1(iFold) = mse(learner_1,XviP_1,Yvi)% ToDo: Now compute the MSE on Xvi, Yvi, and save it

end;
% The overall estimated validation performance is the average of the
% performance on each fold
J_mean_1 = mean(J_1)


nFolds = 5;
for iFold = 1:nFolds,
    [Xti, Xvi, Yti, Yvi] = crossValidate(Xtr,Ytr,nFolds,iFold);  %Take ith data block as validation
    
    % Consider degree = 3
    degree = 3;
    XtiP_3 = fpoly(Xti,degree,false); 
    [XtiP_3, M,S] = rescale(XtiP_3); 
    XviP_3 = fpoly(Xvi,degree,false); 
    [XviP_3, M,S] = rescale(XviP_3); 
    % LinearRegress intake train data: Xti; Yti
    learner_3 = linearRegress(XtiP_3,Yti);
    J_3(iFold) = mse(learner_3,XviP_3,Yvi)
    
end;
J_mean_3 = mean(J_3)

nFolds = 5;
for iFold = 1:nFolds,
    [Xti, Xvi, Yti, Yvi] = crossValidate(Xtr,Ytr,nFolds,iFold);  %Take ith data block as validation
    
    % Consider degree = 5
    degree = 5;
    XtiP_5 = fpoly(Xti,degree,false); 
    [XtiP_5, M,S] = rescale(XtiP_5); 
    XviP_5 = fpoly(Xvi,degree,false); 
    [XviP_5, M,S] = rescale(XviP_5); 
    % LinearRegress intake train data: Xti; Yti
    learner_5 = linearRegress(XtiP_5,Yti);
    J_5(iFold) = mse(learner_5,XviP_5,Yvi)
    
end;
J_mean_5 = mean(J_5)

nFolds = 5;
for iFold = 1:nFolds,
    [Xti, Xvi, Yti, Yvi] = crossValidate(Xtr,Ytr,nFolds,iFold);  %Take ith data block as validation
    
    % Consider degree = 7
    degree = 7;
    XtiP_7 = fpoly(Xti,degree,false); 
    [XtiP_7, M,S] = rescale(XtiP_7); 
    XviP_7 = fpoly(Xvi,degree,false); 
    [XviP_7, M,S] = rescale(XviP_7); 
    % LinearRegress intake train data: Xti; Yti
    learner_7 = linearRegress(XtiP_7,Yti);
    J_7(iFold) = mse(learner_7,XviP_7,Yvi)
    
end;
J_mean_7 = mean(J_7)

nFolds = 5;
for iFold = 1:nFolds,
    [Xti, Xvi, Yti, Yvi] = crossValidate(Xtr,Ytr,nFolds,iFold);  %Take ith data block as validation
    
    % Consider degree = 10
    degree = 10;
    XtiP_10 = fpoly(Xti,degree,false); 
    [XtiP_10, M,S] = rescale(XtiP_10); 
    XviP_10 = fpoly(Xvi,degree,false); 
    [XviP_10, M,S] = rescale(XviP_10); 
    % LinearRegress intake train data: Xti; Yti
    learner_10 = linearRegress(XtiP_10,Yti);
    J_10(iFold) = mse(learner_10,XviP_10,Yvi)
    
end;
J_mean_10 = mean(J_10)


nFolds = 5;
for iFold = 1:nFolds,
    [Xti, Xvi, Yti, Yvi] = crossValidate(Xtr,Ytr,nFolds,iFold);  %Take ith data block as validation
    
    % Consider degree = 18
    degree = 18;
    XtiP_18 = fpoly(Xti,degree,false); 
    [XtiP_18, M,S] = rescale(XtiP_18); 
    XviP_18 = fpoly(Xvi,degree,false); 
    [XviP_18, M,S] = rescale(XviP_18); 
    % LinearRegress intake train data: Xti; Yti
    learner_18 = linearRegress(XtiP_18,Yti);
    J_18(iFold) = mse(learner_18,XviP_18,Yvi)
    
end;
J_mean_18 = mean(J_18)
J_mean_array = [J_mean_1 J_mean_3 J_mean_5 J_mean_7 J_mean_10 J_mean_18]
figure (9)
semilogy(J_mean_array)

