(load-from-current-dirctory "include-perl.scm")

(p "reverse関数に文字列として評価させたいのでscalar必要")

(run "perl -E 'say scalar reverse shift' hoge")
