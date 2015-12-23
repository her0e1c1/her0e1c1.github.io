
(run "ruby -e 'a=%Q/abc/; a << %Q/efg/; puts a'"
     :msg "破壊的")
(run "ruby -e 'puts %Q/abc/.concat(%Q/efg/)'"
     :msg "<< と同じ")

(node "\"abc\" + \"efg\"")
(run "perl -E 'say \"abc\".\"efg\"'")
(cpp "string s; for(char ch = 'a'; ch <= 'z'; ch++) s += ch; P(s)")
