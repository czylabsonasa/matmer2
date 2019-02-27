clf;

xx=-7:0.03:7;
% eredeti fureszfog: F(t)=t-floor(t), ezt kell transzformalni
% 2pi*F(t/(2pi)+pi)-pi
function ret=f(t)
   ret=abs(2*pi*((t+pi)/(2*pi)-floor((t+pi)/(2*pi)))-pi);
end

function ret=psum(t,n)
   ret=zeros(size(t));
   for it=1:n
      ret=ret+cos((2*it-1)*t)/((2*it-1)^2);
   end
   ret=pi/2-4/pi*ret;
end
fig=figure(1);
%set(fig,'papertype','a4')
nf=1; mul=2;
for it=1:nf
   subplot(nf,1,it);
   plot(xx,psum(xx,mul*it));
   hold on;
   plot(xx,f(xx),'r');
   title(sprintf('n=%d',mul*it));
end

print('absz','-depsc') ;
