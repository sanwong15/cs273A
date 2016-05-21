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

% Part D (Look at the cluster assignments for the documents, and find the cluster(s) associated with
% documents 1, 15, and 30. For each of these clusters, find all the documents in that cluster (or
% at least 12 of them, if there are a lot) and print out the first several lines of each document.
% Do the documents form coherent groups? Based on the words you saw in the previous part,
% is this the best cluster for those documents?

k=20;
[idx,c,sumd] = kmeans(Xn,k,'farthest',100);
[idx1,c1,sumd1] = kmeans(Xn,k,'random',100);
[idx2,c2,sumd2] = kmeans(Xn,k,'k++',100);
% Returns: 
%   assign (# data x 1) index of cluster
%   clusters (K x # features) cluster centers
%   sumd   (scalar) sum of squared euclidean distances
% Returns after nIter iterations (default 100) or when converged

cluster_assign_farthest_1 = idx(1);
cluster_assign_farthest_15 = idx(15);
cluster_assign_farthest_30 = idx(30);

cluster_assign_random_1 = idx1(1);
cluster_assign_random_15 = idx1(15);
cluster_assign_random_30 = idx1(30);

cluster_assign_kpp_1 = idx2(1);
cluster_assign_kpp_15 = idx2(15);
cluster_assign_kpp_30 = idx2(30);

% Find all document in these cluster
address_farthest_1 = find(idx == cluster_assign_farthest_1);
address_farthest_15 = find(idx == cluster_assign_farthest_15);
address_farthest_30 = find(idx == cluster_assign_farthest_30);

address_random_1 = find(idx == cluster_assign_random_1);
address_random_15 = find(idx == cluster_assign_random_15);
address_random_30 = find(idx == cluster_assign_random_30);

address_kpp_1 = find(idx == cluster_assign_kpp_1);
address_kpp_15 = find(idx == cluster_assign_kpp_15);
address_kpp_30 = find(idx == cluster_assign_kpp_30);

% Pick 12 document from each cluster
selected_doc_farthest_1 = datasample(address_farthest_1,12);
selected_doc_farthest_15 = datasample(address_farthest_15,12);
selected_doc_farthest_30 = datasample(address_farthest_15,12);

selected_doc_random_1 = datasample(address_random_1,12);
selected_doc_random_15 = datasample(address_random_15,12);
selected_doc_random_30 = datasample(address_random_30,12);

selected_doc_kpp_1 = datasample(address_kpp_1,12);
selected_doc_kpp_15 = datasample(address_kpp_15,12);
selected_doc_kpp_30 = datasample(address_kpp_30,12);

% View a snippet of the article (With 'farthest' method)
for j=1:12
    i = selected_doc_farthest_1(j);
    fname = sprintf('data/text/example1/20000101.%04d.txt',i);
    txt = textread(fname, '%s', 10, 'whitespace', '\r\n');
    fprintf('Doc_farthest_1 %d: ', j);
    fprintf('%s\n', txt{:});
end 

for j=1:12
    i = selected_doc_farthest_15(j);
    fname = sprintf('data/text/example1/20000101.%04d.txt',i);
    txt = textread(fname, '%s', 10, 'whitespace', '\r\n');
    fprintf('Doc_farthest_15 %d: ', j);
    fprintf('%s\n', txt{:});
end 

for j=1:12
    i = selected_doc_farthest_30(j);
    fname = sprintf('data/text/example1/20000101.%04d.txt',i);
    txt = textread(fname, '%s', 10, 'whitespace', '\r\n');
    fprintf('Doc_farthest_30 %d: ', j);
    fprintf('%s\n', txt{:});
end 

% View a snippet of the article (With 'random' method)
for j=1:12
    i = selected_doc_random_1(j);
    fname = sprintf('data/text/example1/20000101.%04d.txt',i);
    txt = textread(fname, '%s', 10, 'whitespace', '\r\n');
    fprintf('Doc_random_1 %d: ', j);
    fprintf('%s\n', txt{:});
end 

for j=1:12
    i = selected_doc_random_15(j);
    fname = sprintf('data/text/example1/20000101.%04d.txt',i);
    txt = textread(fname, '%s', 10, 'whitespace', '\r\n');
    fprintf('Doc_random_15 %d: ', j);
    fprintf('%s\n', txt{:});
end 

for j=1:12
    i = selected_doc_random_30(j);
    fname = sprintf('data/text/example1/20000101.%04d.txt',i);
    txt = textread(fname, '%s', 10, 'whitespace', '\r\n');
    fprintf('Doc_random_30 %d: ', j);
    fprintf('%s\n', txt{:});
end

% View a snippet of the article (With 'kpp' method)
for j=1:12
    i = selected_doc_kpp_1(j);
    fname = sprintf('data/text/example1/20000101.%04d.txt',i);
    txt = textread(fname, '%s', 10, 'whitespace', '\r\n');
    fprintf('Doc_kpp_1 %d: ', j);
    fprintf('%s\n', txt{:});
end 

for j=1:12
    i = selected_doc_kpp_15(j);
    fname = sprintf('data/text/example1/20000101.%04d.txt',i);
    txt = textread(fname, '%s', 10, 'whitespace', '\r\n');
    fprintf('Doc_kpp_15 %d: ', j);
    fprintf('%s\n', txt{:});
end 

for j=1:12
    i = selected_doc_kpp_30(j);
    fname = sprintf('data/text/example1/20000101.%04d.txt',i);
    txt = textread(fname, '%s', 10, 'whitespace', '\r\n');
    fprintf('Doc_kpp_30 %d: ', j);
    fprintf('%s\n', txt{:});
end 
