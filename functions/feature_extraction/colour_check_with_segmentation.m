function [num_unique_colors, fused] = colour_check_with_segmentation(lesion_img, mask_img)
    %COLOUR_CHECK Using Otsu's Method to segment the image
    
    fused = imfuse(lesion_img, mask_img, 'blend', 'Scaling', 'joint');

    hsv_img = rgb2hsv(fused);
    % 
    % % Extract the saturation channel
    saturation_values = hsv_img(:,:,2);
    % 
    % % Calculate the number of unique saturation values
    num_unique_colors = length(unique(saturation_values));
end


