function task5(image)
  %TODO
   C = double(imread(image));
   [m n] = size(C);
   k = [1:19 20:20:99 100:30:min(m,n)];
   [A_k S Z] = task3(image,k);
   
   figure(1);
   plot(diag(S));
  
  vz = svd(Z);
  v2 = [];
  for i = 1 : length(k)
    s1 = 0;
    s2 = 0;
    for j = 1 : k(i)
       s2 = s2 + vz(j);
     endfor 
     
     for l=1:min(m,n)
       s1=s1+vz(l);
     endfor
     
    v2(i) = s2/s1;
  endfor
  figure(2);
  plot(k,v2);
  

   v_3 = [];
   for i = 1 : length(k)
     s = 0;
     A_k = [];
     S = [];
     Z = [];
     [A_k S Z] = task3(image,k(i));
     for j = 1 : m
       for l = 1 : n
         s = s + (C(j,l) - A_k(j,l)).^2;
       endfor
     endfor 
     v_3(i) = s/(m * n); 
   endfor 
   figure(3);
   plot(k,v_3);
  
  v4 = [];
  for i = 1 : length(k)
      v4(i) = (2 * k(i) + 1)/n;
  endfor
  figure(4);
  plot(k,v4);
  
endfunction