clear;
load('Large_keyframes_1.mat');
load('Large_keyframes_2.mat');

n = length(keyframes_1);
cnt = 1;
for i=1:n
    keyframes{cnt} = keyframes_1{i};
    keyframes_features{cnt} = keyframes_features_1{i};
    cnt = cnt + 1;
end

n = length(keyframes_2);
for i=1:n
    keyframes{cnt} = keyframes_2{i};
    keyframes_features{cnt} = keyframes_features_2{i};
    cnt = cnt + 1;
end

save('Large_keyframes.mat','keyframes','keyframes_features');