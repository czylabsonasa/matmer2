h=0.001;
x=0.5:h:2*pi;
y=sin(100./(x));
d1=diff(y)./diff(x);
figure; plot(x(1:end-1),d1)
fd1=-100*cos(100./(x))./(x.*x);
hold on; plot(x,fd1); hold off
printf('az eltérés: %f\n',max(abs(fd1(1:end-1)-d1)))
