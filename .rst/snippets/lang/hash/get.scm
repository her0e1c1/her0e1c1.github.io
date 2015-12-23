
(ps "get")

(run "python -c 'print({\"a\": 1, \"b\": 2}[\"a\"])'")
(node "{a: 1, b: 2}.a")
(node "{a: 1, b: 2}[a]")
(node "{a: 1, b: 2}['a']")

(run "perl -E '%a=(a=>1, b=>2); say $a{a}'")
