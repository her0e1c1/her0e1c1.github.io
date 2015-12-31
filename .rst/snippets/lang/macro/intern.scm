(emacs (progn
        (dolist (x (list 'a 'b 'c))
                (set (intern (concat "symbol-" (symbol-name x))) 1))
        (+ symbol-a symbol-b symbol-c))
       :msg "動的にシンボルを生成する")
