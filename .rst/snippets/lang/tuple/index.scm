(p "multiple values")

(cpp "pair<int, string> pis(10,\"str\"); cout << pis.first << \" \" << pis.second << endl;")

(gosh (receive (a b) (values 1 2) (+ a b)))
(gosh (define-values (a b . c) (values 1 2 3 4)))

(emacs (destructuring-bind (x y z) '(1 2 3) (+ x y z)))
(emacs (destructuring-bind ((x) y z) '(1 2 3) (+ x y z)))
(emacs (destructuring-bind ((x) y z . w) '((1) 2 3 . 4) (+ x y z w)))
