(define DATA1 (generator->list (integers$ 20 -10) 10))

(ps "配列の３つの積の最大値は?")
(math "$max_{i,j,k $in N} a[i] $times a[j] $times a[k]")
(eval-null `(gosh
 #"(print
    (let1 l (pa$ at (sort '~DATA1))
       (max (* (l -1) (l -2) (l -3))
            (* (l 0) (l 1) (l -1)))))"
 :str #t))

(ps "特定の区間にある整数")
(math "$# ${i| A $leqq i $leqq B $}")
(gosh (let1 f (^(A B) (if (>= A B) 0 (+ (- B A) 1))) (f 3 9)))
(math "$# ${i| A < i < B $}")
(gosh (let1 f (^(A B) (if (>= A B) 0 (+ (- B A) -1))) (f 3 9)))
(math "$# ${i| A < i $leqq B $}")
(math "$# ${i| A $leqq i < B $}")
(gosh (let1 f (^(A B) (if (>= A B) 0 (- B A))) (f 3 9)))


(ps "特定の区間にあるKの倍数の数")
(math "$# ${i| A $leqq i $leqq B, i $bmod K = 0 $}")
(math "
A = Km + n $leqq & i = K*j & $leqq B = Km' + n' & <=>
m + n/K    $leqq & j   & $leqq m' + n'/K

以下を考慮
0 $leqq & n/K, n'/K & < 1

Kの倍数から整数に帰着
m $leqq & j & $leqq m' & (n/K = 0)
m <     & j & $leqq m' & (else)
")
(gosh (let1 f (^[A B K] (+ (- (div B K) (div A K))
                           (if (= (mod A K) 0) 1 0)))
            (f 3 10 3)))
