(load-from-current-dirctory "include-perl.scm")

(ps "string")

(run "perl -E 'say \"abc\".\"efg\"'")
(run "perl -E 'say 1 if \"a\" eq \"a\"'")
(run "perl -E 'say sprintf(\"%s, %s\", \"hello\", \"world\")'")
(run "perl -E 'say join \" \", 1..10'")
(run "perl -E 'say split /\s/, \"a b c\"'")
(run "perl -e 'print qq/hello world/'")
(run "perl -E 'say ord(\"a\")'")
(run "perl -E 'say substr + (join \"\", a..f), 1, -1'")

(p "perlの場合文字列を+で評価すると型を数値とする
なお、文字列の結合は.を使うので注意
また、数値でないものは0として扱われる")
(run "perl -E 'say \"1\" + \"2\"'")
(run "perl -E 'say \"a1a\" + \"2\"'")


(run "perl -E 'say \"abc\" x 3'")

(ps "length")
(run "perl -E 'say length shift' 1234567890")
