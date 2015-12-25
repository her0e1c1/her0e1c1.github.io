(defun format-sample()
  "you can use format below
   %s, string
   %d, 10
   %o, 8
   %x, 16
   %c, char(0-255)"
  (format "There are %s %s." 2 "samples")
  (format "%x" 10)  ; a
  (format "%c" ?a)  ; a
  (format "%c" 97)  ; a
  )


(format "%s, %s" "hello" "world")

(s-format "$0, $1" 'elt '("hello" "world"))

(s-format "${name}" 'aget '(("name" . "test")))
(s-format "$0 $1" 'elt '("name" "test"))


(setq h1 (ht-create))
(ht-set! h1 "n" "test")
(s-format "${n}" 'gethash h1)