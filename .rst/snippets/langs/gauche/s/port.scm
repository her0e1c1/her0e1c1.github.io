(load-from-current-dirctory "include-gauche.scm")

(define symbol-standard-ports '(standard-input-port standard-output-port standard-error-port ))
(define symbol-current-ports '(current-input-port current-output-port current-error-port ))
(define symbol-ports (append symbol-current-ports symbol-standard-ports))

(p "3文字読む")
(s "echo hoge |s '(p (read-char) (read-char) (read-char))'")

(p "2行読む")
(s "ls|s '(p (read-line) (read-line))'")

(p "port名")
(s "s '(port-name (current-input-port))'")

(ps "port type")
(p "file, string, proc")
(s "s '(port-type (current-input-port))'")

(ps "isatty")
(s "s '(sys-isatty (standard-input-port))'")
(p "integer")
(s "s '(sys-isatty 0)'")
(p "use pipe. so this is not a tty")
(s "ls | s '(sys-isatty (standard-input-port))'")
(s "ls | s '(read-line)'")
(s "s '(sys-isatty (standard-output-port))' |cat")

(ptodo "fix.")
;; # pipeを使うとttyでない(keyboardの入力ではない)
(s "s '(sys-isatty (standard-output-port))'")
(s "s '(sys-isatty (standard-error-port))'")
(s "s '(sys-ttyname 1)'")
(s "s '(sys-ttyname 2)'")

(s "s '(standard-input-port)'")
(s "s '(eq? (current-input-port) (standard-input-port))'")
(dolist (p symbol-ports) (s #"s '(port-file-number (~p))'"))

(s "s '(sys-ttyname 0)'")
(s "ls|s '(sys-ttyname 0)'")

(ps "string port")
(s "s '(port-type (open-input-string \"test\"))'")
(s "s '(port-file-number (open-input-string \"test\"))'")

(p "string portは、文字列を蓄積させていくことができる(buffに溜まる感じ)")
(s "s '(begin (define a (open-output-string)) (format a \"test\") (format a \"HOGE\") (get-output-string a))'")

(s "echo HOGE | s '(port-for-each print read-char)'")
(p "逆順")
(s "echo HOGE | s \"(port-fold cons '() read-char)\"")

;; ;; 標準出力を文字列に
(runs (call-with-output-string  (^o (write "HOGE" o) (write "FOO" o))))

(ps "call-with-*-file")
(runs (call-with-output-file "t" (^o (write "this is a test" o))))
(runs (call-with-input-file "t" port->string))
(runs (call-with-input-file "t" port->string-list))
(runs (call-with-input-file "t" (^i (p (read-char i) (read-char i)))))
(dolist (line (call-with-input-file "t" port->string-list)) (p line))

(ps "with-*-file")
(p "you don't take a port object as argument but change a current port instead")
(runs (with-output-to-file "t" (^() (p "this is a test (with-output-to-file)"))))
(runs (with-input-from-file "t" (^() (port-for-each p read-line))))

(ps "process")
(runs (process-output->string "ls"))
; (runs (process-output->string cmd :error (current-error-port)))
(runs (sys-system "ls"))

(ps "flush")
(runs (write "hoge" (current-output-port)) (/ 1 0))
(runs (write "hoge" (current-output-port)) (flush) (/ 1 0))

; finalize
(remove-file "t")

; (let loop (ch (read-char))) BODY)
