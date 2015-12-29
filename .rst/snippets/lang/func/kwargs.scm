
(template-map
 (cut cpp <> :msg "デフォルト引数はもっとも右側に指定していく" :str #t)
 '("hello();" "hello(\"John\");")
#!DOC EOS
#include <iostream>
#include <string>
using namespace std;
void hello(string h = "Ben", string s = "hello, world") {
  cout << h << " says " << s << endl;
}
int main() { REPLACE }
EOS
)

(gosh (begin (define (add :key (a 1) (b 2)) (+ a b)) (add :a 3)))
(emacs (progn (cl-defun add (&key (a 1) (b 2)) (+ a b)) (add :a 3)))
