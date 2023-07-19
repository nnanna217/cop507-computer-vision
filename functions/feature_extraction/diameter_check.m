function [output] = diameter_check(img)
%DIAMETER_CHECK Summary of this function goes here
%   Detailed explanation goes here
% Convert the image to grayscale
    img_gray = img;
    
    % Apply a median filter to reduce noise
    img_filt = medfilt2(img_gray, [5 5]);
    
    % Detect the edges using the Canny edge detector
    img_edges = edge(img_filt, 'canny');
    
    % Detect the contour using the bwboundaries() function
    contour = bwboundaries(img_edges);
    contour = contour{1};
        
    % Detect the circle using the Hough transform and imfindcircles function
    [centers, radii] = imfindcircles(img_edges, [20 100], 'ObjectPolarity', 'bright', 'Sensitivity', 0.95);
    
    % Calculate the diameter of the detected circle
    diameter = 2 * radii;

        % Check if diameter is greater than 6mm
    if diameter > 6
        output = true;
    else
        output = false;
    end
end

