(load-from-current-dirctory "include.scm")

(p "# (?:...)は、グループをつくるが、キャプチャしない")
(run+ "perl -E '$_=@ARGV[0]; /(a)(?:b)(c)/ and say qq/1 => $1, 2 => $2, 3 => $3/' abc")
