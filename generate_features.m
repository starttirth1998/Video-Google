%ffmpeg
%kmeans from vlfeat
clear;
oldFolder = cd('~/CVIT/Video_Google/frames_360_3');

imagefiles1 = dir('*.png');
imagefiles2 = dir('*.jpg');
imagefiles3 = dir('*.jpeg');

imagefiles = [imagefiles1 ; imagefiles2 ; imagefiles3];

cnt = 1;
nfiles = length(imagefiles);
for i=437:nfiles
   disp(i);
   currentfilename = imagefiles(i).name;
   currentimage = imread(currentfilename);
   [r,c,no] = size(currentimage);
   if(no == 3)
       [fim,frames_features{cnt}] = vl_sift(single(rgb2gray(currentimage)));
   else
       [fim,frames_features{cnt}] = vl_sift(single(currentimage));
   end
   images_frames{cnt} = currentimage;
   cnt = cnt + 1;
end

cd(oldFolder);
save('Large_frames_2.mat','frames_features','images_frames','-v7.3');