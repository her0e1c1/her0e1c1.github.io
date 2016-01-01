
(define path "ifdef.c")
(ps "ifdef")

(define code (template$ #!Q
#include <stdio.h>
REPLACE
int main () {
#ifdef DEBUG
  printf("DEBUG!");
#else
  printf("NOT DEBUG!");
#endif
}
Q))

(let1 c (code "")
      (create-file-from-string path c)
      (print (sphinx-block c :code-block "c")))
(run #"clang -DDEBUG ~path && ./a.out"
     :msg "ifdef else endifはソースコードをコンパイルする前の前処理. オプションを渡すことでdefineされる")
(run #"clang ~path && ./a.out"
     :msg "引数を渡さなかった場合はelseが呼ばれる")

(let1 c (code "#define DEBUG")
      (create-file-from-string path c)
      (print (sphinx-block c :code-block "c")))
(run #"clang ~path && ./a.out"
     :msg "``#define DEBUG`` を明示する (-DDEBUGと同じ効果)")
