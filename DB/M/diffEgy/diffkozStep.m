clf;
figure(1,'name','dy/dt=e^t+y')
f=@(t,y) exp(t)+y;
sol=@(t) t.*exp(t);
y0=0;
t0=0;
tf=1;
stf=sol(tf);
tt=-0.5:0.01:(tf+0.2);

function vonalak(ax,t0,t1,y0,y1,st1)
    line(ax,[t0,t1],[y0,y1]);
    line(ax,[t1,t1],[y1,st1],'color','m');
    plot(ax,[t0,t1],[y0,st1],'+');
    plot(ax,t1,y1,'bo');
end

function Euler(ax,f,sol,tt,step,t0,tf,y0)
  plot(ax,tt,sol(tt));
  hold on;
  h=(tf-t0)/step;
  err=0;
  while t0+1e-15<tf
    y1=y0+h*f(y0,t0);
    t1=t0+h;
    st1=sol(t1);
    vonalak(ax,t0,t1,y0,y1,st1);
%    line(ax,[t0,t1],[y0,y1]);
%    line(ax,[t1,t1],[y1,st1],'color','m');
%    plot(ax,[t0,t1],[y0,st1],'+');
%    plot(ax,t1,y1,'bo');
    err=err+abs(y1-st1);
    t0=t1;
    y0=y1;
  end
  title(ax,sprintf('Euler, %.3f',err));
end
Euler(subplot(1,3,1),f,sol,tt,4,t0,tf,y0);
%%%%%%%%%%%%%%%%%%%%%%%%%

function Middle(ax,f,sol,tt,step,t0,tf,y0)
  plot(ax,tt, sol(tt));
  hold on;
  h=(tf-t0)/step;
  err=0;
  while t0+1e-15<tf
    k1=f(t0,y0);
    k2=f(t0+h/2,y0+h/2*k1);
    %y1=y0+h*(k1+k2)/2;
    y1=y0+h*k2;
    t1=t0+h;
    st1=sol(t1);
    vonalak(ax,t0,t1,y0,y1,st1);
    err=err+abs(y1-st1);
    t0=t1;
    y0=y1;
  end  
  title(ax,sprintf('Middle-point, %.3f',err));
end
Middle(subplot(1,3,2),f,sol,tt,4,t0,tf,y0);
%%%%%%%%%%%%%%%%%%%%%%%%%

function RK4(ax,f,sol,tt,step,t0,tf,y0)
  plot(ax,tt,sol(tt));
  hold on;
  h=(tf-t0)/step;
disp(h);
  err=0;
  while t0+1e-15<tf
    k1=f(t0,y0);
    k2=f(t0+h/2,y0+h/2*k1);
    k3=f(t0+h/2,y0+h/2*k2);
    k4=f(t0+h,y0+h*k3);
    y1=y0+h/6*(k1+2*k2+2*k3+k4);
    t1=t0+h;
    st1=sol(t1);
    vonalak(ax,t0,t1,y0,y1,st1);
    err=err+abs(y1-st1);
    t0=t1;
    y0=y1;
  end    
  title(ax,sprintf('RK4, %.3f',err));
end
RK4(subplot(1,3,3),f,sol,tt,4,t0,tf,y0);
%%%%%%%%%%%%%%%%%%%%%%%%%
%xlim([-1,2]);
