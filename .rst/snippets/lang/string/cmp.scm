
(cpp "P(\"aaa\" < \"bbb\")")
(cpp "P(\"aaa\" <= \"aaa\")")
(cpp "P(\"aaa\" < \"aab\")")
(cpp "P(\"aaa\" < \"a\")"
     :warn "長さが異なる場合は、なぜか短い方が大きいと判断される???")

(ps "strcmp")
(c "if(strcmp(\"abc\", \"abc\") == 0) p(\"true\");")
(c "p(\"%d\", strcmp(\"a\", \"z\"));")
(c "p(\"%d\", strcmp(\"z\", \"a\"));")
