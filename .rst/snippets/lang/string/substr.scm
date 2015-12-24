
(run "perl -E 'say substr + (join \"\", a..f), 1, -1'")

(cpp "string s = \"test\"; string t(s,1,2); P(t)")
(cpp "string s = \"test\"; string t(s.begin()+1, s.begin()+2); P(t)")

(cpp "string s=\"abcdefghi\"; P(s.substr(0, 5));")
(cpp "string s=\"abcdefghi\"; P(s.substr(5, 10));")

(pw "開始位置が範囲外の場合は例外を出します。")
(cpp "string s=\"abcdefghi\"; P(s.substr(10, 5));")
(cpp "string s=\"abcdefghi\"; P(s.substr(10, 1000));")


(gosh (substring "abc" 0 1))
(gosh (substring "" 0 1))
