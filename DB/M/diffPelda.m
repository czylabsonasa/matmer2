v=[1:7].^2
v =
    1    4    9   16   25   36   49
dv=diff(v)
dv =
    3    5    7    9   11   13
diff(diff(v))
ans =
   2   2   2   2   2
diff(v,2)
ans =
   2   2   2   2   2
