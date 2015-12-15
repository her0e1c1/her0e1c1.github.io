(load-from-current-dirctory "include.scm")

;; // 'printf("%lud",ULONG_MAX);'
;; ce 'printf("%d",ULONG_MAX == (0UL - 1));'

;; // 8byte == 64bit(111..1) 2^63 + 2^62 + ... + 2^0 == 2^64 - 1
;; ce 'printf("%lu",sizeof(ULONG_MAX));'
;; //-2 ^ 15 + 1
;; ce 'printf("%d",SHRT_MIN);'
