% Hong San Wong (5732 8824)
% CS 273 A Homework 5)

clear;
clc;

% Problem 1
% Part A
    % Load Iris Data restricted to the first two features
    % Plot the data and see how clustered it is
iris = load('data/iris.txt');
X = iris(:,1:2);
X1 = iris(:,1);
X2 = iris(:,2);
Y = iris(:, end);

figure (1)
scatter(X1,X2)
title('Feature 1 and Feature 2 Data Scatter Plot')
xlabel('Feature 1')
ylabel('Feature 2')

% Part B
    % Run k-mean on the data for k = 5 and k = 20
    % Reture colored data plot

% /////////////////////////////////////////////////////////////////////////
k1 = 5;
% Step 0 (select 5 center points randomly)
r = randi(148,k1,1);
for k=1:k1
    center(k,1) = X(r(k),1);
    center(k,2) = X(r(k),2);
end

% Step 1: Choose optimal "a" for a fixed u (i.e. Updating the assignment of
% data to clusters
% Assign xi to the nearest ui (center)
% for k=1:length(X)
%     
% end



% /////////////////////////////////////////////////////////////////////////
%                           INFO (2013a)
% [assign, clusters, sumd] = kmeans(X, K [,initialClusters,nIter])
%   Perform K-means clustering on data X (# data x # features)
%     initial clusters can be [K x N], or a method {'random', 'farthest', 'k++'}
%       random  : K random data points (uniformly) as clusters; 
%       farthest: choose cluster 1 uniformly, then the point farthest from all clusters so far, etc.
%       k++     : choose cluster 1 uniformly, then points randomly proportional to distance from current clusters
%   Returns: 
%     assign (# data x 1) index of cluster
%     clusters (K x # features) cluster centers
%     sumd   (scalar) sum of squared euclidean distances
%   Returns after nIter iterations (default 100) or when converged
%  
%   To convert clusters into a "clustering rule" that can be applied to future data, use the knn methods:
%     crule = knnClassify( clusters, (1:K)', 1 );  z = predict( crule, X );
% /////////////////////////////////////////////////////////////////////////

% [z,c,sumd] = kmeans(X,K,cInit,nIter)

% [idx,C,sumd] = kmeans(X,5);  % idx is a vector of predicted cluster indices corresponding to the observations in X
                        % C is a 5x2 matrix containing the final centroid
                        % locations
figure(2)
 [idx,c,sumd] = kmeans(X,k1,'k++',10000);                       
                        
% % Plot with scatterplot
% figure (2);
% gscatter(X(:,1),X(:,2),idx);
% scatterplot(X(:,1),X(:,2));
% title 'k=5 ; n=1';
% xlabel 'Feature 1';
% ylabel 'Feature 2';
                     
% [idx1,C1,sumd1] = kmeans(X,20);  
% figure (3);
% gscatter(X_20(:,1),X_20(:,2),idx1);
% scatterplot(X_20(:,1),X_20(:,2));
% title 'k=20';
% xlabel 'Feature 1';
% ylabel 'Feature 2';
