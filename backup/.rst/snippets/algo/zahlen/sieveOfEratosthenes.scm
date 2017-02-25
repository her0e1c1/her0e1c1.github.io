(p "p*p以上の整数を篩にかける(残ったものが素数)")

(p"
size=100なら、10まで調べればOKになる
2, 4, 6, 8, 10, 12, 14, ... 98, 100
3, (6), 9, (12), ... 99
5, (10), (15), (20), 25, ... (100)
7, (14), (21), (28), (35), (42), 49 ... (98)
")

(ghc "
primes = f [2..] where
  f (p:xs) = p:f [x | x <- xs, (mod x p) /= 0]
main = print (takeWhile (<100) primes)
" :str #t)

(p "2の倍数、3の倍数、5の倍数、、、と素数の倍数で数え上げていくので、計算量はO(n)となる")

(cpp #!Q
#include <myutils.h>
vector<bool> make_prime_table(int size){
  vector<bool>isPrime(size, true);
  isPrime[0] = isPrime[1] = false;  // 0, 1は素数でないので2から始める
  for (int i = 2; i * i < size; i++) {  // (size-1)まで参照
    if (isPrime[i]) {
      // jは、iより小さい数からスタートしなくてよい(i=3なら、6でもなく9からでOK)
      for (int j = i; i * j < size; j++)
        isPrime[i * j] = false;
    }
  }
  return isPrime;
}
int main() {
  int size = 100;
  vector<bool> isPrime = make_prime_table(size);
  for(int i = 0; i < size; i++) {
    if (isPrime[i])
      cout << i << ", ";
  }
  cout << endl;
}
Q :str #t)