
;; //アロー演算子で書くことも可能
;; //(*p).method == p->method
(cpp "
  map<int, string>::iterator it = m.begin();
  for(; it != m.end(); it++){
    cout << (*it).first << \": \" << it->second << endl;
")
