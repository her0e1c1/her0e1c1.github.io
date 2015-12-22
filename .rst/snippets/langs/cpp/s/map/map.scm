(load-from-current-dirctory "include-cpp.scm")

(ps "Initialize")
(run+ "map<string, int>m(\"a\", 1); P(m[\"a\"])")
(run+ "map<string, int>m={{\"a\", 1}, {\"b\", 2}}; P(m[\"a\"])")

(ps "insert")
(run+ "map<string, int>m={{\"a\", 1}}; m.insert(map<string,int>::value_type(\"b\", 2)); P(m[\"b\"])")
(run+ "map<string, int>m={{\"a\", 1}}; m.insert(make_pair(\"b\", 2)); P(m[\"b\"])")

(ps "update")
(run+ "map<string, int>m={{\"a\", 1}}; m[\"a\"]=2; P(m[\"a\"])")

(ps "find")
(run+ "map<string, int>m={{\"a\", 1}}; P(m.find(\"a\") != m.end())")

  map<int, string>::iterator it = m1.begin();
  for(; it != m1.end(); it++){
    //アロー演算子で書くことも可能
    //(*p).method == p->method
    cout << (*it).first << ": " << it->second << endl;
