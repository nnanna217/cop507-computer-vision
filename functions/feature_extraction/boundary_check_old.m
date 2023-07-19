% Reference -  Gonzalez, R. C., R. E. Woods, and S. L. Eddins, 
% Digital Image Processing Using MATLAB, New Jersey, Pearson Prentice Hall, 2004.
%
% bwboundaries - https://uk.mathworks.com/help/images/ref/bwboundaries.html#bu1wvam-4
% Regionprops - https://uk.mathworks.com/help/images/ref/regionprops.html?s_tid=doc_ta


function is_symmetrical  = asymmetric_check(lesion_img, segmented_mask, symmetry_threshold)
        
        % Calculate the boundary and centroid of the lesion binary image
        [B, L] = bwboundaries(lesion_img);
        stats = regionprops(L,'Centroid');
        centroid = stats(1).Centroid;
        
        % Calculate the boundary of the mask and the centroid of the mask
        [B_mask, L_mask] = bwboundaries(segmented_mask);
        stats_mask = regionprops(L_mask,'Centroid');
        centroid_mask = stats_mask(1).Centroid;
    
        % Calculate the distance from each boundary point to the centroid, 
        % and then calculate the mean distance
        distances = zeros(length(B{1}),1);
        for j = 1:length(B{1})
            distances(j) = pdist([B{1}(j,:); centroid],'euclidean');
        end
        mean_distance = mean(distances);
        
        % Calculate the distance from each boundary point to the centroid of the mask, and then calculate the mean distance
        % --
        distances_mask = zeros(length(B_mask{1}),1);
        for j = 1:length(B_mask{1})
            distances_mask(j) = pdist([B_mask{1}(j,:); centroid_mask],'euclidean');
        end
        mean_distance_mask = mean(distances_mask);
        
        % Compare the mean distances between the lesion image and the mask to determine if the lesion is symmetrical or not
        if mean_distance/mean_distance_mask > symmetry_threshold
            is_symmetrical = true;
        else
            is_symmetrical = false;
        end
        
end

%Boundary_check.m (this was changed to use another approach)

function is_malignant = boundary_check(lesion_img, boundary_threshold)
   % Perform edge detection using Canny algorithm
   edges = edge(lesion_img, 'Canny', [], 2.5);
  
   % Compute the length of the boundary
   boundary_length = sum(sum(edges));
  
   % Compute the length of the diagonal of the bounding box
   [h, w] = size(lesion_img);
   diagonal_length = sqrt(h^2 + w^2);
  
   % Compute the evenness of the boundary
   boundary_evenness = boundary_length / diagonal_length;
      
   % Determine if the lesion is malignant based on evenness of the border
       if boundary_evenness > boundary_threshold
           is_malignant = true;
       else
           is_malignant = false;
       end
end


