
(p "異なるn個の中から重複を許さずr個取り出す場合の数(nCr)")

(math "
f(n, 0) &=& ${$phi$}
f(0, x) &=& $phi
f(n, k) &=& ${ ${a_n$} $cup x $mid x $in f(n-1, k-1) $} $cup f(n-1, k)
")

(ghc #!Q
comb :: (Num a) => [a] -> Int -> [[a]]
comb = go where
  go _ 0      = [[]]  -- 先頭に記述すること
  go [] _     = []
  go (x:xs) n = (map (x:) $ go xs (n-1)) ++ go xs n
main = do
  print $ comb [1..3] 2
  print $ comb [1..5] 4
Q :str #t)

(p "結果を引数に保持する記述方法")
(ghc #!Q
comb :: (Num a) => [a] -> Int -> [[a]]
comb = go [] where
  go acc _ 0      = [acc]  -- 先頭に記述すること
  go acc [] _     = []
  go acc (x:xs) n = go (x:acc) xs (n-1) ++ go acc xs n
main = do
  print $ comb [1..3] 2
  print $ comb [1..5] 4
Q :str #t)

(ps "nC3(using loop)")

(cpp #!Q
#include <myutils.h>
void nC3(vector<int> N){
  int size = N.size();
  for (int i = 0; i < size-2; i++){
    for (int j = i+1; j < size-1; j++){
      for (int k = j+1; k < size; k++){
        cout << N[i] << ", " << N[j] << ", " << N[k] << endl;
      }
    }
  }
}
int main() { nC3({1,2,3,4,5}); }
Q :str #t)

(ps "nCr")

(pw "be careful of overflow")

(math "
{}_n C _0 &=& 1
{}_n C _n &=& 1
{}_n C _r &=& {}_{n-1} C _r + {}_{n-1} C _{r-1}
")

(ghc "
comb :: (Integral a) => a -> a -> a
comb n r
  | r == 0 || n == r = 1
  | 0 <= r && r <= n = comb (n-1) r + comb (n-1) (r-1)
main = print $ comb 5 2
")
