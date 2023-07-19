function [imfeatures] = ABCD_with_jaccard(lesion_images,mask_images)
    % create image datastore
    imds = imageDatastore(lesion_images, 'FileExtensions', '.jpg');
    imgs = readall(imds); % read in all images
    
    mask_imds = imageDatastore(mask_images, 'FileExtensions', '.png');
    mask_images = readall(mask_imds); % read in all images
    
    % Set values for symmetry_threshold and boundary_threshold
    symmetry_threshold = 0.73;
    boundary_threshold = 0.7;
    
    % Initialize extract_feature matrix
    imfeatures = [];
    
    % Loop through each image and its corresponding mask
    for i = 1:length(imgs)
        % Read in the color lesion image and mask image
        lesion_im = imgs{i};
        mask_im = mask_images{i};
        
        % Convert the color lesion image to grayscale and threshold it to create a binary image
        lesion_gray = rgb2gray(lesion_im);
        lesion_binary = imbinarize(lesion_gray);
        
        % Extract ABCD + GLCM +HOG features
        %   Asymemetry - Using Asymmetric index method
        %   Boundry - Using Boundary eveness check
        %   Color - Using Unique color check
        %   Diameter 

        A = asymmetric_check_mask_jaccard(mask_im, symmetry_threshold);
        B = boundary_check(lesion_binary,boundary_threshold);
        C = colour_check(lesion_im);
        D = diameter_check2(lesion_gray);
        % H = hog_features(lesion_im);
        
        % Append the extracted features to the extract_feature matrix
        imfeatures(end+1,:) = [A, B, C, D];
    end

end

