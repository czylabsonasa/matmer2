function y=met5(f,T,y,N)
  t=T(1);
  h=(T(2)-t)/N;
  for it=1:N
    q1=f(t,y);
    q2=f(t+0.5*h,y+0.5*h*q1);
    q3=f(t+0.5*h,y+0.5*h*q2);
    q4=f(t+h,y+h*q3);
    y=y+h/6*(q1+2*q2+2*q3+q4);
    t=t+h;
  end
end
