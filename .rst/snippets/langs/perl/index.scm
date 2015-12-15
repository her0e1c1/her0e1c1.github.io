(define (run cmd)
  (let1 ret (oneliner-run cmd)
        (p (sphinx-block #"~cmd\n~ret" :block #t))))

(p (sphinx-warn "Don't use double quote which extend $ in sh or escape it"))
(run "perl -e \"$a=1; print $a\"")
(run "perl -e \"\\$a=1; print \\$a\"")

(p (sphinx-section "options"))

(p "With -0 option delimiter is NULL")
; (run "perl -p0 ''")

(p "With -0777 you can't use any option delimiter.")
(run "echo \"a\na\na\"|perl -p0777E 's/a/b/'")

(p "Display warning") 
(run "perl -we 'print @a'")

(p (sphinx-section "special characters"))

(p "$\"")
(p "This is a \"@array\" delimiter")
(run "perl -E '$\" = \" - \"; @a=1..5; say \"@a\"'")
