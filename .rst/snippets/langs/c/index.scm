(load-from-current-dirctory "include.scm")
(for-each (lambda (x) (load x)) (glob "./s/*.scm"))
