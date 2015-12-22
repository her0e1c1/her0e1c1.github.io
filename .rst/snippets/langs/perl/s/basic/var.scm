(load-from-current-dirctory "include-perl.scm")

(ps "special characters")

(p "$\"")
(p "This is a \"@array\" delimiter")
(run "perl -E '$\" = \" - \"; @a=1..5; say \"@a\"'")


(p "変数が未定義であることを確認")
(run "perl -E 'say \"undefined\" if !defined($a)'")
(p "未定義の場合に代入")
(run "perl -E '$a//=1; say $a'")
