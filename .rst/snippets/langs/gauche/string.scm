
(path-extension "/foo/bar.c.a") ; a


s '#"~(+ 1 2 3)"'
; |NAME|とすることで、文字をすぐ後ろへつなげる
(let ((name 123)) #"a test ~|name|.")

; reader macroの確認
(let ((name 123)) '#"a test ~|name|.")


s '(string-every #\space "   ")'
s '(string-null? "")'
s '(sys-system "ls")'


(sys-mkdir "test" 777)  ; dir作成
(sys-basename "foo/bar/bar.z")  ; "bar.z"
(sys-sleep 1)
(sys-select #f #f #f '(1 5))



#b1111
#o777
#xffff
#e1e3  ; 10 ^ 3  ; (expt 10 3)
; (format #f "~b" #b1101001)  ; 2進数
(format #f "~b ~b" #b1101001 #b1)
; (< 1 2 3) ; 1 < 2 < 3

; ~%改行
(format #t "~D ~B ~O ~X~%" 256 256 256 256)
; 256 100000000 400 100


; \U12345678
#\U1234  ; ሴ
(make-string 5 #\ふ)  ; ふふふふふ
(substring "abc" 0 1) ; a
; (substring "" 0 1) ; error

(~ "abc" 0)  ; #\a



(string-length "あいうえお")  ; 5
(string-length "test")

; #\一文字 はchar
; #\x数字 は、１６進数
(char=? #\x #\a)

(string-trim-both " abc ")  ; "abc"

(regexp-replace     #/(.)bc/ "abcAbc" "\\1-\\0")  ; "a-abcAbc"
(regexp-replace-all #/(.)bc/ "abcAbc" "\\1-\\0")  ; "a-abcA-Abc"

; (string-join '("a" "b" "c") "-") "a-b-c"



; マッチした文字列をバインド
(rxmatch-let (rxmatch #/(\d+):(\d+):(\d+)/
                      "Jan  1 23:59:58, 2001")
             (time hh mm ss)
             (list time hh mm ss))
; ("23:59:58" "23" "59" "58")

; マッチしなかったら場合の初期値指定
(rxmatch-if (rxmatch #/(\d+:\d+)/ "Jan 1 11:22:33")
            (time)
            (format #f #"time is ~time")
            "unknown time")
; "time is 11:22"


; (file-is-directory? ".")  ; #t


; stdinにしか使えない?
; ls | s '((tr "a-z" "A-Z"))'
; string使う
;(string-tr "ABC" "AB" "00")
; ls | s '(read-line)'

(eqt "abcdef" (string-append "abc" "def"))
