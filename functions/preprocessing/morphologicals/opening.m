function output_image = opening(image,se)
%OPENING Summary of this function goes here
%   Detailed explanation goes here
eroded_image = color_erosion(image, se);
dilated_image = color_dilation(eroded_image, se);

output_image = dilated_image;
end

