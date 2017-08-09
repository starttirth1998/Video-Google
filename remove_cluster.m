clear;
load('Large_keyframes_cluster.mat');

ncluster = size(C,1);
histcnt = histcounts(idx,ncluster);

[sortedX,I] = sort(histcnt,'descend');

flag = zeros(ncluster,1);

for i=1:floor(0.1*length(I))
    flag(I(i)) = 1;
end

histcnt = histcounts(idx,ncluster);

[sortedX,I] = sort(histcnt,'ascend');

for i=1:floor(0.05*length(I))
    flag(I(i)) = 1;
end

%cluster = zeros(ncluster-floor(0.15*length(I)),128);
cnt = 1;
for i=1:ncluster
    if(flag(i) == 0)
        cluster(cnt,:) = C(i,:);
        cnt = cnt+1;
    end
end

save('Large_keyframes_new_cluster.mat','cluster');