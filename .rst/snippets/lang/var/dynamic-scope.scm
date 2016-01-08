
(ps "localの意味")
(p "local変数の場合、その関数内の子供を含めたスコープでの書き換えは、親に影響しない")

(sh #!Q
v=10
f() {
 local v
 echo $v
}
f
Q :str #t :msg "ローカルであっても外側を参照")

(sh #!Q
v=10
f() {
 local v
 v=20
}
f
echo $v
Q :str #t :msg "fを抜けるとローカルvの値は、書き換えたとしても、元に戻る")

(sh #!Q
v=10
f() {
 v=20
}
f
echo $v
Q :str #t :msg "fを抜けるとvの値は、書き換えたまま")

(sh #!Q
v=10
g() {
 v=20
}
f() {
 local v
 echo "before $v"
 g
 echo "after $v"
}
f
echo "last $v"
Q :str #t :msg "gでの書き換えは、fで呼び出されているので、このスコープ内のvにのみ影響")

(ps "dynamic scope")

(sh #!Q
v=10
f() {
 echo "f $v"
}
g() {
 local v
 v=20
 echo "g $v"
 f 
}
g
echo "last $v"
Q :str #t :msg "gでvが書き換えられているので、fもその書き換わったvを参照")
