function hist = lbphist(image)
   % As referenced from the Lab solutions - Gerald Schaefer
  % calculate LBP histogram of image
  weight_matrix = [16 8 4; 32 0 2; 64 128 1];
  image_lbp = zeros(size(image,1)-2, size(image,2)-2);
  for i=2:size(image,1)-1
    for j=2:size(image,2)-1
      block = image(i-1:i+1,j-1:j+1); % our 3x3 block
      ind = find(block>=block(2,2)); % threshold by centre pixel and identify 1s
      lbpcode = sum(weight_matrix(ind)); % turn bitpattern into byte (histogram bin)
      image_lbp(i-1,j-1) = lbpcode;
    end
  end
  hist = imhist(uint8(image_lbp), 256); % calculate the LBP histogram
  hist = hist / sum(hist); % normalise histogram
end