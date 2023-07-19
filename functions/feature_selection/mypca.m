function [principal_components, eigenvalues, projectdata] = mypca(data)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    principal_components = zeros(size(data));
    co = cov(data);
    [eigenvectors eigenvalues] = eig(co);
    [val, index] = sort(diag(eigenvalues), 'descend');
    principal_components = eigenvectors(:, index);
    eigenvalues = val;
    projectdata = data * principal_components;

end