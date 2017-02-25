
(ptodo "???")

(math "
{a_1, a_2, ... a_k}, 1 $le k < i S.T.
f(i) = ${ a_1, a_2, ... a_{k'} $} ( $ne $phi, a_{k'} > a_i S.T. $max k')
f(i) = ${ a_i $} (else)
")

(py #!Q
def f(s, ai):
 while s:
  if s[-1] < ai:
   s.pop()
  else:
  return s
 else:
  return [ai]
Q :str #t)
