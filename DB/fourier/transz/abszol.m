clf;
xx=-15:0.05:15;

F = @( x ) 2 * sin( x ) ./ x + 2 * ( cos( x ) - 1 ) ./ x.^2 ;
subplot(2,1,2);
plot(xx,F(xx),'r');
ylim([-0.8, 1.2])

subplot(2,1,1);
plot(xx(xx<-1),zeros(size(xx(xx<-1))));
hold on;
plot(xx((-1<=xx)&(xx<=1)), abs(xx((-1<=xx)&(xx<=1))));
plot(xx(xx>1),zeros(size(xx(xx>1))));
ylim([-0.2, 1.2])
print('abszol','-dpdf') ;

