(load-from-current-dirctory "include.scm")
(define run oneliner-run+)
(define (run+ cmd) (let1 c #"cpe '~cmd'" (oneliner-run+ c)))

(ps "vector")

(ps "Declare")
(p "Declare a variable but it's empty.")
(run "cpe 'vector<int>v; P(v.empty())'")

(pw "pointerとして初期化できない")
(run+ "vector<int>* x =  {1,2,3};")
(run+ "vector<int>* x = &{1,2,3};")

(p "変数を介せばOK")
(run+  "vector<int> x = {1,2,3}; vector<int>* y = &x;")

(p "Create a vector of [0, 0, 0] ")
(run "cpe 'vector<int>v(3); PE(v)'")
(run "cpe 'vector<int>v(3, 7); PE(v)'")

(run "cpe 'vector<int>v{1,2,3,4,5}; PE(v)'")
(run "int a[] = {1, 2, 3, 4 ,5}; vector<int> v(a, a + 5); P(a)")

(p "Copy a vector")
(run "cpe 'vector<int>v(3, 7); vector<int> c(v); PE(c)'")

(run "cpe 'VI v1(10, 1), v2(10, 1); P(v1 == v2)'")
(run "cpe 'VI v1(10, 1), v2(10, 0); P(v1 == v2)'")

(p "10 * 10 vector")
(run "cpe 'VI v1(3, 1); vector<vector<int>> v2(3, v1); PE2(v2)'")
(run "cpe 'vector<vector<int>> v2(3, vector<int>(3, 1)); PE2(v2)'")

;; #define V(x, ...)                               \
;;   int __ ## x [] = {__VA_ARGS__};               \
;;   vector<int> x(__ ## x, __ ## x + SIZE(__ ## x))

;;   V(mv, 1, 2, 3, 4, 5);
;;   print(mv, "mv");
;; }
(pw "Even if you don't alocate memroy, you can set it")
(run+  "VI v{1,2,3}; v[100] = 1; P(v[100]);")

(ps "front")
(run+  "VI v{1,2,3}; P(v.front());")
(run+  "VI v{1,2,3}; P(v[0]);")

(ps "back")
(run+  "VI v{1,2,3}; P(v.back());")
(run+  "VI v{1,2,3}; P(v[v.size() - 1]);")

(ps "at")
(run+  "VI v{1,2,3}; P(v.at(0));")
(pw "If at(i) access out of range, error occurs")
(run+  "VI v{1,2,3}; P(v.at(10));")
(run "cpe 'VI v{1,2,3,4,5}; try{v.at(10);}catch(out_of_range& e){P(\"out of range\");}'")
;; // 配列のポインタを変更したら、意味のないものになる
;; // atを使ってもエラーが発生しない
;; vector<int> v1(3, 7);
;; vector<int> *p = &v1;
;; p++;
;; cout << "(*p).at(0) = " << (*p).at(0) << endl;

(ps "refer out of index")
(pw "[] can access index out of range")
(run+  "VI v{1,2,3}; P(v[100000000]);")
(run+  "VI v{1,2,3}; P(v[100]);")

(ps "clear")
(run+  "VI v{1,2,3}; v.clear(); PE(v);")

(ps "begin, end") 
(run+ "VI v{1,2,3,4,5}; PIT(v.begin(), v.end())")
(run+ "VI v{1,2,3,4,5}; PIT(v.begin(), v.begin())")
(dolist
 (i (iota 5 1))
 (run+ #"VI v{1,2,3,4,5}; PIT(v.begin(), v.begin() + ~i)"))
(run+ "VI v{1,2,3,4,5}; PIT(v.end(), v.end())")
(dolist
 (i (iota 5 1))
 (run+ #"VI v{1,2,3,4,5}; PIT(v.end() - ~|i|, v.end())"))
(run+ "VI v{1,2,3,4,5}; PIT(v.begin() + 1, v.end() - 1)")

(ps "rbegin, rend")
(run+ "VI v{1,2,3,4,5}; PIT(v.rbegin(), v.rend())")
(run+ "VI v{1,2,3,4,5}; PIT(v.rbegin() + 1, v.rend() - 1)")

(ps "compare (r)begin and (r)end")
(run+ "VI v{1,2,3,4,5}; P(v.begin() == v.end() - 5)")
(run+ "VI v{1,2,3,4,5}; P(v.rbegin() == v.rend() - 5)")
(pw "error")
(run+ "VI v{1,2,3,4,5}; P(v.rbegin() == v.end() - 5)")

(ps "iter")
(run "cpe 'VI v{1,2,3}; for(int i=0; i<v.size(); i++)P(v[i]);'")
(run "cpe 'VI v{1,2,3}; for(vector<int>::iterator it=v.begin(); it!=v.end(); it++)P(*it);'")
(run "cpe 'VI v{1,2,3}; for(vector<int>::reverse_iterator rit=v.rbegin(); rit!=v.rend(); rit++)P(*rit);'")

(pw "iはマクロで使われているので別の変数にすること")
(run+ "VI v{1,2,3}; REP(i, v.size()) PE(v[i]);")
(run+ "VI v{1,2,3}; REP(a, v.size()) PE(v[a]);")

(ps "find")
(run+ "VI v{1,2,3}; P(find(v.begin(), v.end(), 3) != v.end());")
(run+ "VI v{1,2,3}; P(find(ALL(v), 3) != v.end());")
(run+ "VI v{1,2,3}; P(find(v, v + v.size(), 3) != v.end());")
(run+ "VI v{1,2,3}; P(find(v.begin(), v.end(), 100) != v.end());")
(pw "Don't forget != v.end()")
(run+ "VI v{1,2,3}; P(find(v.begin(), v.end(), 3));")

(ps "count")
(run+ "VI v{1,1,1,2,2,3}; P(count(v.begin(), v.end(), 1));")
(run+ "VI v{1,1,1,2,2,3}; P(count(ALL(v), 2));")
(run+ "VI v{1,1,1,2,2,3}; P(count(ALL(v), 10));")

(ps "enumerate")
(p "pythonみたいに、tupleを使って表現できないので、配列を別に用意")
(define code.c #!HEREDOCUMENT EOS
#include "myutils.h"
int main() {
              //0 1 2 3 4
  vector<int> v{4,2,5,1,3};
  vector<int> n(v.size());
  REP(i, n.size()) n[i] = i;
  sort(ALL(n), [&] (int a, int b){return v[a] < v[b];});
  PE(n);
}
EOS
)
(run-cpp-from-string+ code.c)
