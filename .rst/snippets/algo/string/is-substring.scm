
(ps "brute-force algorithm")

(p "計算量はO(nm)だが、文字の種類が多いので，たいていの場合
パターンの先頭の 数文字を調べるだけで済むので、実質O(n)")

(math "
f(i, j, start) = $begin{cases} 0 & (*i = 0)
1 & (*j = 0)
f(i+1, j+1, start) & (*i == *j)
f(start+1, 0, start+1) & (else)
$end{cases}
")

(c #!Q
#include <myc.h>
int isSubstring(char *s, char *t) {
 int i, j, start;
 i = j = start = 0;
 while (1) {
  if (!*(t + j))
   return 1;
  else if (!*(s + i))
   return 0;
  else if (*(s + i) == *(t + j)) {
   i++;
   j++;
  } else {
   i = start = start + 1;
   j = 0;
  }
 }
}
int main() {
 #define E(a, b) printf("%s, %s => %d\n", a, b, isSubstring(a, b));
 E("abc", "abc");
 E("abcde", "abc");
 E("abcde", "bc");
 E("abcde", "c");
 E("abcde", "");
 E("abcde", "ace");
 E("abcabde", "abd");
 E("abcabde", "ad");
 E("ab", "abd");
 E("", "abc");
 E("", "");
}
Q :str #t)
