
(run "perl -E '$_=shift; m#<a.*?href=([\"''])(.*?)\1.*?>#; $a=$2; substr($_, $-[2], $+[2] - $-[2]) = $a.\"/\"; say' \"<a href='/path/to'>\""
     :msg "$-[]マッチ開始位置かな, $+[]マッチ終了位置. /path/to => /path/to/")


(emacs (string-match "\\w+ \\w+" "test test") (match-beginning 0))
(emacs (string-match "\\w+ \\w+" "test test") (match-end 0))
