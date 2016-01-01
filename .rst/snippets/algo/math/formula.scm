(define DATA1 (generator->list (integers$ 20 -10) 10))

(ps "配列の３つの積の最大値は?")
(math "$max_{i,j,k $in N} a[i] $times a[j] $times a[k]")
(eval-null `(gosh
 #"(print
    (let1 l (pa$ at (sort '~DATA1))
       (max (* (l -1) (l -2) (l -3))
            (* (l 0) (l 1) (l -1)))))"
 :str #t))

(ps "特定の区間にある整数")
(math "$# ${i| A $leqq i $leqq B $}")
(gosh (let1 f (^(A B) (if (>= A B) 0 (+ (- B A) 1))) (f 3 9)))
(math "$# ${i| A < i < B $}")
(gosh (let1 f (^(A B) (if (>= A B) 0 (+ (- B A) -1))) (f 3 9)))
(math "$# ${i| A < i $leqq B $}")
(math "$# ${i| A $leqq i < B $}")
(gosh (let1 f (^(A B) (if (>= A B) 0 (- B A))) (f 3 9)))


(ps "特定の区間にあるKの倍数の数")
(math "$# ${i| A $leqq i $leqq B, i $bmod K = 0 $}")
(math "
A = Km + n $leqq & i = K*j & $leqq B = Km' + n' & <=>
m + n/K    $leqq & j   & $leqq m' + n'/K

以下を考慮
0 $leqq & n/K, n'/K & < 1

Kの倍数から整数に帰着
m $leqq & j & $leqq m' & (n/K = 0)
m <     & j & $leqq m' & (else)
")
(gosh (let1 f (^[A B K] (+ (- (div B K) (div A K))
                           (if (= (mod A K) 0) 1 0)))
            (f 3 10 3)))


(ps "不等式の最小値")
(math "$min_{x $in Z, a>0, b>0 $in N} x >= a/b")
(math "
$min_x = $begin{cases}
 [a/b]     & (a $bmod b = 0)
 [a/b] + 1 & (else)
$end{cases}
")
(gosh (let1 f (^[a b] (if (= (mod a b) 0) (div a b) (+ (div a b) 1))) (f 8 2)))
(gosh (let1 f (^[a b] (if (= (mod a b) 0) (div a b) (+ (div a b) 1))) (f 8 3)))

(ps "２分割した数列の差の最小値")
(p "計算量をO(n^2) => O(n)に減らすことができる。微分みたいに、差を使うことで次元を下げるのに似ている。")
(p "TapeEquilibrium (必ず２つに分ける必要がある場合、1<= x <= N-1とする必要あり)")
(math "S_{Nx} = $sum_{i=x+1}^{N} a_i - $sum_{i=1}^{x} a_i $quad $text{s.t.} $quad $min_{x} | S_{Nx} |")
(math "
S_{N0} & = & a_N + a_{N-1} + ... + a_2 + a_1
S_{N1} & = & a_N + a_{N-1} + ... + a_2 - a_1
S_{N2} & = & a_N + a_{N-1} + ... - a_2 - a_1
...
S_{Nx}     & = & a_N + a_{N-1} + ... + a_{x+1} - a_x ... - a_2 - a_1
S_{N(x+1)} & = & a_N + a_{N-1} + ... - a_{x+1} - a_x ... - a_2 - a_1
...
S_{N(N-1)} & = & a_N - a_{N-1} + ... - a_2 - a_1
S_{NN}     & = & - a_N - a_{N-1} + ... - a_2 - a_1

よって、２項間の差は以下のとおり
S_{N(x+1)} - S_{Nx} & = & - 2 a_{x+1} 

S_{N0}から始めて-2 a_xを追加していき、その絶対値をとり、最大値を探す。
S_{N0}の和を求めるのと、S_{N0}からS_{NN}までの探索で、計算量はO(2N)となる。
")
(c "
#include <myc.h>
int abs(int x) {return x < 0 ? -x : x;}
int solution(int *a, int N) {
  int sum = 0;
  for (int i = 0; i < N; i++) sum += a[i];
  int ms = abs(sum);
  for (int i = 0; i < N; i++) {
   sum -= 2 * a[i];
   int s0 = abs(sum);
   if (s0 < ms)
    ms = s0;
 }
 return ms;
}
int main() {
 int a[] = {3,1,2,4,3};  // ans=1
 printf(\"%d\", solution(a, SIZE(a))); 
}
" :str #t)
