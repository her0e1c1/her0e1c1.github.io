(load-from-current-dirctory "include-cpp.scm")

(ps "extend")
(run+ "VI a{1,2,3}, b{4,5};a.insert(a.end(), b.begin(), b.end());PE(a)")
(run+ "string a(\"abc\"), b(\"cd\");a.insert(a.end(), b.begin(), b.end());P(a)")

(ps "for-each")
(run+ "for(int i: {1,2,3}) P(i);")
(run+ "for(char ch: \"abcde\") P(ch);")

(ps "sort")
(p "Sort by asc")
(run+ "VI v{5,2,3,4,1}; sort(v.begin(), v.end()); PE(v);")
(p "Sort by desc (RECOMMEND)")
(run+ "VI v{5,2,3,4,1}; sort(v.rbegin(), v.rend()); PE(v);")
(run+ "VI v{5,2,3,4,1}; sort(v.rbegin(), v.rend(), greater<int>()); PE(v);")
(p "You can also use string as well")
(run+ "string s = \"ebacd\"; sort(ALL(s)); PE(s);")

(define code.c #!HEREDOCUMENT EOS
#include "myutils.h"
int main() {
  vector<pair<int, int>> v = {{1, 1}, {-2, 5}, {1, -1}, {3, 10}};
  sort(ALL(v));
  EACH(it, v)
    cout << it->first << ", " << it->second << endl;
}
EOS
)
(run-cpp-from-string+ code.c)

(sw "index参照するメソッドはない")
(run+ "list<int> l{1,2,3};")

(run+ "list<int> l;P(l.empty())")
(run+ "list<int> l; REP(i, 3) l.push_back(i);")

(sw "pop_back/pop_frontの戻り値はvoid")
(p "pop from back")
(run+ "list<int> l{1,2,3}; while(!l.empty()){P(l.back()); l.pop_back();}")
(run+ "list<int> l{1,2,3}; while(!l.empty()){P(l.front()); l.pop_front();}")
