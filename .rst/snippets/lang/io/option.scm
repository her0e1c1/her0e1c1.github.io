(ps "options")

(p "With -0 option delimiter is NULL")
; (run "perl -p0 ''")

(p "With -0777 you can't use any option delimiter.")
(run "echo \"a\na\na\"|perl -p0777E 's/a/b/'")

(ps "Display warning") 
(run "perl -we 'print @a'")


(ps "F option")

(run "echo \"123456\tb\nc\td\" | perl -aF'\t' -nlE 'say join(\", \", map(sprintf(\"%5s\", substr($_, 0, 5)), @F))'")

(run "ps aux | perl -anle 'print $F[1]' | head -n2")

(p "print 0 ~ 4 columns in the argument file")
; (run "perl -F: -lane  'print \"@F[0..4]\n\"' /etc/passwd")


(run "echo \"a,b\nc,d\" |perl -F'/,\s*/' -alnE 'say join \"/\", @F'")

(ps "-00")

(run "echo \"a\nb\n\nc\nd\"|perl -00 -pE 'say \"-\" x 20'")
