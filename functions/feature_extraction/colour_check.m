function num_unique_colors = colour_check(lesion_img)
%COLOUR_CHECK Summary of this function goes here
%   Detailed explanation goes here
hsv_img = rgb2hsv(lesion_img);

% Extract the saturation channel
saturation_values = hsv_img(:,:,2);

% Calculate the number of unique saturation values
num_unique_colors = length(unique(saturation_values));
end

