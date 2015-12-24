
(ps "false")

(run "perl -E 'say $a || \"\" || 0'")
(node "undefined || null || \"\" || 0 || false")

(c "if(!0)p(\"false\");")
(c "if(!NULL)p(\"false\");")
(c "char *s=\"\"; if(!*s)p(\"false\");")
(c "if(\"\")p(\"true\");")
