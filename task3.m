function [A_k S Z] = task3(image, k)
  %TODO
   A = double(imread(image));
   [m n] = size(A);
   miu = [];
   for i = 1 : m
     s = 0;
     for j = 1 : n
       s = A(i,j) + s;
     endfor
     miu(i) = s/n;
   endfor
   
   
   for i = 1 : m
     for j = 1 : n
        A(i,j) = A(i,j) - miu(i);
     endfor
   endfor
   Z = (A')./sqrt(n - 1);
   [Uz S Vz] = svd(Z);
   W = Vz(1:m,1:k);
   Y = W' * A;
   A_k = W * Y;
    %for i = 1 : m
 
        A_k(:,:) = A_k(:,:) + miu(:);
 
  % endfor
   
endfunction