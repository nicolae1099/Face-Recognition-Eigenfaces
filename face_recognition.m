function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  test_img = double(rgb2gray(imread(image_path)));
  test_img = test_img'(:) - m; % test image column

  pr_test_img = eigenfaces' * test_img;
  dist = norm((pr_img - pr_test_img)', 'rows');

  min_dist = min(dist);
  output_img_index = find(dist == min_dist);
end
