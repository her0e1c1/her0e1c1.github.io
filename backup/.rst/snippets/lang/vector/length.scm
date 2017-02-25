
(cpp "VI v{1,2,3}; REP(i, v.size()) PE(v[i]);"
     :warn "iはマクロで使われているので別の変数にすること")
(cpp "VI v{1,2,3}; REP(a, v.size()) PE(v[a]);")
