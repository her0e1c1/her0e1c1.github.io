
(sh #!Q
a="A"
f(){
 local a="a"
 readonly a
 echo $a
}
f
Q :str #t)

(sh #!Q
a="A"
f(){
 local a="a"
 readonly a
 a="HOGE"
 echo $a
}
f
Q :str #t :warn "Can't modify a")

(sh #!Q
f(){
 readonly local a="a"
 echo "$local and $a"
 local=1
}
f
Q :str #t :warn "併用不可(localという名前の変数を宣言)")
