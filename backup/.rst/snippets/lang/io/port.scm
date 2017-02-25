
(define symbol-standard-ports '(standard-input-port standard-output-port standard-error-port ))
(define symbol-current-ports '(current-input-port current-output-port current-error-port ))
(define symbol-ports (append symbol-current-ports symbol-standard-ports))

(p "3文字読む")
(run "echo hoge |s '(p (read-char) (read-char) (read-char))'")

(p "2行読む")
(run "ls|s '(p (read-line) (read-line))'")

(p "port名")
(run "s '(port-name (current-input-port))'")

(ps "port type")
(p "file, string, proc")
(run "s '(port-type (current-input-port))'")

(ps "isatty")
(run "s '(sys-isatty (standard-input-port))'")
(p "integer")
(run "s '(sys-isatty 0)'")
(p "use pipe. so this is not a tty")
(run "ls | s '(sys-isatty (standard-input-port))'")
(run "ls | s '(read-line)'")
(run "s '(sys-isatty (standard-output-port))' |cat")

(ptodo "fix.")
;; # pipeを使うとttyでない(keyboardの入力ではない)
(run "s '(sys-isatty (standard-output-port))'")
(run "s '(sys-isatty (standard-error-port))'")
(run "s '(sys-ttyname 1)'")
(run "s '(sys-ttyname 2)'")

(run "s '(standard-input-port)'")
(run "s '(eq? (current-input-port) (standard-input-port))'")
(dolist (p symbol-ports) (s #"s '(port-file-number (~p))'"))

(run "s '(sys-ttyname 0)'")
(run "ls|s '(sys-ttyname 0)'")

(ps "string port")
(run "s '(port-type (open-input-string \"test\"))'")
(run "s '(port-file-number (open-input-string \"test\"))'")

(p "string portは、文字列を蓄積させていくことができる(buffに溜まる感じ)")
(run "s '(begin (define a (open-output-string)) (format a \"test\") (format a \"HOGE\") (get-output-string a))'")

(run "echo HOGE | s '(port-for-each print read-char)'")
(p "逆順")
(run "echo HOGE | s \"(port-fold cons '() read-char)\"")

;; ;; 標準出力を文字列に
(gosh (call-with-output-string  (^o (write "HOGE" o) (write "FOO" o))))

(ps "call-with-*-file")
(gosh (call-with-output-file "t" (^o (write "this is a test" o))))
(gosh (call-with-input-file "t" port->string))
(gosh (call-with-input-file "t" port->string-list))
(gosh (call-with-input-file "t" (^i (p (read-char i) (read-char i)))))
(dolist (line (call-with-input-file "t" port->string-list)) (p line))

(ps "with-*-file")
(p "you don't take a port object as argument but change a current port instead")
(gosh (with-output-to-file "t" (^() (p "this is a test (with-output-to-file)"))))
(gosh (with-input-from-file "t" (^() (port-for-each p read-line))))

(ps "process")
(gosh (process-output->string "ls"))
; (gosh (process-output->string cmd :error (current-error-port)))
(gosh (sys-system "ls"))

(ps "flush")
(gosh (write "hoge" (current-output-port)) (/ 1 0))
(gosh (write "hoge" (current-output-port)) (flush) (/ 1 0))

; finalize
(remove-file "t")
