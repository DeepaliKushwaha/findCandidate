close all;
figureSwitch = false;
% 1.Read images
dirName = '/home/joe/Medical Image/mitosis/adjusted/';
[ fileNames ] = GetFilePathesFromDir(dirName, '*.TIF');
maxFrameNum = numel(fileNames);

for i=1:maxFrameNum-1
    close all;
    im1 = imread(fileNames(i).name);
    im1 = rgb2gray(im1);
    figure, subplot(1,2,1), imshow(im1);

    im2 = imread(fileNames(i+1).name);
    im2 = rgb2gray(im2);
    subplot(1,2,2), imshow(im2);


    [ imfilled ] = findCandidate( im1, im2 );

    figure, imshow(imfilled);
end