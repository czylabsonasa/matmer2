#letölteni és load-olni
#pkg install symbolic-2.6.0.tar.gz
pkg load symbolic
syms x y(x)
egy=diff(y,x)==y+x+2
dsolve(egy)
