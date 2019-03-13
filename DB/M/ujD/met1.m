function y=met1(f,T,y,N)
  t=T(1);
  h=(T(2)-t)/N;
  for it=1:N
    y=y+h*f(t,y);
    t=t+h;
  end
end
