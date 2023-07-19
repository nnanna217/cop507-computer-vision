function color_variance  = colour_variance(mask_im)
    % Convert the image to the HSV color space
    hsv_im = rgb2hsv(mask_im);
    
    % Extract the saturation channel
    s = hsv_im(:,:,2);
    
    % Calculate the color variance of the saturation channel
    color_variance = var(s(:));
    
    % Check if the color variance falls within the specified range
    % if color_variance >= 0.10 && color_variance <= 0.15
    % else
    % end
end

