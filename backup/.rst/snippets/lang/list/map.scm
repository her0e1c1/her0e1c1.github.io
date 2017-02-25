
(perl "say for map {$_ + 1} 1..3")
(node "P([1,2,3].map(x => x+1))")

(gosh (map cons '(1 2 3) '(4 5 6)))
(gosh (map (lambda (x y) (+ x y)) '(1 2 3) '(4 5 6))
      :msg "１つ以上のリストを引数に取れる")
(gosh (map + (iota 5) (iota 5)))

(emacs (mapcar (lambda (x) (+ x 1)) '(1 2 3)))
(emacs (--map (+ 1 it) '(1 2 3)))


(c #!DOC EOS
#include <stdio.h>
// 引数に関数の型を指定(Int -> Int)
int* map(int (* f)(int), int* list){
  int* p = list;
  while(*list){
    *list = f(*list);
    list++;
  }
  return p;
}
int doubleInt(int x){
  return x * x;
}
int main(){
  int v[] = {1, 2, 3, 0};
  int* rv = map(doubleInt, v);
  for(int* p = rv; *p; p++){
    printf("%d, ", *p);
  }
}
EOS
:str #t)
