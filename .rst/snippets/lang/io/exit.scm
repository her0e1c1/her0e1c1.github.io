(ruby "exit")
(ruby "exit!")
(ruby "exec 'echo 1'; p \"NOT PRINTED\"")

(c "p(\"%d\", EXIT_SUCCESS);")
(c "p(\"%d\", EXIT_FAILURE);")
(c "exit(EXIT_SUCCESS); p(\"NOT REACHED\");")
