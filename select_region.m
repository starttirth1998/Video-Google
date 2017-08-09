clear;
load('Large_keyframes.mat');
load('Large_keyframes_new_cluster.mat');
load('Large_tfidf.mat');

ncluster = size(cluster,1);
n = length(keyframes_features);

%5,100,172,78,29,10 frame retireval
search_image = imcrop(keyframes{1,5});

[r,c,no] = size(search_image);
if(no == 3)
   [fim,search_image_feature] = vl_sift(single(rgb2gray(search_image)));
else
   [fim,search_image_feature] = vl_sift(single(search_image));
end

%figure,imshow(search_image);

%perm = randperm(size(fim,2));
%sel = perm(1:40) ;
%h3 = vl_plotframe(fim(:,sel)) ;
%set(h3,'color','g') ;

dist = pdist2(double(search_image_feature'),cluster);
[M,I] = min(dist,[],2);
hstcnt = histcounts(I,ncluster);
if(sum(histcounts(I,ncluster)) == 0)
    words = 0;
else
    words = hstcnt./sum(hstcnt);
    words_norm = hstcnt./sqrt(sum(hstcnt.^2));
end

%{
[values,index] = max(words);
len = sum(invert_list(index,:) > 0);

for i=1:len
    query(i) = dot(words_norm,freq_norm(invert_list(index,i),:));
end
%}


for i=1:n
    %query(i) = compare_similiarity(words,tfidf(i,:));
    query(i) = dot(words_norm,freq_norm(i,:));
    %query(i) = dot(words,tfidf(i,:));
end

[sortedX,I] = sort(query,'descend');

for i=1:5
    %{
    if(invert_list(index,I(i)) > 0)
        figure,imshow(keyframes{1,invert_list(index,I(i))});
    end
    %}
    
    figure,imshow(keyframes{1,I(i)});
    
    %[fim,temp] = vl_sift(single(rgb2gray(keyframes{1,I(i)})));
    %perm = randperm(size(fim,2));
    %sel = perm(1:500);
    %h3 = vl_plotframe(fim(:,sel));
    %set(h3,'color','g');
end