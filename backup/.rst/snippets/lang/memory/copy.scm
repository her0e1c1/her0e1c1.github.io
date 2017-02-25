
(p (sphinx-section "memset"))

(c "int a[10][10]; memset(a, 0, sizeof(a)); p(\"%d\", a[0][0]);" :msg "Fill 0")
(c "int a[10][10]; memset(a, -1, sizeof(a)); p(\"%d\", a[0][0]);" :msg "Fill -1")

(pw "Don't work because memset fills numbers but 0 or -1 at each byte")
(c "int a[10][10]; memset(a, 1, sizeof(a)); p(\"%d\", a[0][0]);")
(c "int a[10][10]; memset(a, 10, sizeof(a)); p(\"%d\", a[0][0]);")

(c "int i[1]; memset(i, 1, sizeof(int)); printf(\"%x\", i[0]);"
   :msg "
16進数から2進数への変換は、f => 1111, 0 => 0000, 1 => 0001と考えるので
00000001が4回繰り返しコピーされていることがわかる
")

(c "char p[]=\"abcde\", q[]=\"AAA\"; memcpy(p,q,3+1); p(p);" :msg "You can update each char of the string with an array")
