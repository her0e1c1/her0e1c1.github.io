;;; advice
;;; ad-do-it for around

(defconst a 1)
;(setq a 19)

(defun add3_() 1)
(defadvice add3_ (before befor-add3 activate)
  (setq ad-return-value (+ ad-return-value 3)))
(add3_)
;; (ad-enable-advice 'sample 'around 'echo)
;; (ad-activate 'sample)


;; (setq ol (make-overlay 1 10))
;; (overlay-put ol 'face 'stripes-face)