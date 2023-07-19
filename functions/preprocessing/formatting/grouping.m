function output = grouping(src_folder, groundtruth_file)
    lines = readlines(groundtruth_file);
    labels  = extractAfter(lines,",");
    unique_labels = unique(labels);

    for i = 1:length(unique_labels)
        dir_path = strcat(src_folder, unique_labels{i});
        % Check if the directory exists
        if ~exist(dir_path, 'dir')
            % Create the directory
            mkdir(dir_path);
        end
    end

    for i = 1:length(lines)
        img_files  = split(lines,",");

        if img_files(i,2) == labels{i}
            orig_img = imread(fullfile(src_folder, strcat(img_files(i),'.jpg')));
            dst_folder = strcat(src_folder, labels{i});

            dst_file = fullfile(dst_folder, strcat(img_files(i),'.jpg'));
            imwrite(orig_img, dst_file, 'jpg');
        end
    end

    
    % % Get a list of all image files in the source folder
    % file_list = dir(fullfile(src_folder, '*.jpg'));
    % 
    % % Loop through each image file and convert it to the desired format and size
    % for i = 1:length(file_list)
    %     % Read in the original image
    %     orig_img = imread(fullfile(src_folder, file_list(i).name));
    % 
    % 
    %     dst_file = fullfile(dst_folder, file_list(i).name);
    %     imwrite(orig_img, dst_file, img_format);
    % 
    %     % Resize the image to the desired size
    %     if size(orig_img, 1) ~= img_size(1) || size(orig_img, 2) ~= img_size(2)
    %         resized_img = imresize(orig_img, img_size);
    %         imwrite(resized_img, dst_file, img_format);
    %     end
    % end
    output = true;
end