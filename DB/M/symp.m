%pkg load symbolic
syms x y(x)
equ = diff(y,x)==cos(x)^3
dsolve(equ)
f=@(x,y) ( 2*y-x )  ;
mezokp(f, 0, 1,0.3, -2,2,1)  ;
 
sereg=@(c)(@(x) x/2 + c*exp(2*x)/4 + 0.25 )  ;
cfun=@(x,y) ( y - 0.25 )*4.*exp(-2*x)  ;

mx=-2:0.05:2;

mf=sereg(cfun(-2,-4));
plot(mx, mf(mx))


mf=sereg(cfun(-2,-2));
plot(mx, mf(mx))

mf=sereg(cfun(-2,-6));
plot(mx, mf(mx))
