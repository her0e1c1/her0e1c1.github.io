(load-from-current-dirctory "include.scm")

(define path "ifdef.c")
(p (sphinx-section "ifdef"))

(define ifdef.c #!HEREDOCUMENT EOS
#include <stdio.h>
// #define DEBUG
int main () {
#ifdef DEBUG
  printf("DEBUG!");
#else
  printf("NOT DEBUG!");
#endif
}
EOS
)

(create-file-from-string path ifdef.c)
(sphinx-block-c+ path)

(p "ifdef else endifはソースコードをコンパイルする前の前処理.")
(p "オプションを渡すことでdefineされる")
(oneliner-run+ #"clang -DDEBUG ~path && ./a.out")

(p "引数を渡さなかった場合はelseが呼ばれる")
(oneliner-run+ #"clang ~path && ./a.out")

(define ifdef2.c (regexp-replace #/\/\/ / ifdef.c ""))
(create-file-from-string path ifdef2.c)
(sphinx-block-c+ path)

(p "``#define DEBUG``を明示する (-DDEBUGと同じ効果)")
(oneliner-run+ #"clang ~path && ./a.out")


