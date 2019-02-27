clf;
xx=1:0.03:10;

function ret=f(t)
   ret=(-1).^floor(t/pi);
end

function ret=psum(t,n)
   ret=zeros(size(t));
   for it=1:n
      ret=ret+sin((2*it-1)*t)/(2*it-1);
   end
   ret=4/pi*ret;
end
fig=figure(1);
%set(fig,'papertype','a4')

atvisz =@(a,b,A,B,t) B+(B-A)/(b-a)*(t-a);

txx=atvisz(2,8,-pi,pi,xx);% a feladatbeli intervallum

nf=1;
for it=1:nf
   subplot(nf,1,it);
   plot(xx,2*psum(txx,4*it)+3);
   hold on;
   plot(xx,2*f(txx)+3,'r');
   title(sprintf('n=%d',4*it));
end

print('transz','-depsc') ;


