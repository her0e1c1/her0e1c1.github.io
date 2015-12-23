; 異なる型をまとめる

(cpp "pair<int, string> pis(10,\"str\");")
(cpp "pair<int, string> pis; pis = make_pair(1000, \"str\");")

(cpp "vector<pair<int, int>> v = {{1, -1}, {-2, 5}, {3, 10}};"
     :msg "need to #include <utility>")
(cpp "for(pair<int, int> x: {{1,2}, {2,5}});"
     :warn "同じ表現でも初期化できるが、forと組み合わせできない")
(cpp "vector<pair<int, int>> v = {{1, -1}, {-2, 5}, {3, 10}};
      EACH(it, v) cout << it->first << \", \" << it->second << endl;")

;; haskellでは同じ要素
;; [1,True]
