1;
% f(t)=t Fourier sor reszlete
function ret=tfs(t, n)
   ret=zeros(size(t));
   s=1;
   for it=1:n
      ret=ret+s*sin(pi*it*t)/it;
      s=s*(-1);
   end
   ret=ret*2/pi;
end

tt=-3:0.01:3;
h=plot(tt, tfs(tt,n));
set(h,'interpreter','tex');
title('\sum_{n\ge 1} (-1)^{n+1} \frac{1}{n}')
print -deps out.eps
