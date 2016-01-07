
(p "異なるn個の中から重複を許さずr個取り出す場合の数(nCr)")

(math "
f(${a_n$}, 0) = ${$phi$}
f($phi, x) = $phi
f(${a_n$}, k) = ${{a_n} $cup x $| x $in f(${a_{n-1}, k-1$}) $} $cup f(${a_{n-1}$}, k)
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
  -- 以下がrepeatedPermutation.hs
  -- go acc (x:xs) n = go (x:acc) (x:xs) (n-1) ++ go acc xs n
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
int main() {
}
Q :str #t)

(ps "nCr")
(ghc #!Q
combination :: (Integral a) => a -> a -> a
combination n r
  | r == 0 || n == r = 1
  | 0 <= r && r <= n = combination (n-1) r + combination (n-1) (r-1)
  | otherwise = error "bad args"
main = print $ combination 5 2
Q :str #t)
