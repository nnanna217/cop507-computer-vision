function [asymetric_index] = asymmetric_indexmethod(image)

    % Read in binary image and compute its size and area
    image_size = size(image);
    total_area = sum(image(:));
    
    % Compute the area of the lesion by subtracting the background area from the total area
    background_value = mode(image(:));
    lesion_area = total_area - sum(image(:) == background_value);
    
    % Calculate the asymmetric distance
    num = abs(total_area - 2*lesion_area);
    asymmetry_distance = num/ total_area;

    asymetric_index = asymmetry_distance*100;
    
end

