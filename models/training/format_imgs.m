clc
clear
% Set the source and destination folders for the images
orig_src_folder = 'images/lesionimages';
orig_dst_folder = 'images/lesionimages/proc';
mask_src_folder = 'images/masks';
mask_dst_folder = 'images/masks/proc';

% Standardize all images in the src folder to JPEG & 512 x 384 images 
x = format_lesion_images(orig_src_folder, orig_dst_folder, '*.jpg');
y = format_lesion_images(mask_src_folder, mask_dst_folder, '*.png');