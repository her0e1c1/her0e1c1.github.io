(load-from-current-dirctory "include-cpp.scm")

(ps "hello world")
(run+ "[](){ cout << \"hello world\" << endl; }();")
(run+ "[]{ cout << \"hello world\" << endl; }();")

(run+ "cout << bitset<8>(10) << endl;")

(p "
cout stands for console output

likewise,
cin  is console input
cerr is console error
")

(run+ "cout << \"str\";")
(run+ "cout << flush;")
(run+ "cout << endl;")
(p "Don't worry about type like int, string, or bool etc.")
(run+ "cout << \"bool: true \" << true << \", false \" << false << endl;")


(p "
bool型があります。
#define true 1
#define false 0
")



// デフォルト引数はもっとも右側に指定していく
#include <iostream>
#include <string>
using namespace std;
void hello(string h = "Ben", string s = "hello, world") {
  cout << h << " says " << s << endl;
}
int main() {
  hello();
  hello("John");
}


// return忘れない。最後にセミコロン必要
#include "myutils.h"
int main() {
  function<long(int)> fact = [&] (int n){ return (n==1) ? 1L : n * fact(n-1); };
  P(fact(5));
}



/*
[] don't capure anything

Bellow you can use closure

[&] capture-by-reference

[=] capture-by-value (copy)
*/

int main()
{
  // lambdaは以下の項目からなる
  // 型 変数 = [キャプチャ] (シグニチャ) {本体};
  // [キャプチャ] (シグニチャ) {本体} (関数呼び出し);
  [](){ cout << "hello world" << endl; }();

  // []の場合は外側の変数を参照しないが、
  // fact自体を参照する必要があるので&が必要
  function<long(int)> fact = [&] (int n){
    if (n == 1)
      return 1L;
    return n * fact(n - 1);
  };  //最後にセミコロンが必要
  P(fact(10));

  // 型を明示するのが面倒ならauto
  auto not_fact = [&] (int n) {
    if (n == 1)
      return 1L;
    // 型がautoなので関数の戻り値がコンパイラでは分からない
    // return (long)n * not_fact(n - 1);
    return (long)n;
  };
  P(not_fact(10));

  // int N = 1;
  // auto l1 = [=](){
  //   N = 2;  // コピーを書き換えようとするのでコンパイルエラー
  //   P(N);
  // };
  // l1();
  // P(N);

  int N2 = 1;
  auto l2 = [&](){
    N2 = 2;  // 参照先を書き換える
  };
  l2();
  P(N2);

  int N3 = 1;
  auto l3 = [=]() mutable{
    N3 = 2;  // コピーの変数を書き換える
  };
  l2();
  P(N3);  // コピー元は書き変わらない

  // こっちはOK
  function <void(vector<int>)>f2 = [&] (const vector<int> & n) {
    P("f1");
  };

  // 型がそろってないのでエラー
  // function <void(vector<int>)>f2 = [&] (vector<int> & n) {
  //   P("f2");
  // };

  function <void(vector<int>)>f3 = [&] (vector<int> n) {
    P("f3");
  };

  return 0;
}
