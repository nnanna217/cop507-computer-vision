function output_image = boundary_ext(image,se)
eroded_image = erosion(image, se);

output_image = image - eroded_image;
end