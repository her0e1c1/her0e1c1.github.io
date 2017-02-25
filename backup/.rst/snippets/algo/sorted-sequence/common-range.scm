
(ps "[(a_i, b_i)]における共通部分")

(math "
a_i $le b_i S.T.
f(i, no) = $begin{cases}
f(i, no+1) & (a_i > no)
f(i, print(no)+1) & (a_i $le no < b_i)
f(k, print(no)+1) & ($min_{b_i < b_k} k)
$end{cases}
")

(py #!Q
a = [1, 4, 5, 9]
b = [3, 6, 7, 9]
lines="0 1 2 3 4 5 6 7 8 9 10".split()
def f(i, no):
 if i == len(a):
  return
 if a[i] > no:
  f(i, no+1)
 elif a[i] <= no < b[i]:
  print(lines[no])
  f(i, no+1)
 else:
  print(lines[no])
  k = i+1
  while k < len(a):
   if b[i] < b[k]:
    break
   k += 1
  f(k, no+1)
f(0, 0)
Q :str #t)
