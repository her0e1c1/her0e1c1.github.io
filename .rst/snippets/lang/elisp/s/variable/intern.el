;tag: macro
; 動的にシンボルを生成する
; これにより、関数や変数を動的に生成できる => macro

(dolist (x (list 'a 'b 'c))
  (set (intern (concat "symbol-" (symbol-name x))) 1))

(+ symbol-a symbol-b symbol-c)