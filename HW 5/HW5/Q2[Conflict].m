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

% output the most common words in an article based on its features
[sorted,order] = sort(Xn(1,:),2,'descend');
fprintf('Doc %d: ', i);
fprintf('%s ',vocab{order(1:10)});
fprintf('\n');

% View a snippet of the article
fname = sprintf('data/text/example1/20000101.%04d.txt',i);
% txt = textread(fname, '%s', 10, 'whitespace', '\r\n');
% fprintf('%s\n', txt{:});
