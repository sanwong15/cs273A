% Hong San Wong (5732 8824)
% CS 273 A Homework 5)

clear;
clc;
% Problem 3 Part A
X = load('data/faces.txt'); % load face dataset

%     i stands for ith image. Total number of image = length(X)
%     img = reshape(X(i,:),[24 24]); % convert vectorized datum to 24x24 image patch
%     imagesc(img); axis square; colormap gray; % display an image patch; you may have to squint

% Subtract the mean of the face images (X0 = X - mean(X)) to make your data zero-mean.
average=zeros(1,size(X,2));
for i=1:size(X,2)
    average(i) = mean(X(:,i));
end

Xo = zeros(size(X,1),size(X,2));
for i=1:size(X,2)
    Xo(:,i) = X(:,i) - average(i);
end

% Problem 3 Part B
% Take the SVD of the data (Xo = U*S*V')
% * since the number of data is larger than the number of dimensions,S will
% be zero on its lower part
% * Take Xo = W*V (W = U*S)
% use 'svds' => Return ONLY the top K singular values and their associate
% columns of U and V

% According to slices
n = size(X,1);
S = (Xo'*Xo)/n;
singular_val = svds(S);

% Just to confirm result
[V D] = eig(S);
k = 6;
v = V(:,end-k+1:end);
D_check = S*S;
D_diff = D-D_check;   % Comment: D_diff is not zero, I wonder why

[U_svds, S_svds, V_svds] = svds(Xo); % By default, k = 6
D_check1 = S_svds*S_svds;
D_sv = singular_val*singular_val';
W = U_svds*S_svds;
D_diff1 = D_sv-D_check1; % Comment: D_diff1 isn't zero either, I wonder why


% % Problem 3 Part C
% [U1, S1, V1] = svds(Xo,1);
% W1=U1*S1;
% X_hat_1 = W1(:,1)*V1(:,1)';
% mse1 = mean(mean((Xo-X_hat_1).^2));

mse_c = zeros(1,10);
for k=1:10
    [U_c,S_c,V_c] = svds(Xo,k);
    W_c=U_c*S_c;
    X_hat_c = W_c(:,1:k)*V_c(:,1:k)';
    mse_c(k) = mean(mean((Xo-X_hat_c).^2));
    
end

figure(1);
K = [1 2 3 4 5 6 7 8 9 10];
plot(K,mse_c);
title('MSE Plot as a Function of K');
xlabel('K');
ylabel('Mean Square Error');

% % Part D
% % Display the first few principal directions of the data
% % Use k = 3 (i.e. Display the first 3 principal directions)
% 
% [U_d_3,S_d_3,V_d_3] = svds(Xo,3);
% W_d_3=U_d_3*S_d_3;
% W_d_3=W_d_3'
% 
% alpha = zeros(4916,3);
% for i=1:3
%     alpha(i) = 2*median(abs(W_d_3(i,:)));
% end
% mean_d_3 = mean(Xo);
% % for i=1:3
% %      alpha = 2*median(abs(W_d_3(:,i)));
% %      img = reshape((mean_d_3+ alpha*V_d_3_p(:,i)'),[24 24]);
% %      i=i+1;
% %      figure(i+1)
% %      imagesc(img); axis square; colormap gray;
% % end
% 
% V_d_3=V_d_3'
% 
% V_d_3_p=mean_d_3+alpha'*V_d_3;
% for i=1:3
%    img = reshape(V_d_3_p(i,:),[24 24]); % convert vectorized datum to 24x24 image patch
%     figure(i+1); 
%     imagesc(img); axis square; colormap gray; % display an image patch; you may have to squint
% end


