
(run "python -c 'print(sorted([1, 4, 2, 5, 6, 7, 3]))'")

(perl "@a=qw(abc b a z);say sort(@arr);")
(pw "sort関数は、2と11の場合、11が先になる")
(perl "@a=qw(11 10 1 2);say for sort @a")
(perl "@a=qw(11 10 1 2); @b=sort{$a<=>$b}@a; say qq/@b/")

(emacs (sort '(1 4 2 5 6 7 3) '<))

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

(cpp #!DOC EOS
#include "myutils.h"
int main() {
  vector<pair<int, int>> v = {{1, 1}, {-2, 5}, {1, -1}, {3, 10}};
  sort(ALL(v));
  EACH(it, v)
    cout << it->first << ", " << it->second << endl;
}
EOS
:str #t)

;; #include "myutils.h"

;; bool cmp1(pair<int, int> v1, pair<int, int> v2){
;;   //secondをkeyにした昇順
;;   return make_pair(v1.second, v1.first) < make_pair(v2.second, v2.first);
;;   //本来 return PII(v1.first, v1.second) < PII(v2.first, v2.second);
;;   //降順 return PII(v1.first, v1.second) > PII(v2.first, v2.second);
;; }

;; int main() {
;;   vector<pair<int, int>> v;
;;   string s1 = "403569271";
;;   string s2 = "391856902";
;;   for(int i = 0; i < s1.size(); i++)
;;     v.push_back(make_pair(s1[i] - '0', s2[i] - '0'));
;;   sort(v.begin(), v.end(), cmp1);
;;   EACH(it, v)
;;     cout << it->first << ", " << it->second << endl;
;; }

(py #!Q
def compare(a, b):
    a1, a2 = a
    b1, b2 = b
    c = cmp(a1, b1)
    if c != 0:
        return c
    else:
        return cmp(a2, b2)
print(sorted([(2,3), (1,2), (2,1)], cmp=compare))
Q :str #t)

(py "a=[(1,1),(2,0),(3,2),(1,2),(1,0)]; sorted(a,key=lambda x:(x[0],x[1]))")
