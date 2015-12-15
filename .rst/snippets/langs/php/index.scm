
(define (run cmd)
  (let* ((cmd+ #"php -r '~cmd'")
         (ret (oneliner-run cmd+)))
    (p (sphinx-block #"$ ~cmd+\n~ret" :code-block "sh"))))
   
(run "if (1) {echo \"true\";}")
(run "$dict = array(5 => 1, 12 => 2); echo \"$dict[5]\";")
(run "$arr = array(10, 20, 30, 40, 50); echo \"$arr[0]\";")
(run "class A {public $v = 'val';} $a=new A(); echo \"$a->v\";")
