clf ;
hold on ;
xx = [ -20:0.05:-1, -1:0.011:1, 1:0.05:20 ] ;

F = @( x ) 2 * ( cos( x ) ./ x - sin( x ) ./ x.^2 ) ;
plot( xx, F( xx ) ) ;

dom = ( -1 <= xx & xx <= 1 ) ;
plot( xx( dom ), xx( dom ), 'r' ) ;
legend('F', 'f' ) ;

plot( xx( xx < -1 ), 0 * xx( xx < -1 ), 'r' ) ;
plot( xx( xx > 1 ), 0 * xx( xx > 1 ), 'r' ) ;
axis( [ -Inf, Inf, -1.2, 1.2 ] ) ;
print('f6plot','-dpdf') ;
