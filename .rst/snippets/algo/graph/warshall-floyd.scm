
(math "
W(i, j) &=& INF (E(i, j) = $phai) $mbox{頂点iとjが隣接していない}
W(i, i) &=& 0 $mbox{自分自身へは0}

F(i, j, 0) &=& W(i, j)  -- (1)
F(i, j, k) &=& $min ${F(i, j, k - 1), F(i, k, k - 1) + F(k, j, k - 1) $}
")

(p "途中経路に頂点1=>kを使い、i=>jの最短経路をF(i, j, k)とおく。

k=0のとき、つまりF(i,j,0)であれば、途中経路に頂点を一つも使わずに、
i=>jまでの最短経路を意味する。隣接していないときは、INFとなる。

k=1のとき、つまりF(i,j,1)であれば、i=>jまでの最短経路に頂点1を使用しても良いことになる。

k-1まで使用する場合、i=>kやk=>jへの移動は、k-1までを使っても可能ということになる
")

(p "ダイクストラとは異なり、負の値がコストであっても動作する")

(cpp "
#include <myutils.h>
int inf = 1 << 20;  // 1 << 30にすると配列の計算でoverflowするので多少小さい値にすること
int wf(int n, vector<int> x, vector<int> y, vector<int> w){
 vector<vector<int>> a(n, vector<int>(n, inf));
 for (int i = 0; i < n; i++) a[i][i] = 0;  // 0とINFの初期化必須
 for (int i = 0; i < x.size(); i++) a[x[i]][y[i]] = w[i];  // u => v (cost)
 for (int k = 0; k < n; k++) 
  for (int i = 0; i < n; i++)
   for (int j = 0; j < n; j++)
    a[i][j] = min(a[i][j], a[i][k] + a[k][j]);
 return a[0][n-1];
}

int main(){
  cout <<
    wf(4,
       {0, 0, 0, 1, 1, 2},
       {1, 2, 3, 2, 3, 3},
       {1, 3, 4, 1, 3, 1})
       << endl; // result == 3
}
")
