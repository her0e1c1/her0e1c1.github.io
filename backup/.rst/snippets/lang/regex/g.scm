


(ps "g")
(p"gは、全てマッチ
With g option it match more than once")

(p"マッチ位置はマッチするごとに動くので、loopできる
*は0文字とマッチするので空文字が含まれる")

(ps "for")
(run "perl -E '$_=\"abc\"; print \"$_,\" for (/.*?/g)'")
(run "perl -E '$_=\"abc\"; print \"$_,\" for /.+?/g'")

(ps "while")
(p "With s option . matches also \n character")
(run "perl -E '$_=\"abc\"; while(/.(?=(.*))/g){print $&.$1.\",\"}'")
(run "perl -E 'say \"\n\" =~ /./s'")
