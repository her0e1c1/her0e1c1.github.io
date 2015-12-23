
(run "python -c 'print(sorted([1, 4, 2, 5, 6, 7, 3]))'")


(perl "@a=qw(abc b a z);say sort(@arr);")
(pw "sort関数は、2と11の場合、11が先になる")
(perl "@a=qw(11 10 1 2);say for sort @a")
(perl "@a=qw(11 10 1 2); @b=sort{$a<=>$b}@a; say qq/@b/")


;; C = function(val){
;;     this.val = val;
;; };
;; function _sort(c1, c2){
;;     return c1.val - c2.val;
;; };
;; var data = [];
;; data[0] = new C(3);
;; data[1] = new C(1);
;; data[2] = new C(2);
;; data.sort(_sort);

(p "Sort by asc")
(cpp "VI v{5,2,3,4,1}; sort(v.begin(), v.end()); PE(v);")
(p "Sort by desc (RECOMMEND)")
(cpp "VI v{5,2,3,4,1}; sort(v.rbegin(), v.rend()); PE(v);")
(cpp "VI v{5,2,3,4,1}; sort(v.rbegin(), v.rend(), greater<int>()); PE(v);")
(p "You can also use string as well")
(cpp "string s = \"ebacd\"; sort(ALL(s)); PE(s);")

(cpp #!HEREDOCUMENT EOS
#include "myutils.h"
int main() {
  vector<pair<int, int>> v = {{1, 1}, {-2, 5}, {1, -1}, {3, 10}};
  sort(ALL(v));
  EACH(it, v)
    cout << it->first << ", " << it->second << endl;
}
EOS
:file #t)
