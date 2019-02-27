clf;

f=@(t,y) exp(t)+y;
sol=@(t) (t).*exp(t);
figure(1,'name','dy/dt=e^t+y')
y0=0;
t0=0;
tf=1;
tt=-0.5:0.01:(tf+0.2);

%~ a=5;
%~ f=@(t,y) y+a*exp(t).*cos(a*t);
%~ sol=@(t) exp(t).*sin(a*t);
%~ figure(1,'name',sprintf('dy/dt=sin(%dt)e^t+y',a));
%~ y0=0;
%~ t0=0;
%~ tf=2;
%~ tt=-0.5:0.01:(tf+0.2);



stf=sol(tf);

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
    y1=y0+h*f(t0,y0);
    t1=t0+h;
    st1=sol(t1);
    vonalak(ax,t0,t1,y0,y1,st1);
    err=err+abs(y1-st1);
    t0=t1;
    y0=y1;
  end
  title(ax,sprintf('Euler,(Step=%d)(MAE=%.2e)(Err=%.2e)',step,err/step,abs(sol(tf)-y0)));
end
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
  title(ax,sprintf('Middle-point,(Step=%d)(MAE=%.2e)(Err=%.2e)',step,err/step,abs(sol(tf)-y0)));
end
%%%%%%%%%%%%%%%%%%%%%%%%%

function RK4(ax,f,sol,tt,step,t0,tf,y0,w)
  plot(ax,tt,sol(tt));
  hold on;
  h=(tf-t0)/step;
%disp(h);
  err=0;
  while t0+1e-15<tf
    k1=f(t0,y0);
    k2=f(t0+h/2,y0+h/2*k1);
    k3=f(t0+h/2,y0+h/2*k2);
    k4=f(t0+h,y0+h*k3);
    y1=y0+h/sum(w)*dot(w,[k1,k2,k3,k4]);
    t1=t0+h;
    st1=sol(t1);
    vonalak(ax,t0,t1,y0,y1,st1);
    err=err+abs(y1-st1);
    t0=t1;
    y0=y1;
  end    
  title(ax,sprintf('RK4,(Step=%d)(MAE=%.2e)(Err=%.2e)',step,err/step,abs(sol(tf)-y0)));
end

spn=1;
nit=4;
osz=2;
for it=1:nit
  step=2^(it-1);
%  Euler(subplot(nit,3,spn),f,sol,tt,step,t0,tf,y0);
%  Middle(subplot(nit,3,spn+1),f,sol,tt,step,t0,tf,y0);
  RK4(subplot(nit,osz,spn),f,sol,tt,step,t0,tf,y0,[1,2,2,1]);
  RK4(subplot(nit,osz,spn+1),f,sol,tt,step,t0,tf,y0,[2,3,3,1]);
  spn=spn+osz;
end
%%%%%%%%%%%%%%%%%%%%%%%%%

[t,y]=ode45(f,[t0,tf],y0);
disp(abs(y(end)-sol(tf)))
%print '-S1000,1000' -dpdf f1.pdf
