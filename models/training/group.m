clc
clear
% Set the source and destination folders for the images
orig_src_folder = 'images/lesionimages/';
output = grouping(orig_src_folder, 'groundtruth.txt');