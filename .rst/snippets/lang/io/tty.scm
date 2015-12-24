
(p "stdin 0, stdout 1, stderr 2")
(p "in this case, because I run this command as subprocess, these results are NULL.")
(c "ps(ttyname(0));")
(c "ps(ttyname(1));")
(c "ps(ttyname(2));")
