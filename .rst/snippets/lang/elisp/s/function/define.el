;tag: funcall
; elispは、変数名と関数名の名前空間が別々

(defun double (x) (* x 2))

; almost same above
(setf (symbol-function 'double)
      #'(lambda (x) (* x 2)))


;;; 外部から参照されないローカル関数
(labels ((fact (n)
               (if (= n 1) n
                 (* n (fact (- n 1))))))
  (fact 5))  ; 120