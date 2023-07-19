function [imfeatures] = B_features(lesion_images,mask_images)
    % create image datastore
    imds = imageDatastore(lesion_images, 'FileExtensions', '.jpg');
    imgs = readall(imds); % read in all images
    
    mask_imds = imageDatastore(mask_images, 'FileExtensions', '.png');
    mask_images = readall(mask_imds); % read in all images
    
    % Set values for symmetry_threshold and boundary_threshold
    symmetry_threshold = 0.9;
    boundary_threshold = 0.5;
    
    % Initialize extract_feature matrix
    imfeatures = []; B = [];
    
    % Loop through each image and its corresponding mask
    for i = 1:length(imgs)
        % Read in the color lesion image and mask image
        lesion_im = imgs{i};
        mask_im = mask_images{i};
        
        % Convert the color lesion image to grayscale and threshold it to create a binary image
        lesion_gray = rgb2gray(lesion_im);
        lesion_binary = imbinarize(lesion_gray);
        
        % Extract ABC features
        B(end+1, :) = boundary_check(lesion_binary);
        
    end

    % Append the extracted features to the extract_feature matrix
 
      imfeatures = cat(2, imfeatures, B);
end

