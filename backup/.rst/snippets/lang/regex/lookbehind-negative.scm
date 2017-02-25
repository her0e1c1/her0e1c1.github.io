
(run "perl -E '$_=q/There is a man/; say if /(?<!wo)man/'")
(run "perl -E '$_=q/There is a woman/; say if /(?<!wo)man/'")
(run "perl -E '$_=q/There is a woman/; say if /man/'"
     :warn "後読み否定しないと、手前のwoがあってもマッチしてしまう")

(py "P(search(r\"(?<!wo)man\", \"There is a man\"))")
(py "P(search(r\"(?<!wo)man\", \"There is a woman\"))")
