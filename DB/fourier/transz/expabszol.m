function expabszol( gm )
clf ;
hold on ;
xx = [ -3:0.05:3 ] ;

F = @( g ) ( @( t ) ( 2*g ./ ( g^2 + t.^2 ) ) ) ;
% gm = 1
Fgm = F( gm ) ;
subplot(2,1,2)
plot( xx, Fgm( xx ),'r' ) ;
ylim([0,2.2])
subplot(2,1,1);
plot( xx, exp( -gm * abs( xx ) )) ;
title( sprintf( 'gamma=%.1f', gm ) ) ;
ylim([0,1.1]);

print('expabszol','-dpdf') ;
end
