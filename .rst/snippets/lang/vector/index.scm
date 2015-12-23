
(ps "front")
(cpp  "VI v{1,2,3}; P(v.front());")
(cpp  "VI v{1,2,3}; P(v[0]);")

(ps "back")
(cpp  "VI v{1,2,3}; P(v.back());")
(cpp  "VI v{1,2,3}; P(v[v.size() - 1]);")

(ps "at")
(cpp  "VI v{1,2,3}; P(v.at(0));")
(cpp  "VI v{1,2,3}; P(v.at(10));"
      :warn "If at(i) access out of range, error occurs")
(cpp "VI v{1,2,3,4,5}; try{v.at(10);} catch(out_of_range& e){P(\"out of range\");}")

;; // 配列のポインタを変更したら、意味のないものになる
;; // atを使ってもエラーが発生しない
;; vector<int> v1(3, 7);
;; vector<int> *p = &v1;
;; p++;
;; cout << "(*p).at(0) = " << (*p).at(0) << endl;

(ps "refer out of index")
(pw "[] can access index out of range")
(cpp  "VI v{1,2,3}; P(v[100000000]);")
(cpp  "VI v{1,2,3}; P(v[100]);")

(py "P([1,2,3][1])")
(zsh ("a=(1 2 3); echo ${a[1]}")
