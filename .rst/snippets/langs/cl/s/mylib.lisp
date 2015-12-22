;; mylib.lisp

(provide 'mylib)

(defpackage mylib
  ;(:use common-lisp)
  (:export hello)  ; 省略出来ません。
  )

(in-package mylib)

(defvar hello "Hello, My Library!")