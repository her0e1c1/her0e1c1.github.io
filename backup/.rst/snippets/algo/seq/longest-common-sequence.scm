
(p "２数列の最長共通部分数列(連続する必要なし)")

(math "
f(x, y) = $begin{cases} 0 & (x = 0 or y = 0)
f(x-1, y-1) + 1 & (x = y)
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
  vector<vector<string>> dp(a.size()+1, vector<string>(b.size()+1 , ""));
 for (int x=0; x<a.size(); x++) {
  for (int y=0; y<b.size(); y++) {
   if (a[x] == b[y]) dp[x+1][y+1] = dp[x][y] + a[x];
   else {
    string s1 = dp[x][y+1], s2 = dp[x+1][y];
    dp[x+1][y+1] = (s1.size() > s2.size()) ? s1 : s2;
   }
  }
 }
 return dp[a.size()][b.size()];
}
int main() {
  P(f("abcdefg", "ace"));
  P(f("abcdefg", "kakcke"));
  P(f("abcdefg", "kakdkbkekcdf"));
  P(f("azbzczdzezfzg", "kakdkbkekcdf"));
}
Q :str #t)
