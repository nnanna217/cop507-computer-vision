
function is_malignant = boundary_compact(mask_img, boundary_threshold)
        % Create a 3x3 square structuring element for an 8-neighborhood
        se = logical([1 1 1; 1 0 1; 1 1 1]);

        % Perform erosion
        im = erosion(mask_img, se);

    % Calculate the perimeter of the lesion
        perimeter = sum(sum(bwperim(im)));
        
        % Calculate the area of the lesion
        area = sum(sum(im));
        
        % Calculate the compactness index of the lesion
        compactness_index = (perimeter^2) / (4 * pi * area) ;

        % Check if the compactness_index falls within range of 1.5-2.0.the specified range
         if compactness_index >= 1.5 && compactness_index <= 2.0
             is_malignant = true;
         else
             is_malignant = false;
        end
end