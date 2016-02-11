
(p "２数列の最長共通部分数列(連続する必要なし)")

(math "
f(x, y) = $begin{cases} 0 & (x = 0 or y = 0)
f(x-1, y-1) & (x = y)
$max ${f(x-1,y), f(x, y-1) $} & (else)
$end{cases}
")

(p "f(x-1, y-1)は、f(x-1,y)とf(x,y-1)の次の遷移に含まれるから考慮しなくてよい.")
(p "１変数のみ動かし、他の変数を固定して考えるのだと思うけど、まだよくわかってない.
ただ、単純に(x,y)の手前は(x-1,y)か(x,y-1)ということで良さそう.")

(ghc #!Q
import Data.List (maximumBy)
c a b = compare (length a) (length b)
f = g where
 g xss@(x:xs) yss@(y:ys)
  | x == y    = x : g xs ys
  | otherwise = maximumBy c [(g xss ys), (g xs yss)]
 g _ _ = ""
main = do
 print $ f "abcdefg" "bde"
 print $ f "abcdefg" "ace"
 print $ f "abcdefg" "kakcke"
 print $ f "abcdefg"       "kakdkbkekcdf"
 print $ f "azbzczdzezfzg" "kakdkbkekcdf"
Q :str #t)

(cpp #!Q
#include "myutils.h"
string f(string a, string b) {
  function <string(int, int)> loop = [&] (int i, int j) {
    if (i == a.size() || j == b.size())
      return string();
    else if (a[i] == b[j])
      return a[i] + loop(i+1, j+1);
    string s1 = loop(i, j+1);
    string s2 = loop(i+1, j);
    return (s1.size() > s2.size()) ? s1 : s2;
  };
  return loop(0, 0);
}
int main() {
  P(f("abcdefg", "ace"));
  P(f("abcdefg", "kakcke"));
  P(f("abcdefg", "kakdkbkekcdf"));
  P(f("azbzczdzezfzg", "kakdkbkekcdf"));
}
Q :str #t)
