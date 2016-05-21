function plot2DLinear(obj, X, Y)
% plot2DLinear(obj, X,Y)
%   plot a linear classifier (data and decision boundary) when features X are 2-dim
%   wts are 1x3,  wts(1)+wts(2)*X(1)+wts(3)*X(2)

% Plot the two classes of data in different colors, along with the decision
% boundary
%
  [n,d] = size(X);
  if (d~=2) 
      error('Sorry -- plot2DLogistic only works on 2D data...'); 
  end;
 
% % Decision Boundary
% % features vector x = [x1, x2, ..... xd]
% % Weight/Parameter vector th = [th1, th2, th3 .... thd]
% % f = th*x'; f = sum(th.*x); yhat=sign(f);
% 
% th = [0.5 1 -0.25];
% f = zeros[n,d+1];
% for i=1:n
%     x = [1, X(i,1) X(i,2)];
%     f(i,:) = th*x';
%     f (i,:)= sum(th.*x);
% end
  %%% TODO: Fill in the rest of this function...  
  
  hold on;
  scatter(X(:,1),X(:,2), [], Y, 'filled');
  xlabel('Feature 1')
  ylabel('Feature 2')
  
  % Let's plot the decision boundry
  % Want to plot wts(0) + wts(1)*x(1) + wts(2)*x(2) = 0
  % wts(2)*x(2) = -(wts(0) + wts(1)*x(1))
  % x(2) = (-1/wts(2))*(wts(0) + wts(1)*x(1))

 x1 = min(X):0.025:max(X);
 x2 = (-1/obj.wts(3))*(obj.wts(1) + obj.wts(2)*x1);
 plot(x1,x2)
 hold off;
 
%------------------------From plot1DLinear--------------------------------
%  xplt = linspace(min(X), max(X), 200)';
%   c0 = find(Y==obj.classes(1)); c1=find(Y==obj.classes(2));
%   fig(2); plot(X(c0),Y(c0),'bo',X(c1),Y(c1),'rs', ...
%      xplt,obj.wts(1)+obj.wts(2:end)*xplt,'g-',  xplt,logistic(obj,xplt),'k-');
