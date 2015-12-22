
 (defmacro test (name)
  `(defun ,(intern (concat "test-" name "-p") )
          ()))


; 以下のように展開されてほしいmacro
; (my-inc a t) => (1+ a)
; (my-inc a nil) => (1- a)
(defmacro my-inc(x test)
  `(if ,test (1+ ,x) (1- ,x)))