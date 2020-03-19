function [A_k S] = task4(image, k)
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
   Z = (A * A')./(n-1);
   [Vz Sz] = eig(Z);
   W = Vz(1:m,1:k);
   Y = W' * A;
   A_k = W * Y;
   for i = 1 : m
     for j = 1 : n
        A_k(i,j) = A_k(i,j) + miu(i);
     endfor
   endfor
endfunction