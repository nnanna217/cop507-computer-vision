function dilated_img = color_dilation(img, se)

% Get the dimensions of the input image
[M, N, ~] = size(img);

% Perform dilation for each color channel
dilated_img = zeros(size(img));
for c = 1:3
    dilated_img(:,:,c) = imdilate(img(:,:,c), se);
end

end