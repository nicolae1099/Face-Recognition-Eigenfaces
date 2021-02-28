function [m A eigenfaces pr_img] = eigenface_core(database_path)
  % M is the number of images in the database
  M = rows(ls(database_path));

  T = [];
  for i = 1: M
      % column vector for the matrix image i
      Ti = double(rgb2gray(imread(strcat(database_path,'/',int2str(i),'.jpg'))))'(:);
      T = [T Ti];
  end

  m = mean(T, 2);
  A = T - m;

  [V D] = eig(A' * A); # eigenvectors and eigenvalues
  V(:, find(diag(D) > 1)); # eigenvectors with eigenvalues greater than 1

  eigenfaces = A * V;
  pr_img = eigenfaces' * A;
end
