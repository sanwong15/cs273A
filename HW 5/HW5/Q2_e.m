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

% Part A (Use "kmeans", 40 clusters, compute kmeans cost function(sum of squared distances) 
k=40;   % use twice the cluster
[idx,c,sumd] = kmeans(Xn,k,'farthest',100);
[idx1,c1,sumd1] = kmeans(Xn,k,'random',100);
[idx2,c2,sumd2] = kmeans(Xn,k,'k++',100);

% Alternative Part B
[z1, c1, sumd_alt1] = kmeans(Xn, 40);
[z2, c2, sumd_alt2] = kmeans(Xn, 40);
[z3, c3, sumd_alt3] = kmeans(Xn, 40);
[z4, c4, sumd_alt4] = kmeans(Xn, 40);
fprintf('sumd_alt1 = %g; sumd_alt2 = %g; sumd_alt3 = %g; sumd_alt4 = %g\n',sumd_alt1, sumd_alt2, sumd_alt3, sumd_alt4);

% Part C
% For each cluster (Here, it returns the count (i.e. number of elememts) in
% each cluster)
count1 = zeros(1,40);  % count1 refer to count for kmeans (with 'farthest' initialzation
for i=1:40
   count1(i) = sum(idx == i); % idx refer to 'assign (# data x 1) index of cluster'
end

count2 = zeros(1,40);  % count2 refer to count for kmeans (with 'random' initialzation
for i=1:40
   count2(i) = sum(idx1 == i);
end

count3 = zeros(1,40);  % count3 refer to count for kmeans (with 'k++' initialzation
for i=1:40
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

% Part D
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
