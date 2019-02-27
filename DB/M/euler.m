1==1;
function [t, y] = euler1( t0, y0, t1, lep, yp1 )
  t = linspace( t0, t1, lep+1 );
  h = t( 2 ) - t( 1 );
  y = zeros( size(t) );
  y(1) = y0;
  for i = 1:lep
    y(i+1) = y(i) + h*yp1( t(i), y(i) ); 
  end
end

function [t, y] = euler2( t0, y0, t1, lep, yp1, yp2 )
  t = linspace( t0, t1, lep+1 );
  h = t( 2 ) - t( 1 );
  y = zeros( size(t) );
  y(1) = y0;
  for i = 1:lep
    y(i+1) = y(i) + h*yp1( t(i), y(i) ) + 0.5*h^2*yp2( t(i), y(i) ) ; 
  end
end
