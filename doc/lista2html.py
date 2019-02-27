import sys
def olvas():
   d=list()
   for line in sys.stdin:
      akt=line.split('#')
      if len(akt[0])==0:
         continue
      akt=[ s.strip() for s in akt ]
      #print(akt)
      d=d+[akt]
   return d


print(r'''
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
   <style>
      table, th, td {
      border: 1px solid black;
      }
   </style>
</head>
<body>
<table style="width:60%">
<font size="7">
''')

d=olvas()
fej=d[0]
print(r'''
<tr><th>{volt}</th><th>{nev}</th>
'''.format(volt=fej[0], nev=fej[1]))
fej=fej[2:]
lfej=len(fej)
i=0
while i<lfej: 
   print(r'<th>{d} {dres}</th>'.format(d=fej[i], dres=fej[i+1]))
   i=i+2
print(r'''
</tr>''')

d=d[1:]
#from operator import itemgetter
d.sort(key=lambda x: x[1])

for sor in d:
   #print(sor)
   print(r'<tr><th>')
   print(sor[0])
   print(r'</th><th>')
   print(sor[1])
   print(r'</th><th>')
   i=0
   while i<lfej:
      print(r'{p} {pres}</th>'.format(p=sor[i+2], pres=sor[i+3]))
      i=i+2
   print(r'</tr>')

print(r'''
</table>
</body>
</html>
''')
