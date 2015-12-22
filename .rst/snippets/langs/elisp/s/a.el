
; Save current buffer, current point
(save-excursion
  ; save current narrowing
  (save-restriction
    (widen)
    ; code
    ))

(define-error 'parent-error "Parent Error")
(define-error 'child-error "Child Error" 'parent-error)

(cl-defstruct person name age)
(setq p1 (make-person :name "Bob" :age 20))
(person-p p1)  ; t
(person-age p1)  ; 20
(setf (person-age p1) 10)
(person-age p1)  ; 10

(deftype color()
  '(member red bule green))
(typep 'red 'color)  ; t
(typep 'apple 'color)  ; nil