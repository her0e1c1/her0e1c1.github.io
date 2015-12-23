
(sh "
f(){
     [ $# -eq 1 ] && echo one
     [ $# -eq 2 ] && echo two
   }
f 1
f 1 2
"
:warn "等しいに文字列の=を使わない!")
