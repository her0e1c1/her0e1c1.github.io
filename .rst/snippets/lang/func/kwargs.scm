
(template-map
 (cut cpp <> :msg "デフォルト引数はもっとも右側に指定していく" :file #t)
 '("hello();" "hello(\"John\");")
#!DOC EOS
#include <iostream>
#include <string>
using namespace std;
void hello(string h = "Ben", string s = "hello, world") {
  cout << h << " says " << s << endl;
}
int main() { REPLACE }
EOS
)
