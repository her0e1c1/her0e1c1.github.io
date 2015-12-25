
(perl "say split /(\\d+)/, qq/a 1 b 2 c 4/;")
(perl "say split /\\d+/, qq/a 1 b 2 c 4/"
      :msg "マッチした文字列で分割していく(マッチ文字を含まない)")

(py "P(split(r'(\\d+)', 'a 1 b 2 c 4'))"
    :msg "マッチした文字列で分割していく(マッチ文字も含む)")
(py "P(split(r'\\d+', 'a 1 b 2 c 4'))")

(py "P(split(r'(\\d+)', 'pre 1234 post', 1))")

(run "perl -E '@r=\"abcdefghijk\"=~/.{1,4}/g; say join \"-\", @r'")
