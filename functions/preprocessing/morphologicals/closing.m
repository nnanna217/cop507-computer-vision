function output_image = closing(image,se)
%OPENING Summary of this function goes here
%   Detailed explanation goes here
dilated_image = dilation(image, se);
eroded_image = erosion(dilated_image, se);

output_image = eroded_image;
end