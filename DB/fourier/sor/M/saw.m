clf;

xx=-5:0.03:5;
% eredeti fureszfog: F(t)=t-floor(t), ezt kell transzformalni
% 2pi*F(t/(2pi)+pi)-pi
function ret=f(t)
   ret=2*pi*((t+pi)/(2*pi)-floor((t+pi)/(2*pi)))-pi;
end

function ret=psum(t,n)
   ret=zeros(size(t));
   s=1;
   for it=1:n
      ret=ret+s*sin(it*t)/it;
      s=-s;
   end
   ret=2*ret;
end
fig=figure(1);
%set(fig,'papertype','a4')
nf=1
for it=1:nf
   subplot(nf,1,it);
   plot(xx,psum(xx,8*it));
   hold on;
   plot(xx,f(xx),'r');
   title(sprintf('n=%d',4*it));
end

print('saw','-depsc') ;


