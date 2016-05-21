clc;
clear;

%iris=load('D:\Documents (D)\Google Drive\UCI Grad School School Work\CS 273A\HW\HW 1\HW1\data\iris.txt');
 iris=load('D:\Document (Shared)\Google Drive\UCI Grad School School Work\CS 273A\HW\HW 1\HW1\data\iris.txt');
y=iris(:,end);;
x=iris(:,1:end-1);
whos

% Part A: Use size(x,2) to get the number of features, size(x,1) to get
% number of data points

num_features = size(x,2)
num_datapt = size(x,1)

% Part B: plot a histogram for each features

 for i=1:4
     figure(i)
    feature = iris(:,i);
    hist(feature)
    %saveas(hist(feature),sprintf('Histoplot_feature%d.png',i)); % will create Histoplot_feature1, Histoplot_feature2,...
 end

 
 % Part C: Compute the mean of each featuers
 mean_1 = mean(iris(:,1))
 mean_2 = mean(iris(:,2))
 mean_3 = mean(iris(:,3))
 mean_4 = mean(iris(:,4))
 
 
 % Part D: Compute the cariance and SD of data points for each fearures
 v_1 = var(iris(:,1))
 v_2 = var(iris(:,2))
 v_3 = var(iris(:,3))
 v_4 = var(iris(:,4))
 
 
 std_1 = std(iris(:,1))
 std_2 = std(iris(:,2))
 std_3 = std(iris(:,3))
 std_4 = std(iris(:,4))

 
 % Part E: "Normalize" data by subtracking the mean value from each
 % fearure, divide by its SD
 
 for i=1:4
     mean(iris(:,i))
     std(iris(:,i))
    for j=1:148
     iris_n(j,i) = (iris(j,i)-mean(iris(:,i)))/std(iris(:,i));
    end
 end
 
 % Part F
 % hold on;
 figure (6)
 plot(iris(:,1), 'r+')
 figure (7)
 plot(iris(:,2), 'b+')
 figure (8)
 plot(iris(:,3), 'g+')
 figure (9)
 plot(iris(:,4), 'c+')

 
%  hold off;
%  
%  figure (11)
%   plot(iris(:,1),iris(:,2),iris(:,3),iris(:,4),iris(:,5))

 figure (10)
 plot(iris_n(:,1), 'ro')
 figure (11)
 plot(iris_n(:,2), 'bo')
 figure (12)
 plot(iris_n(:,3), 'go')
 figure (13)
 plot(iris_n(:,4), 'co')

 % Misunderstood Part F, Redo Part F: Features (1,2) (1,3) (1,4)
 figure (14)
 hold on;
 scatter(iris_n(:,1),iris_n(:,2), 'r+')
 scatter(iris_n(:,1),iris_n(:,3), 'g+')
 scatter(iris_n(:,1),iris_n(:,4), 'b+')
 