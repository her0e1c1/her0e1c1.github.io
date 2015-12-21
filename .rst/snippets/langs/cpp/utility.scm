

// if you want to use pair, then include utility
// #include <utility>

void init(){
  //pairは二つの要素を持つデータ型です。
  pair<int, int> pii(10,100);
  cout << pii.first << " " << pii.second << endl;

  //make_pairでも可能です。
  pair<int, string> pis;
  pis = make_pair(1000, "string");
