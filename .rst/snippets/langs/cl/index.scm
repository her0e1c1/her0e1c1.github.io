(require 'cl)

(lexical-let ((x 2))
  (setq p (delay (* x 10))))

(force p) ;=> 20
(setq x 50)
(force p) ;=> 20
(setq x 1)
(force p) ;=> 20

,@は連結　括弧を取る

(setq some-list '(2 3))
     => (2 3)
(cons 1 (append some-list '(4) some-list))
     => (1 2 3 4 2 3)
`(1 ,@some-list 4 ,@some-list)
     => (1 2 3 4 2 3)

(setq list '(hack foo bar))
     => (hack foo bar)
(cons 'use
  (cons 'the
    (cons 'words (append (cdr list) '(as elements)))))
     => (use the words foo bar as elements)
`(use the words ,@(cdr list) as elements)
     => (use the words foo bar as elements)

   


(defmacro inc-list (ls)
     (mapcar '1+ ls))

一見すると ::

   (inc-list '(1 2 3))

が動きそうな気もするが, 実際は ::

   (mapcar '1+ ''(1 2 3))

を実行するのでエラーとなる.
``''(1 2 3)``というシンボルを代入しているのであってリストではない.
