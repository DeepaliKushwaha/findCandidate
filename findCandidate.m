function [ imfilled ] = findCandidate( im1, im2 )
    intensity_ratio = 0.25;
    im_open_pixels = 20;
    im_open_disk_radius = 2;
    
%% diff two images
    im_diff = imabsdiff(im1, im2);
%     figure, imshow(im_diff);



%%    % max value in im_diff
    intensity_max = max(im_diff(:));
    intensity_threshold = intensity_ratio * intensity_max;
    im_diff_thresholded = im_diff;
    im_diff_thresholded(im_diff<intensity_threshold) = 0;  % set the pixels which intensity below 0.25*max to black
    im_diff_thresholded(im_diff>=intensity_threshold) = 255; 
%     figure, imshow(im_diff_thresholded);



%%    % filter resultant binary image having an area smaller than 20-pixels
    afterRemoved = bwareaopen(im_diff_thresholded, im_open_pixels);
%     figure, imshow(afterRemoved);



%%    % apply image opening with a 2-pixel disk
    se = strel('disk', im_open_disk_radius);
    afterOpening = imopen(afterRemoved, se);
%     figure, imshow(afterOpening);

%%  % fill holes
    imfilled = imfill(afterOpening, 'holes');
%     figure, imshow(imfilled);

end

