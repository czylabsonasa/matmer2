function numdiff(f, df, a, b, h)
   x=a:h:b;
   y=f(x);
   d1=diff(y)./diff(x);
   figure; plot(x(1:end-1),d1)
   fd1=df(x);
   delta=sum(abs(fd1(1:end-1)-d1));
   title(sprintf('az eltérés-összeg: %f\n',delta))
   hold on; plot(x,fd1); hold off
end
