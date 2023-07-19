function h = hog_features(img)
%HOG_FEATURES Summary of this function goes here
%   Detailed explanation goes here
% Convert the image to grayscale
    img_gray = img;
    
    % Define HOG parameters
    cell_size = [8 8];
    block_size = [2 2];
    num_bins = 8;
    
    % Compute HOG features
    h = extractHOGFeatures(img_gray, 'CellSize', cell_size, 'BlockSize', block_size, 'NumBins', num_bins);

end

