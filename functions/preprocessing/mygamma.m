function [img_gamma] = mygamma(img, gamma)
    % Define the gamma value
    
    % Normalize the image to the range [0, 1]
    img_norm = double(img) / 255;
    
    % Apply the gamma filter
    img_gamma = img_norm .^ gamma;
    
    % Scale the image back to the range [0, 255]
    img_gamma = uint8(img_gamma * 255);
end


