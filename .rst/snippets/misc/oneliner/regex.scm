(load-from-current-dirctory "include.scm")

(run "curl yahoo.co.jp |perl -nlE 's#(?<=href=)([\"''])/aiuie/(?=\1)#${1}{{ ''index'') }}#; say'")
(run "echo abc | perl -nlE 'say if /(\"([\\].|[^\\\"])*\")/'")

(p "Show png or gif img tags. $&はマッチした文字列全体 -O - means stdout instead of a file")
(run "wget www.yahoo.co.jp -O -|perl -nlE 'say $& if /<img.*?(gif|png).*?>/'")

(run "ls| perl -plE \"tr/a-z/A-Z/\"")
(run "ls| s -n '(tr \"a-z\" \"A-Z\")'")

; 'STRING' のようなクオートの文字列を抜き出す
; echo "this is a 'HOGE' hoge 'FOO' " |perl -nlE "while(m/'(.*?)'/g){say $+;}"
; gをつけることで$_の開始位置が巡る

; perl -nE '$b=$_;$a=qq/("(.*?)",[^"]*)/; say join " ", map{$k=qq/$a\{$_}/;$b=~/$k/;$2} qw/1 20/ '

(p "add query string v=1. use look ahead and behind")
(run "echo '.js\"/>' | perl -nlE 's/(?<=\.js)(?=\")/?v=1/ and say'")
(run "echo '.js\"/>' | s -p '(s #/(?<=\.js)(?=\")/ \"?v=1\")'")


(p ".tplのファイルについて、.jsを含む行をファイル名と合わせて表示.
なお、$ARGVでファイル名表示")
; find ./ -name "*.tpl" |xargs perl -nlE 'say "$ARGV $_"if /\.js/'
   
(run "echo 'HOGE HOGE'| perl -0777 -ne 'print qq/$.: doubled $_/ while /\b(\w+)\b\s+\b\1\b/gi'"
     :msg "look for duplicated words")

;; #,と改行がデリミタの場合
;; perl  -ne "chomp; @_=split(',',\$_);print \$_.',' for sort{\$a <=> \$b} @_; print \"\n\" " clq.out

;; #split(a,b)とするべき
;; perl -i -ne "chomp; @_=split(/,/¥$_/);print ¥$_.',' for sort{¥$a <=> ¥$b} @_; print ¥"¥n¥" "
;; #改行の出力は""でくくること
