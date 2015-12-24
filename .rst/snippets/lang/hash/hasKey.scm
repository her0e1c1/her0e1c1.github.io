
(run "python -c 'print(\"a\" in {\"a\": 1})'")
(run "ruby -e 'puts ({:a => 1}.key? \"a\")'" :msg "シンボルと文字列を区別する")
(node "P({a: 1}.hasOwnProperty(\"a\"))")
(node "P(\"a\" in {a: 1})")
(run "perl -E '%a=(a=>1); say exists($a{a})'")
(run "perl -E '%a=(a=>1); say exists($a{\"a\"})'")
(run "perl -E '%a=(a=>1); say %a ~~ /^a$/'")
(cpp "map<string, int>m={{\"a\", 1}}; P(m.find(\"a\") != m.end())")
