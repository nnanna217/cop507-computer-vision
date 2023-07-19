% Load image
im = imread('images/lesionimages/proc/ISIC_0000000.jpg');
im_mask = imread('images/masks/proc/ISIC_0000000_Segmentation.png');

% Convert image to grayscale
im_gray = rgb2gray(im);
figure;
imshow(im_gray);
impixelinfo();

figure;
imhist(im_gray);

% Apply thresholding to create a binary mask of the lesion
% threshold = graythresh(im_gray);
% mask = imbinarize(im_gray,threshold);
% 
% % Clean up the binary mask using morphological operations
% se = strel('disk', 5);
% 
% mask = imclose(mask, se);
% 
% mask = imfill(mask, 'holes');
figure;
subplot(2,1,1), imshow(im), title("Original");
subplot(2,1,2), imshow(im_mask), title("Mask");
impixelinfo();
mask = bwareafilt(mask, [10 Inf]);


% Apply the mask to the original image to extract the lesion
segmented_image = bsxfun(@times, im, cast(mask,class(im)));

% Display the original image and the segmented image
figure;
subplot(1,2,1); imshow(im); title('Original Image');
subplot(1,2,2); imshow(segmented_image); title('Segmented Image');