

(run "python -c '{a: 1}'" :warn "シンボルをkeyに指定できない")
(ghc "Data.Map.fromListWith (++) [(1, \"a\"), (1, \"b\"), (2, \"c\")]")


;; js
(p "書く時には\"key\"とクオテーションで括らなくても良いです。")
(pw "jsonデータは改行など、余計な文字が入ってはいけません。")

(cpp "map<string, int>m(\"a\", 1); P(m[\"a\"])")
(cpp "map<string, int>m={{\"a\", 1}, {\"b\", 2}}; P(m[\"a\"])")

(php "$dict = array(5 => 1, 12 => 2); echo \"$dict[5]\";")

(zsh "typeset -A y; y=(a 1 b 2 c 3)" :msg "Make associativ array named y")
