load('Large_keyframes.mat');
n = length(keyframes);

for i=1:n
    imshow(keyframes{i});
end