clf;
xx=-20:0.0301:20;

F = @( x ) sin(0.5*x)./(0.5*x);
subplot(2,1,2);
plot(xx,F(xx),'r');
ylim([-0.5, 1.2])

yyy=cat(2, zeros(1,sum(xx<-0.5)),  ones(1,sum((-0.5<=xx)&(xx<=0.5))), zeros(1,sum(xx>0.5)) ) ;
size(xx)
size(yyy)
subplot(2,1,1);
plot(xx,yyy);
ylim([-0.2, 1.2])
print('negyszog','-dpdf') ;


