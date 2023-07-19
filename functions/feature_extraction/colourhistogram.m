function H = colourhistogram(image)
% Based on the provided lab solutions - Gerald Schaefer 
% generate 8x8x8 RGB colour histogram from image

    noBins = 8; % 8 bins (along each dimension)
    binWidth = 256 / noBins; % width of each bin
    H = zeros(noBins, noBins, noBins); % empty histogram to start with
    [n m d] = size(image);
    data = reshape(image, n*m, d); % reshape image into 2-d matrix with one row per pixel
    ind = floor(double(data) / binWidth) + 1; % calculate into which bin each pixel falls
    for i=1:length(ind)
    H(ind(i,1), ind(i,2), ind(i,3)) = H(ind(i,1), ind(i,2), ind(i,3))+ 1; % increment bin
    end
    H = H / sum(sum(sum(H))); % normalise histogram
end

