clf 
% pkg load symbolic
syms y(t)
eq = diff(y,t) == ...
sol = dsolve(eq) # ebből meghatározom a C-ket, de a matlabFunction is jó

f= @(t,y) ... ;
delta=...
[T,Y] = meshgrid(0.3:delta:2, -2:delta:2);
dY = f(T,Y);
dT = ones(size(dY));
quiver(T,Y,dT,dY,3.0,'.')
ylim([-2,2])
hold on
% return 

# ezeket bedrotoztam
sol1 = ...
sol2 = ...
sol3 = ...

dom=linspace(-0.3,3);
plot( dom, sol1(dom), 'k', 1,-1, 'rd' )
ylim([-2,2])
plot( dom, sol2(dom), 'k', 1,0, 'rd' )
ylim([-2,2])
plot( dom, sol3(dom), 'k', 1,1, 'rd' )
ylim([-2,2])
