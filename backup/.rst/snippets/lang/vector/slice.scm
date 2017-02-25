
(ps "begin, end") 
(cpp "VI v{1,2,3,4,5}; PIT(v.begin(), v.end())")
(cpp "VI v{1,2,3,4,5}; PIT(v.begin(), v.begin())")
(dolist
 (i (iota 5 1))
 (cpp #"VI v{1,2,3,4,5}; PIT(v.begin(), v.begin() + ~i)"))
(cpp "VI v{1,2,3,4,5}; PIT(v.end(), v.end())")
(dolist
 (i (iota 5 1))
 (cpp #"VI v{1,2,3,4,5}; PIT(v.end() - ~|i|, v.end())"))
(cpp "VI v{1,2,3,4,5}; PIT(v.begin() + 1, v.end() - 1)")

(ps "rbegin, rend")
(cpp "VI v{1,2,3,4,5}; PIT(v.rbegin(), v.rend())")
(cpp "VI v{1,2,3,4,5}; PIT(v.rbegin() + 1, v.rend() - 1)")

(ps "compare (r)begin and (r)end")
(cpp "VI v{1,2,3,4,5}; P(v.begin() == v.end() - 5)")
(cpp "VI v{1,2,3,4,5}; P(v.rbegin() == v.rend() - 5)")
(cpp "VI v{1,2,3,4,5}; P(v.rbegin() == v.end() - 5)"
     :warn "error")
