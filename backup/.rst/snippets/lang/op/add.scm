(c "unsigned char s=200, t=200; p(\"%d\", (unsigned char) (s + t) / 2);"
   :warn "``(i + j) / 2`` becomes overflow. use ``i + (j - i) / 2``")
(c "unsigned char s=200, t=200; p(\"%d\", (unsigned char) s + (t - s) / 2);")
