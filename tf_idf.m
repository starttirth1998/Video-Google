clear;
load('Large_keyframes.mat');
load('Large_keyframes_new_cluster.mat');

ncluster = size(cluster,1);
n = length(keyframes_features);

counter = ones(size(cluster,1),1);
invert_list = zeros(size(cluster,1),length(keyframes));

for i=1:n
    disp(i);
    dist = pdist2(double(keyframes_features{1,i}'),cluster);
    [M,I] = min(dist,[],2);
    invert_index = find(M < 250);
    for j=1:length(invert_index)
        if((length(find(invert_list(I(j),:) == i))) == 0)
            invert_list(I(j),counter(I(j))) = i;
            counter(I(j)) = counter(I(j)) + 1;
        end
    end
    hstcnt = histcounts(I,ncluster);
    if(sum(histcounts(I,ncluster)) == 0)
        tf(i,:) = 0;
        freq_norm(i,:) = 0;
    else
        tf(i,:) = hstcnt./sum(hstcnt);
        freq_norm(i,:) = hstcnt./sqrt(sum(hstcnt.^2));
    end
    idf(i,:) = (histcounts(I,ncluster) > 0);
end

idf = log10(n./sum(idf));
idf = repmat(idf,[n 1]);

tfidf = tf.*idf;
save('Large_tfidf.mat','tf','idf','tfidf','freq_norm','invert_list');