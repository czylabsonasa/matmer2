#f(t)=t Fourier sor reszlete
function tfs(n)
   function f(t)
      ret=zeros(size(t));
      s=1;
      for it=1:n
         ret=ret+s*sin.(pi*it*t)/it;
         s=s*(-1);
      end
      ret=ret*2/pi;
   end
end


tt=-3:0.01:3;
import Plots
clf
#Plots.plotlyjs();
Plots.pyplot();
using LaTeXStrings
fun=tfs(n)
lb=L"$\sum_{k=1}^n (-1)^{k+1}\ \frac{\sin(\pi k t)}{k}$ "*", n=$(n)"
Plots.plot(tt, fun( tt ), label=lb );
