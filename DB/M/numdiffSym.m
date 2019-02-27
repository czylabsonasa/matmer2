function numdiffSym(f, df, a, b, h)
  x=a:h:b;
  y=f(x);
  d1=(y(3:end)-y(1:end-2))/(2*h);
  figure; plot(x(2:end-1),d1)
  fd1=df(x);
  delta=sum(abs(fd1(2:end-1)-d1));
  title(sprintf('az eltérés-összeg: %f\n', delta));
  hold on; plot(x,fd1); hold off
end
