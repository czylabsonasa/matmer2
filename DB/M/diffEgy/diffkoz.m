clf;
f=@(t,y) exp(t)+y;
sol=@(t) t.*exp(t);
y0=0;
t0=0;
h=1;
t1=t0+h;
st1=sol(t1);
tt=-0.5:0.01:(t1+0.2);

subplot(1,3,1);
plot(tt, sol(tt));
hold on;
y1=y0+h*f(y0,t0);

line([t0,t1],[y0,y1])
line([t1,t1],[y1,st1],'color','m');
plot([t0,t1],[y0,st1],'+');
plot([t1,y1],'o');
title(sprintf('Euler, %.3f',abs(y1-st1)));
%%%%%%%%%%%%%%%%%%%%%%%%%


subplot(1,3,2);
plot(tt, sol(tt));
hold on;
k1=f(t0, y0);
k2=f(t0+h/2, y0+h/2*k1);
y1=y0+h*k2;

line([t0,t1],[y0,y1])
line([t1,t1],[y1,st1],'color','m');
plot([t0,t1],[y0,st1],'+');
plot([t1,y1],'o');
title(sprintf('Middle-point, %.3f',abs(y1-st1)));

%%%%%%%%%%%%%%%%%%%%%%%%%

subplot(1,3,3);
plot(tt, sol(tt));
hold on;
k1=f(t0, y0);
k2=f(t0+h/2, y0+h/2*k1);
k3=f(t0+h/2, y0+h/2*k2);
k4=f(t0+h, y0+h*k3);
y1=y0 + h*(k1/6+k2/3+k3/3+k4/6);

line([t0,t1],[y0,y1])
line([t1,t1],[y1,st1],'color','m');
plot([t0,t1],[y0,st1],'+');
plot([t1,y1],'o');
title(sprintf('RK4, %.3f',abs(y1-st1)));
%%%%%%%%%%%%%%%%%%%%%%%%%
xlim([-1,2]);
