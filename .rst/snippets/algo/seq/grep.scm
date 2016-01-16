
(ps "if the pattern matches line, then print the line and the N previous and N next lines")

(math "
f(i, n, q) = $begin{cases}
f(i+1, N, ${$}) & (match(a_i, pattern))
f(i+1, n-1, ${$})  & (n > 0)
f(i+1, 0, insert(a_1, q)) & (else)
$mbox{ただし、qは最大NまでのFIFOデータ構造}
$end{cases}
")

(py #!Q
def f(lines, pattern, N):
 queue = []
 n = 0
 for line in lines:    
  if pattern in line:
   while queue:
    print(queue.pop(0))
   print(line)
   n = N
  elif n > 0:
   print(line)
   n =- 1
  else:
   queue.append(line)
  if len(queue) > N:
   queue.pop(0)
f("1 p 3 2 1 4 3 3 4".split(), "3", 2)
Q :str #t)
