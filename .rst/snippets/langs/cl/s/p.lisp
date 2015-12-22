(defpackage :my
  (:use :cl)
  (:export 
   #:append
   #:last-append
   ))

(in-package my)

;;; append
(defun my-last-append(l1 l2)
  `(,@l1 ,@l2))

;;; all
(defun my-all(&rest rest)
  (cond ((null rest) nil)
        ((car rest) (apply 'my-all (cdr rest)))))
(defun my-all2(ls)
  (if (null ls) t
    (if (car ls) (all1 (cdr ls)))))

;; &restの場合はマクロの方が記述が楽
;; &rest => applyは定式とすべし
(defmacro my-all1(&rest rest)
  `(and ,@rest))

;;; when
(defmacro my-when(pred &rest body)
  `(if ,pred (progn ,@body)))