(define DATA1 (generator->list (integers$ 20 -10) 10))

(ps "配列の３つの積の最大値は?")

(math "$max_{i,j,k $in N} a[i] $times a[j] $times a[k]")

(eval-null `(gosh
 #"(print
    (let1 l (pa$ at (sort '~DATA1))
       (max (* (l -1) (l -2) (l -3))
            (* (l 0) (l 1) (l -1)))))"
 :str #t))
