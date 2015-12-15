(load-from-current-dirctory "include.scm")

(p (sphinx-section "memset"))

(p "Fill 0")
(run "int a[10][10]; memset(a, 0, sizeof(a)); p(\"%d\", a[0][0]);")

(p "Fill -1")
(run "int a[10][10]; memset(a, -1, sizeof(a)); p(\"%d\", a[0][0]);")

(p "Don't work because memset fills numbers but 0 or -1 at each byte")
(run "int a[10][10]; memset(a, 1, sizeof(a)); p(\"%d\", a[0][0]);")
(run "int a[10][10]; memset(a, 10, sizeof(a)); p(\"%d\", a[0][0]);")

;; # 16進数から2進数への変換は、f => 1111, 0 => 0000, 1 => 0001と考えるので
;; # 00000001が4回繰り返しコピーされていることがわかる
 (run "int i[1]; memset(i, 1, sizeof(int)); printf(\"%x\", i[0]);")
