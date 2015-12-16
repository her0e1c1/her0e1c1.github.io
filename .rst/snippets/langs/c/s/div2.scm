(load-from-current-dirctory "include.scm")

(p (sphinx-section "over flow about div 2"))
(p (sphinx-warn "(i + j) / 2はオーバーフローするので、 i + (j - i) / 2 とすること"))

(ce "unsigned char s=200, t=200; p(\"%d\", (unsigned char) (s + t) / 2);")
(ce "unsigned char s=200, t=200; p(\"%d\", (unsigned char) s + (t - s) / 2);")
