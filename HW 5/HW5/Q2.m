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

% /////////////////////////////////////////////////////////////////////////
%                            COMMENT
% Matlab's sparse is to reduce the storage needed
% Convert back to standard matrix with a lot of zeros with "full(Xn)"

% row "i" of Xn corresponds to document "i" => 20000101.i.txt
% col "j" corresponds to word "vocab{j}, indicate the fraction of the
% article represented by that word.
%//////////////////////////////////////////////////////////////////////////

% % output the most common words in an article based on its features
% [sorted,order] = sort(Xn(1,:),2,'descend');
% fprintf('Doc %d: ', i);
% fprintf('%s ',vocab{order(1:10)});
% fprintf('\n');

% View a snippet of the article
%     fname = sprintf('data/text/example1/20000101.%04d.txt',i);
%     txt = textread(fname, '%s', 10, 'whitespace', '\r\n');
%     fprintf('%s\n', txt{:});
    
% Part A (Use "kmeans", 20 clusters, compute kmeans cost function(sum of squared distances) 
k=20;
[idx,c,sumd] = kmeans(Xn,k,'farthest',100);
[idx1,c1,sumd1] = kmeans(Xn,k,'random',100);
[idx2,c2,sumd2] = kmeans(Xn,k,'k++',100);

% Part B (Re-run kmeans clustering at least 4 more times, report the cost function)
i = 1;
if (i<=10)
    [idx_b,c_b,sumd_b] = kmeans(Xn,k,'farthest',100);
    [idx1_b,c1_b,sumd1_b] = kmeans(Xn,k,'random',100);
    [idx2_b,c2_b,sumd2_b] = kmeans(Xn,k,'k++',100);
    i= i+1;
end

% Alternative Part B
[z1, c1, sumd_alt1] = kmeans(Xn, 20);
[z2, c2, sumd_alt2] = kmeans(Xn, 20);
[z3, c3, sumd_alt3] = kmeans(Xn, 20);
[z4, c4, sumd_alt4] = kmeans(Xn, 20);
fprintf('sumd_alt1 = %g; sumd_alt2 = %g; sumd_alt3 = %g; sumd_alt4 = %g\n',sumd_alt1, sumd_alt2, sumd_alt3, sumd_alt4);
