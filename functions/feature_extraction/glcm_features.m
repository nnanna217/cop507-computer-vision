function props = glcm_features(img)
    % Convert the image to grayscale
    img_gray = img;
    
    % Apply a median filter to reduce noise
    img_filt = medfilt2(img_gray, [5 5]);
    
    % Define GLCM parameters
    offsets = [0 1; -1 1; -1 0; -1 -1];
    num_levels = 8;
    symmetric = true;
    norm = true;
    
    % Compute the GLCM for the image
    glcm = graycomatrix(img_filt, 'Offset', offsets, 'NumLevels', num_levels, 'Symmetric', symmetric);
    
    % Compute GLCM properties
    props = structfun(@(x) mean(x(:)), graycoprops(glcm, {'Contrast', 'Homogeneity', 'Energy', 'Correlation'}));
end

