(load-from-current-dirctory "include.scm")

(ps "double")

;; 10^19 < 2^64 < 10^20
;; 10^18 < 2^63 < 10^19

;; 10^6 < 2^23 < 10^7
;; float = sign(1bit), exponent(8bit), fraction(23bit)

;; 10^15 < 2^52 < 10^16
;; double = sign(1bit), exponent(11bit), fraction(52bit)

;; 10^9 < 2^32 < 10^10  (= 10M)
;; 10^9 < 2^31 < 10^10

(run "p(\"%f\", (double)(1 << 30));")
(run "p(\"%lf\", (double)(1UL << 52));")
(run "p(\"%lf\", (double)(1UL << 63));")
(run "p(\"%f\", (double)(1 << 50));")
(run "p(\"%lf\", (double)(1 << 50));")
(run "p(\"%lf\", (long)(1 << 40));")
(run "p(\"%lf\", (double)(1 << 50));")
(p "not 0.1 but 0.125?")
(run "p(\"%lf\", (double)((1UL << 49) + 0.1));")
(pw "warn")
(run "p(\"%lf\", (double)(1UL << 64));")
