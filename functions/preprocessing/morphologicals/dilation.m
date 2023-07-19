function dilated_image = dilation(image, SE)

% Inputs:
% - image: grayscale image
% - SE: structuring element used for morphological erosion
% Outputs:
% - dilated_image: dilated grayscale image

% Pad the image with zeros to handle border pixels
image = padarray(image, [1 1], 'both');

% Create an empty output image
dilated_image = zeros(size(image));

% Get the size of the image
[M, N] = size(image);

% Get the size of the structuring element
[m, n] = size(SE);

for i=ceil(m/2):M-floor(m/2)
    for j=ceil(n/2):N-floor(n/2)
 
        % take all the neighbourhoods.
        on=image(i-floor(m/2):i+floor(m/2), j-floor(n/2):j+floor(n/2));
        % take logical se
        nh=on(logical(SE));
        % compare and take minimum value of the neighbor
        % and set the pixel value to that minimum value.
        dilated_image(i, j)=max(nh(:));     
    end
end

% Remove the padding from the eroded image
dilated_image = dilated_image(1+floor(m/2):end-floor(m/2), 1+floor(n/2):end-floor(n/2));

end