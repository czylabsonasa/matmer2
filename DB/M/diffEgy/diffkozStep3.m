% vektoros
clf;

%% y''+5y'+2y=0
%% y(0),y'(0)=1,3
%f=@(t,y) [y(2), -5*y(2)-2*y(1)]';
%y0=[1, 1]';
%t0=0;
%tf=3;

% y''+5y'+2y=t
% y(0),y'(0)=1,3
f=@(t,y) [y(2), t-5*y(2)-2*y(1)]';
y0=[1, 1]';
t0=0;
tf=3;



%figure(1,'name','noname');

ode45(f,[t0,tf]',y0);
exit();

function vonalak(ax,t0,t1,y0,y1)
    line(ax,[t0,t1],[y0(1),y1(1)],'color','b');
%    line(ax,[t0,t1],[y0(2),y1(2)],'color','r');
    plot(ax,t1,y1(1),'bo');
%    plot(ax,t1,y1(2),'ro');
end

function Euler(ax,f,tt,yy,step,t0,tf,y0)
  plot(ax,tt,yy(:,1),'r-');
  legend('ode45','location','southwest');
  hold on;
%  plot(ax,tt,yy(:,2),'r.');

  h=(tf-t0)/step;
  while t0+1e-15<tf
    y1=y0+h*f(t0,y0);
    t1=t0+h;
    vonalak(ax,t0,t1,y0,y1);
    t0=t1;
    y0=y1;
  end
  title(ax,sprintf('Euler,(Step=%d)(Delta=%.2e)',step,norm(yy(end,:)'-y0,1)));
end
%%%%%%%%%%%%%%%%%%%%%%%%%

function Middle(ax,f,tt,yy,step,t0,tf,y0)
  plot(ax,tt,yy(:,1),'r-');
  legend('ode45','location','southwest');
  hold on;
%  plot(ax,tt,yy(:,2),'r.');

  h=(tf-t0)/step;
  err=0;
  while t0+1e-15<tf
    k1=f(t0,y0);
    k2=f(t0+h/2,y0+h/2*k1);
    y1=y0+h*k2;
    t1=t0+h;
    vonalak(ax,t0,t1,y0,y1);
    t0=t1;
    y0=y1;
  end  
  title(ax,sprintf('Middle-point,(Step=%d)(Delta=%.2e)',step,norm(yy(end,:)'-y0,1)));
end
%%%%%%%%%%%%%%%%%%%%%%%%%

function RK4(ax,f,tt,yy,step,t0,tf,y0)
  plot(ax,tt,yy(:,1),'r-');
  legend('ode45','location','southwest');
  hold on;
%  plot(ax,tt,yy(:,2),'r.');

  h=(tf-t0)/step;
  while t0+1e-15<tf
    k1=f(t0,y0);
    k2=f(t0+h/2,y0+h/2*k1);
    k3=f(t0+h/2,y0+h/2*k2);
    k4=f(t0+h,y0+h*k3);
    y1=y0+h/6*(k1+2*k2+2*k3+k4);
    t1=t0+h;
    vonalak(ax,t0,t1,y0,y1);
    t0=t1;
    y0=y1;
  end    
  title(ax,sprintf('RK4,(Step=%d)(Delta=%.2e)',step,norm(yy(end,:)'-y0,1)));
end

spn=1;
nit=4;
for it=1:nit
  step=2^it;
  Euler( subplot(nit,3,spn  ), f,tt,yy,step,t0,tf,y0);
  Middle(subplot(nit,3,spn+1), f,tt,yy,step,t0,tf,y0);
  RK4(   subplot(nit,3,spn+2), f,tt,yy,step,t0,tf,y0);
  spn=spn+3;
end
%%%%%%%%%%%%%%%%%%%%%%%%%

print '-S1000,1000' -dpdf f4.pdf
