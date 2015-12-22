#include <vector>
#include <iostream>

using namespace std;

#define P(x) cout << #x << " = " << (x) << endl;

// whileとリストを組み合わせたqueueは記述が面倒なので省略して記述
int main()
{
  // queue
  // popはリストの先頭に代入
  // pushはリストの末尾に代入

  int n = 10;
  int s = 0;  // start
  int b, e, q[n];

  // bは現在のqの最初の要素のindexを表す
  // eは現在のqの最後の要素のindexを表す
  // b == eのときは要素が１つ

  // bとeに0を代入した後、 q[0] = sを評価
  // b++は、popと意味的に同じ。一つ前の値を破棄して次の先頭に移る

  q[b = e = 0] = s;  // init

  // pushは新たに追加するのでeをインクリメントする必要がある
  q[++e] = 1;  // push
  q[++e] = 2;

  // popは現在の値を取得した後、破棄するので後からincremntする
  P(q[b++]); // pop
  P(q[b++]);
  P(q[b++]);

  P(b == e + 1);  // empty

  // for(q[b = e = 0] = s; b <= e; b++){
  //   // push
  //   q[1] = 1;
  //   e++;
  //   // P(e);
  //   // q[++e] = 1;
  // }


  return 0;
}
