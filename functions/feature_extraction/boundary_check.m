function [degree_melanoma] = boundary_check(mask_img)
    % Load the image and segment the lesion
    
    % Find the edge pixels of the lesion
    [B, L] = bwboundaries(mask_img);
    boundary = B{1};

    % Define vectors product and inflexion point descriptors
    V = zeros(length(boundary)-2, 1);
    I = zeros(length(boundary), 1);
    
    % Calculate vectors product and inflexion point descriptors
    for i=2:length(boundary)-1
        x1 = boundary(i-1, 1);
        y1 = boundary(i-1, 2);
        x2 = boundary(i, 1);
        y2 = boundary(i, 2);
        x3 = boundary(i+1, 1);
        y3 = boundary(i+1, 2);
        
        % Calculate vectors product descriptor
        V(i-1) = (x2-x1)*(y3-y1)*(y2-y1)*(x3-x1);
        
        % Calculate inflexion point descriptor
        if V(i-1) > 0
            I(i) = 1; % peak
        elseif V(i-1) < 0
            I(i) = -1; % valley
        else
            I(i) = 0; % straight line
        end
    end
    
    % Calculate the degree of border for each part
    n_parts = 8;
    part_size = floor(length(boundary) / n_parts);
    degrees = zeros(n_parts, 1);
    for i = 1:n_parts
        start_idx = (i-1) * part_size + 1;
        end_idx = min(i * part_size, length(boundary));
        part = I(start_idx:end_idx);
        
        % Assign a degree of border based on the number of peaks and valleys
        num_peaks = sum(part == 1);
        num_valleys = sum(part == -1);
        if num_peaks <= 2 && num_valleys <= 2
            degrees(i) = 0;
        else
            degrees(i) = 1;
        end
    end
    
    % Calculate the degree of melanoma based on the border degrees
    degree_melanoma = max(3, sum(degrees) + 1);
    degree_melanoma = min(8, degree_melanoma);
    
        if degree_melanoma > 3
            is_malanoma = true;
        else
            is_malanoma = false;
        end
end

