% Hong San Wong (5732 8824)
% CS 273 A Homework 5)

clear;
clc;

% Problem 1
% Part C (Run agglomerative clustering on the data using single linkage and
% complete linkage)
% k = 20
% * Doens't have to try diff initizations
iris = load('data/iris.txt');
X = iris(:,1:2);
X1 = iris(:,1);
X2 = iris(:,2);
Y = iris(:, end);

k=20;
% [z join] = agglomCluster(X,nClust,method,join)
% [z, join] = hcluster(X,K,method, [,join]) : perform heirarchical agglomerative clustering
%   z = assignment of data into K clusters
%   method = {'min','max,'means','average'}  : cluster distance / linkage type (single,complete,mean,avg)
%   join = sequence of joining operations performed by hcluster (pass to avoid re-clustering for new K)

[z] = agglomCluster(X,k,'min'); %'min' refer to single
fig(1); 
plotClassify2D([],X,z); 
hold on;
% plot(c(:,1),c(:,2),'kx','markersize',14,'linewidth',3);
hold off;