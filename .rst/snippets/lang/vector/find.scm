
(cpp "VI v{1,2,3}; P(find(v.begin(), v.end(), 3) != v.end());")
(cpp "VI v{1,2,3}; P(find(ALL(v), 3) != v.end());")
(cpp "VI v{1,2,3}; P(find(v, v + v.size(), 3) != v.end());")
(cpp "VI v{1,2,3}; P(find(v.begin(), v.end(), 100) != v.end());")
(cpp "VI v{1,2,3}; P(find(v.begin(), v.end(), 3));"
     :warn "Don't forget != v.end()")
