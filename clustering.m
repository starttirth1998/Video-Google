clear;
load('Large_keyframes.mat','keyframes_features');

X1 = [keyframes_features{1,:}];

ncluster = 100;

[idx,C] = kmeans(double(X1'),ncluster,'Maxiter',100,'Display','iter');

save('Large_keyframes_cluster.mat','idx','C');