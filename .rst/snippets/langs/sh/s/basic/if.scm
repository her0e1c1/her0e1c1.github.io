(load-from-current-dirctory "include-sh.scm")

(ps "if")

(run "if true  ; then echo 'true'; else echo 'false'; fi")
(run "if false ; then echo 'true'; else echo 'false'; fi")

(p "Multi liners")
(for-each (^(i j)
         (run #"
if ~|i|; then
    echo 'if';
elif ~|j|; then 
    echo 'elif';
else
    echo 'else';
fi
"))
          '(true false false)
          '(false true false))

(ps "using var")

(run "A=true && if $A ; then echo true; fi")
(run "A=true && $A && echo true")
(run "A=false && if $A ; then echo true; fi")
(run "$A && echo true")

(p "# With test, [ ] or [[ ]] operators,
bash conditions evaluate as true in case of an exit code of 0")

(run "if [ 0 ] ; then echo true; fi")
(run "if [ $(echo 0) ] ; then echo true; fi")
(run "if [ -z \"\" ] ; then echo true; fi")
