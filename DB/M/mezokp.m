function mezokp(f, ta, tb, th, ya, yb, yh)
  [T,Y]=meshgrid((ta:th:tb), (ya:yh:yb));
  dT=ones(size(T));
  dY=f(T,Y);
  hold on;
  quiver(T, Y, dT, dY )
end 