function y=met2(f,T,y,N)
  t=T(1);
  h=(T(2)-t)/N;
  for it=1:N
    q1=f(t,y);
    q2=f(t+0.5*h,y+0.5*h*q1);
    y=y+h*q2;
    t=t+h;
  end
end
