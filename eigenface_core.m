function [m A eigenfaces pr_img] = eigenface_core(database_path)
  
  file = readdir(database_path);
  l = length(file);
  nr_img = 1;
  
  T=[]; 
  for i = 1 : l
    image_matrix = [];
    image_path = strcat('dataset/',int2str(nr_img),'.jpg');
    I = double(rgb2gray(imread(image_path)));
    vect = [];
    v = 0;
    [im in]=size(I);
    for j=1:im
      for l=1:in
        v++;
        vect(v,1)=I(j,l); 
      endfor
    endfor
    
    T(1:v,img) =vect(1:v,1);  
    nr_img++;
   endfor
  
  m = [];
  [l c] = size(T);
  for i = 1 : l
    s = 0;
    nr = 0;
    s = sum(T(i,:));
    m(i,1) = s/c;
  endfor
  
  A = T - m;
  B = A' * A;
  
  [Ub Sb Vb] = svd(B);
  Sb = sum(Sb);
  V = [];
  [l c] = size(Vb);
  i = 1;
  j = 1;
  
  while Sb(1,i)>1
    V(1:l,j) = Vb(1:c,i);
    i++;
    j++;
  endwhile
  
  eigenfaces = A * V;
  pr_img = eigenfaces' * A;
  
end