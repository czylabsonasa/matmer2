 f=@(x, y) 1-y+y.^2
 ta=-1;th=0.1;tb=1;
 ya=ta;yh=th;yb=tb;
 [T,Y]=meshgrid((ta:th:tb), (ya:yh:yb));
 dT=ones(size(T));
 dY=f(T,Y);
 quiver(T, Y, dT, dY )