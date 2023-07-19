function eroded_img = color_erosion(img, se)

% Get the dimensions of the input image
[M, N, ~] = size(img);

% Perform erosion for each color channel
eroded_img = zeros(size(img));
for c = 1:3
    eroded_img(:,:,c) = imerode(img(:,:,c), se);
end

end