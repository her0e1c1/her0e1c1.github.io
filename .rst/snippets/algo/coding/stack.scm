#include <myutils.h>

// TODO: 再帰関数とstackの関係
// http://d.hatena.ne.jp/sune2/20130129/1359429399


// stackを使って動いているように見えるが
// 関数は、stackでデータを保存し、かつ、戻りアドレスを知る必要がある
// つまり、stackだけ用意しても無意味なはず

// 今回は、戻り値が=で繋がっているからできている気がする

int ack(int m, int n) {
  stack<int> S;
  while(1) {
    if (m == 0) {
      n++;
      if (S.empty()) return n;
      else {
        m = S.top(); S.pop();
      }
    } else if (n == 0) {
      m--;
      n = 1;
    } else {
      S.push(m-1);
      n--;
    }
  }
}

int main() {
  P(ack(3, 3));
  P(ack(3, 4));
}
