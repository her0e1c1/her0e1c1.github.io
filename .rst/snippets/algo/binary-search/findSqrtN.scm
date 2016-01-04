
(ps "Compute the square root")
(math "n $in N s.t. $max_{x} f(x) = x^2 - n $le 0")
(p "f(x) <= 0の場合に、+ 2^xを大きい方から累積する。単調増加関数である必要あり ")

(gosh "
(let* ((n 15241578750190521)
       (f (^x (- (* x x) n)))
       (g (^(a acc)
            (let1 x (+ a acc) (if (<= (f x) 0) x acc)))))
  (print (fold g 0 (map (pa$ expt 2) (reverse (iota 63))))))
" :str #t)

(gosh "
(print
 (let* ((n 15241578750190521)
        (f (^x (- (* x x) n))))
   (let loop ((low 0) (high (expt 2 63)))
     (if (> low high)
         -1
         (let* ((x (div (+ low high) 2))
                (fx (f x)))
           (cond ((= fx 0) x)
                 ((< fx 0) (loop (+ x 1) high))
                 (else (loop low (- x 1)))))))))
" :str #t)
