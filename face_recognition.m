function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
  %TODO
   M = double(rgb2gray(imread(image_path)));
   T = [];
   T(:,1) = M'(:);
   A0 = [];
   A0 = T - m;
   pr_test_img = eigenfaces' * A0;
   [l c] = size(pr_img);
   min_dist = norm(pr_img(1:l,1) - pr_test_img(1:l,1));
   output_img_index = 1;
   for i = 2 : c
     dist = norm(pr_img(1:l,i) - pr_test_img(1:l,1));
     if min_dist > dist
       min_dist = dist;
       output_img_index = i;
     endif
   endfor
   
end