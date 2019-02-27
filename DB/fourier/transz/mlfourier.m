syms t x
f = exp( -abs( t ) ) ;
F = fourier( f, t ) ;
fplot( [ f F ] ) ;
axis( [ -inf, inf, -0.5, 2.5 ] ) ;
legend( 'f', 'F' ) ;
F
