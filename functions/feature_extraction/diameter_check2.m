function [output] = diameter_check2(img)
    %DIAMETER_CHECK Summary of this function goes here
    %   Detailed explanation goes here
    % Convert the image to grayscale
    gray_img = img;
    edges = edge(gray_img, 'Canny', 0.2);
    props = regionprops(edges, 'Area', 'Perimeter', 'Centroid', 'BoundingBox');
    area = props.Area;
    perimeter = props.Perimeter;
    centroid = props.Centroid;
    boundingBox = props.BoundingBox;
    diameter = sqrt((4*perimeter*area)/pi) * 2;
  
    % Determine if the lesion is benign or malignant
    if diameter > 6
            output = 1;
    else
        output = 0;
    end
end

