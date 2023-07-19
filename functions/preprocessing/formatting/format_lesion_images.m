function output = format_lesion_images(src_folder, dst_folder, ext)
    
    % Set the desired image format and filesize
    img_format = 'JPEG';
    img_size = [384, 512];
    
    % Get a list of all image files in the source folder
    file_list = dir(fullfile(src_folder, ext));
    
    % Loop through each image file and convert it to the desired format and size
    for i = 1:length(file_list)
        % Read in the original image
        orig_img = imread(fullfile(src_folder, file_list(i).name));
    
        % Convert the image to the desired format
        % if ~strcmpi(img_format, 'JPEG') && ~strcmpi(img_format, 'PNG')
        %     error('Unsupported image format');
        % end
        dst_file = fullfile(dst_folder, file_list(i).name);
        imwrite(orig_img, dst_file, img_format);
    
        % Resize the image to the desired size
        if size(orig_img, 1) ~= img_size(1) || size(orig_img, 2) ~= img_size(2)
            resized_img = imresize(orig_img, img_size);
            imwrite(resized_img, dst_file, img_format);
        end
    end
    output = true;
end

