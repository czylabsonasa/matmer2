function met1(f,T,y,N)
  t=T[1];
  h=(T[2]-t)/(1.0*N)
  for it in 1:N
    y=y+h*f(t,y)
    t=t+h
  end
  y
end

function met2(f,T,y,N)
  t=T[1]
  h=(T[2]-t)/N
  for it in 1:N
    q1=f(t,y)
    q2=f(t+0.5*h,y+0.5*h*q1)
    y=y+h*q2
    t=t+h
  end
  y
end

function met3(f,T,y,N)
  t=T[1]
  h=(T[2]-t)/N
  for it in 1:N
    q1=f(t,y)
    q2=f(t+1/3*h,y+1/3*h*q1)
    q3=f(t+2/3*h,y+2/3*h*q2)
    y=y+0.5*h*(q2+q3)
    t=t+h
  end
  y
end

function met4(f,T,y,N)
  t=T[1]
  h=(T[2]-t)/N
  for it=1:N
    q1=f(t,y)
    q2=f(t+0.5*h,y+0.5*h*q1)
    q3=f(t+h,y+h*(2*q2-q1))
    y=y+h/6*(q1+4*q2+q3)
    t=t+h
  end
  y
end



function refine(f,T,y0,method;tol=1e-12)
  oc="fail"; # fail
  maxN=2^13
  N=4
  yv=method(f,T,y0,N)
  while true
    N=N*2
    if N>maxN break end
    yR=yv
    yv=method(f,T,y0,N)
    if abs(yv-yR)<tol*(1+abs(yv)) 
      oc="success" 
      break 
    end
  end
  yv,oc
end
