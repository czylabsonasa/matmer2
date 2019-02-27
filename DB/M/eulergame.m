1;

t0 = -1; y0 = 2;
t1 = 1; lepes=50;

%f= @(t, y) t.^2 + y;
f= @(t, y) -y + cos(t);
pkg load symbolic 
syms t y(t)
egy = diff(y, t) == f(t, y);
% pontos megoldas
sol=inline( dsolve(egy, y(t0) == y0));

hold on;

% közelítés
[t, y] = euler1( t0, y0, t1, lepes, f );
plot( t, y, 'o' );
abs( sol( t1 )-y( end ) )

%fd= @(t,y) y-cos(t)-sin(t)
%[t, y] = euler2( t0, y0, t1, lepes, f, fd );
%abs( sol( t1 )-y( end ) ) 
%plot( t, y, 'x' );

%fdd= @(t,y) -y + sin(t)
%[t, y] = euler3( t0, y0, t1, lepes, f, fd, fdd );
%abs( sol( t1 )-y( end ) ) 
%plot( t, y, 'd' );

% a pontos megoldas abrazolasa
xx=linspace( t0, t1, 200 );
plot( xx, sol(xx) );




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

function [t, y] = euler3( t0, y0, t1, lep, yp1, yp2, yp3 )
  t = linspace( t0, t1, lep+1 );
  h = t( 2 ) - t( 1 );
  y = zeros( size(t) );
  y(1) = y0;
  for i = 1:lep
    y(i+1) = y(i) + h*yp1(t(i), y(i)) + 0.5*h^2*yp2(t(i), y(i)) +h^3*yp3(t(i), y(i))/6; 
  end
end


