(load-from-current-dirctory "include.scm")


(run "curl yahoo.co.jp |perl -nlE 's#(?<=href=)([\"''])/aiuie/(?=\1)#${1}{{ ''index'') }}#; say'")
(run "echo abc | perl -nlE 'say if /(\"([\\].|[^\\\"])*\")/'")

(p "Show png or gif img tags. $&はマッチした文字列全体 -O - means stdout instead of a file")
(run "wget www.yahoo.co.jp -O -|perl -nlE 'say $& if /<img.*?(gif|png).*?>/'")

; ls| perl -plE "tr/a-z/A-Z/"
; ls| s -n '(tr "a-z" "A-Z")'

; 'STRING' のようなクオートの文字列を抜き出す
; echo "this is a 'HOGE' hoge 'FOO' " |perl -nlE "while(m/'(.*?)'/g){say $+;}"
; gをつけることで$_の開始位置が巡る

(p "add query string v=1. use look ahead and behind")
(run "echo '.js\"/>' | perl -nlE 's/(?<=\.js)(?=\")/?v=1/ and say'")
(run "echo '.js\"/>' | s -p '(s #/(?<=\.js)(?=\")/ \"?v=1\")'")
