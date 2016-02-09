
(p "
- srcにある(n-1)個をbufへ移動
- srcにある残りのn個目をdstに移動(実際に1つ動かすのはここのみ)
- bufにある(n-1)個をdstに移動
")

(py "
def move(n, src, buf, dst):
 if n > 0:
  move(n-1, src, dst, buf)
  dst.append(src.pop())
  assert len(dst) <= 1 or dst[-1] < dst[-2], 'move wrong'
  print(s, b, d)
  move(n-1, buf, src, dst)
s, b, d = [5, 4, 3, 2, 1], [], []
move(len(s), s, b, d)
print(s, b, d)
" :str #t)
