function Yte = predict(obj,Xte)
% Yhat = predict(obj, X)  : make predictions on test data X

% (1) make predictions based on the sign of wts(1) + wts(2)*x(:,1) + ...
% (2) convert predictions to saved classes: Yte = obj.classes( [1 or 2] );

        % % From predict.m of LinearRegression
        % % Yhat = predict(learner, Xtest) : make a prediction using the learned linear regression coefficients
        %   Xte = [ones(size(Xte,1),1) Xte];    % extend features by including a constant feature
        %   Yte = Xte * obj.theta';
        
% STEP (1) make predictions based on the sign of wts(1) + wts(2)*x(:,1) + ...
predict_sign = sign(obj.wts(1) + obj.wts(2)*Xte(:,1) + obj.wts(3)*Xte(:,2));
% STEP (2) convert predictions to saved classes: Yte = obj.classes( [1 or 2] );
Y_positive = find(predict_sign == 1);
Y_negative = find(predict_sign == -1);

[n,d]=size(Xte);
Yte = zeros (n,1);

Yte(Y_positive) = obj.classes(2);
Yte(Y_negative) = obj.classes(1);

Yte;
