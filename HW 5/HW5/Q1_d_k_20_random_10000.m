% Hong San Wong (5732 8824)
% CS 273 A Homework 5)

clear;
clc;

% Problem 1
% Part D (Run Gaussian Mixture model with  5 and 20 components)
% k = 20
% * Doens't have to try diff initizations
iris = load('data/iris.txt');
X = iris(:,1:2);
X1 = iris(:,1);
X2 = iris(:,2);
Y = iris(:, end);

% [z,T,soft,ll] = emCluster(X,K,cInit,nIter,tol)z
% 
% % [assign, clusters, soft, loglikelihd] = emCluster(X, K [,initialize,nIter,tol])
% % Perform Gaussian mixture EM clustering on data X (# data x # features)
% %   initial clusters can be [K x N], or a method {'random', 'farthest', 'k++'}
% %     random  : K random data points (uniformly) as clusters; 
% %     farthest: choose cluster 1 uniformly, then the point farthest from all clusters so far, etc.
% %     k++     : choose cluster 1 uniformly, then points randomly proportional to distance from current clusters
% % Returns: 
% %   assign (# data x 1) index of cluster
% %   clusters (struct): wt (Kx1), mu (K x # features), sig(#feat,#nfeat,K) : Gaussian component parameters
% %   soft (#data x K) : soft assignment probabilities (rounded for assign)
% %   loglikelihd (scalar) log-likelihood of the data under the returned model
% % Returns after nIter iterations (default 100) or when converged to tolerance tol (default 1e-6)
% %
% % To convert clusters into a "clustering rule" that can be applied to future data, use the Gaussian Bayes methods:
% %   (TODO)

K = 20;
tol = 1e-6;
[z,T,soft,ll] = emCluster(X,K,'random',10000,tol);
