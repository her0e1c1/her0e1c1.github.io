
(run "perl -E '0 || die qq/エラー : $!/'")

(ps "guard")
(gosh (guard (var cond) cddr))
(gosh (guard (exc) 1))
(gosh (guard (exc) (/ 1 0)))
(gosh (guard (exc (else 0)) (/ 1 0)))

(emacs (unwind-protect (/ 1 0) (print "ERROR!")) :msg "bodyがエラーを起こしても、必ずCLEAN-UP-FORMSが呼ばれる(ただし、errorは無視されない!)")
(emacs (unwind-protect (/ 1 1) (print "always print this")))
(emacs (ignore-errors (/ 1 0)) :msg "Catch errors and return nil")
(emacs (ignore-errors (/ 10 1) 2 nil 1) :msg "Return the last expression")
(emacs (ignore-errors (unwind-protect (/ 1 0) (print "always print this"))) :msg "unwind-protectとignore-errorsを使い、エラーをキャッチして処理を続ける(失敗した場合はnil)")

(cpp #!DOC EOS
#include "myutils.h"
int main () {
  try {
    throw "error";
  } catch (const char* msg) {
    cout << msg;
  }
}
EOS
:msg "char*型は不可" :str #t)

(cpp #!DOC EOS
#include "myutils.h"
int main () {
  try {
    throw string("error 1");
  } catch (string msg){
    cout << msg;
  }
  try {
    throw new string("error 2");
  } catch (string* msg){
    cout << *msg;
  }
}
EOS
:str #t)

(cpp #!DOC EOS
#include "myutils.h"
int main () {
  try {
    throw "ANY";
  } catch (...){
    cout << "error";
  }
}
EOS
:str #t)


(node #!DOC EOS
try{
    throw null;
} catch (e) {
    if (e === null)
        console.log("NULL!");
}
EOS
:str #t)
