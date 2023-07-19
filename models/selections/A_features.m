function [imfeatures] = A_features(lesion_images,mask_images)
    % create image datastore
    imds = imageDatastore(lesion_images, 'FileExtensions', '.jpg');
    imgs = readall(imds); % read in all images
    
    mask_imds = imageDatastore(mask_images, 'FileExtensions', '.png');
    mask_images = readall(mask_imds); % read in all images
    
    % Set values for symmetry_threshold and boundary_threshold
    symmetry_threshold = 0.73;
    boundary_threshold = 0.7;
    
    % Initialize extract_feature matrix
    imfeatures = []; A = []; B = []; C = []; D = [];
    
    % Loop through each image and its corresponding mask
    for i = 1:length(imgs)
        % Read in the color lesion image and mask image
        lesion_im = imgs{i};
        mask_im = mask_images{i};
        
        % Pre-processing steps 
        %   Convert the color lesion image to grayscale and 
        %   threshold it to create a binary image
        %   Apply histogram equalization
        %   Apply filters (Median filter produced best scores)
        lesion_gray = rgb2gray(lesion_im);
        lesion_binary = imbinarize(lesion_gray);

        lesion_gray = histeq(lesion_gray);
        g = fspecial('gaussian',[3 3]); % generate a 3x3 gausian filter
        % imfiltered = imfilter(lesion_gray, g); medfilt2(img)
        imfiltered = medfilt2(lesion_gray);
        
        % Extract ABCD 
        %   Asymemetry - Using Asymmetric index method

        %   A = asymmetric_check(lesion_binary, mask_im, symmetry_threshold);
        A(end+1,:) = asymmetric_check_mask_jaccard(mask_im, symmetry_threshold);
        % B(end+1,:) = boundary_compact(lesion_binary,boundary_threshold);
        % 
        % % hist = colourhistogram(lesion_im);
        % % allhists(i,:) = hist(:);
        % 
        % C(end+1,:) = colour_check_with_segmentation(lesion_im);
        % % 
        % D(end+1,:) = diameter_check2(imfiltered);
        % % 
        
    end

    % Feature Selection - PCA applied to GLCM features

    % Implement feature fusion to combine all selection features for
    % training
    
    imfeatures = A;

    % imfeatures = cat(2, A, B);
    % imfeatures = cat(2, imfeatures, C);
    % imfeatures = cat(2, imfeatures, D);
    % imfeatures = cat(2, imfeatures, H);


end

