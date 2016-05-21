% Hong San Wong (5732 8824)
% CS 273 A Homework 5)

clear;
clc;

% Read in vocabulary and data (word counts per document)
[vocab] = textread('data/text/vocab.txt','%s');
[did,wid,cnt] = textread('data/text/docword.txt','%d%d%d','headerlines',3);
X = sparse(did,wid,cnt); % convert to a matlab sparse matrix
D = max(did); % number of docs
W = max(wid); % size of vocab
N = sum(cnt); % total number of words
% It is often helpful to normalize by the document length:
Xn= X./ repmat(sum(X,2),[1,W]) ; % divide word counts by doc length

% Part C (How many articles (documents) are associated with each cluster)
% (Cluster is described by a vector in the feature space (word freq) =>
%  print out the cluster center's ten "most likely" words)
% Do they form interpretable sets

k=20;
[idx,c,sumd] = kmeans(Xn,k,'farthest',100);
[idx1,c1,sumd1] = kmeans(Xn,k,'random',100);
[idx2,c2,sumd2] = kmeans(Xn,k,'k++',100);
% Returns: 
%   assign (# data x 1) index of cluster
%   clusters (K x # features) cluster centers
%   sumd   (scalar) sum of squared euclidean distances
% Returns after nIter iterations (default 100) or when converged

% For each cluster (Here, it returns the count (i.e. number of elememts) in
% each cluster)
count1 = zeros(1,20);  % count1 refer to count for kmeans (with 'farthest' initialzation
for i=1:20
   count1(i) = sum(idx == i); % idx refer to 'assign (# data x 1) index of cluster'
end

count2 = zeros(1,20);  % count2 refer to count for kmeans (with 'random' initialzation
for i=1:20
   count2(i) = sum(idx1 == i);
end

count3 = zeros(1,20);  % count3 refer to count for kmeans (with 'k++' initialzation
for i=1:20
   count3(i) = sum(idx == i);
end

% output the 10 most common words in an article based on its features
[sorted,order] = sort(c(1,:),2,'descend');
fprintf('Ten "most likely" words for count1 %d: ', i);
fprintf('%s ',vocab{order(1:10)});
fprintf('\n');

[sorted,order] = sort(c1(1,:),2,'descend');
fprintf('Ten "most likely" words for count2 %d: ', i);
fprintf('%s ',vocab{order(1:10)});
fprintf('\n');

[sorted,order] = sort(c2(1,:),2,'descend');
fprintf('Ten "most likely" words for count3 %d: ', i);
fprintf('%s ',vocab{order(1:10)});
fprintf('\n');