function y=met4(f,T,y,N)
  t=T(1);
  h=(T(2)-t)/N;
  for it=1:N
    q1=f(t,y);
    q2=f(t+0.5*h,y+0.5*h*q1);
    q3=f(t+h,y+h*(2*q2-q1));
    y=y+h/6*(q1+4*q2+q3);
    t=t+h;
  end
end
