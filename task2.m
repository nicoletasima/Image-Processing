function task2(image)
   %TODO
   A = double(imread(image));
   v1 = svd(A);
   for i = 1:length(v1)-1
     for j = i + 1 : length(v1)
      if v1(i) < v1(j)
       aux = v1(i);
       v1(i) = v1(j);
       v1(j) = aux;
     endif
   endfor
   figure(1);
   plot(v1);
   
  s = svd(A); 
  [m n] = size(A);
  k = [1:19 20:20:99 100:30:min(m,n)];
  v2 = [];
  s_tot = 0;
     for j = 1 : min(m,n)
       s_tot=s_tot + s(j);
     endfor
  for i=1 : length(k)
     s1 = 0;
     for j=1 : k(i)
       s1 = s1 + s(j);
     endfor
     
     v2(i)=s1/s_tot;
  endfor
   
   figure(2);
   plot(k,v2)
   
   [U S V] = svd(A);
   v_3 = [];
   for i = 1 : length(k)
      A_k = [];
      A_k = U(1:m,1:k(i)) * S(1:k(i),1:k(i)) * V'(1:k(i),1:n);
      sum = 0;
      for j= 1 : m
         for l = 1 : n
           sum = sum + (A(j,l) - A_k(j,l)).^2;
         endfor
      endfor 
     v_3(i) = sum/(m * n); 
   endfor 
   figure(3);
   plot(k,v_3);
   
   v_4 = [];
   for i = 1 : length(k)
     for j = 1 : k(i)
        v_4(i) = (m * j + n * j + j)/(m * n);
      endfor
   endfor 
  figure(4);
  plot(k,v_4); 
   
 end



