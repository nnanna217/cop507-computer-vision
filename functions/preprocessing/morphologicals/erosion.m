function eroded_image = erosion(image, SE)

% Inputs:
% - image: grayscale image
% - SE: structuring element used for morphological erosion
% Outputs:
% - eroded_image: eroded grayscale image

% Pad the image with zeros to handle border pixels
image = padarray(image, [1 1], 'both');
% Create an empty output image
eroded_image = zeros(size(image));
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
        eroded_image(i, j)=min(nh(:));     
    end
end

% Remove the padding from the eroded image
eroded_image = eroded_image(1+floor(m/2):end-floor(m/2), 1+floor(n/2):end-floor(n/2));

end