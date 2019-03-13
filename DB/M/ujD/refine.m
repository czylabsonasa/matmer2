function [yv,oc]=refine(f,T,y0,method,tol=1e-9)
  oc='fail';% fail
  maxN=2^13;
  N=4; yv=method(f,T,y0,N);
  while true
    N=N*2;
    if N>maxN break end
    yR=yv;
    yv=method(f,T,y0,N);
    if abs(yv-yR)<tol*(1+abs(yv)) oc='success'; break end
  end
end
