function [output] = asymmetric_check_mask_jaccard(mask, symmetry_threshold)
%ASYMMETRIC_CHECK_MASK_JACCARD Summary of this function goes here
%   Detailed explanation goes here
for k=0:2:360
    A = imrotate(mask,k);
    B = fliplr(A);
    intersect = A & B;
    union = A | B;
    num = sum(intersect(:));
    den= sum(union(:));
    jaccardIndex = num/den;

    if jaccardIndex >= symmetry_threshold
        output = true;
    else
        output = false;
    end

end

