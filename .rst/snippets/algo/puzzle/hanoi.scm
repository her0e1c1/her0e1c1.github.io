
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
  move(n-1, buf, src, dst)
src, buf, dst = [5,4,3,2,1], [], []
move(len(src), src, buf, dst)
print(src, buf, dst)
" :str #t)
