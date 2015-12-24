
(ps "get")

(py "P({\"a\": 1, \"b\": 2}[\"a\"])")
(node "P({a: 1, b: 2}.a)")
(node "P({a: 1, b: 2}[a])")
(node "P({a: 1, b: 2}['a'])")

(run "perl -E '%a=(a=>1, b=>2); say $a{a}'")

(zsh "typeset -A y; y=(a 1 b 2 c 3); echo $y[a]")
(zsh "typeset -A y; y=(a 1 b 2 c 3); echo ${${(@M)y}[1]}")
