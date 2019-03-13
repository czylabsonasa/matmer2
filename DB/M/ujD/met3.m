function y=met3(f,T,y,N)
  t=T(1);
  h=(T(2)-t)/N;
  for it=1:N
    q1=f(t,y);
    q2=f(t+1/3*h,y+1/3*h*q1);
    q3=f(t+2/3*h,y+2/3*h*q2);
    y=y+0.5*h*(q2+q3);
    t=t+h;
  end
end
