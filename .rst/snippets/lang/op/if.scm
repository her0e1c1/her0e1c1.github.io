
(node "true && \"ok\" || \"no\"")
(run "perl -E 'say 1 ? \"ok\" : \"no\"'")
(php "if (1) {echo \"true\";}")

(emacs (if t 1 2))
(emacs (if nil 1 2))

(sh "if true  ; then echo 'true'; else echo 'false'; fi")
(sh "if false ; then echo 'true'; else echo 'false'; fi")

(p "Multi liners")
(for-each (^(i j)
         (sh #"
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

(sh "A=true && if $A ; then echo true; fi")
(sh "A=true && $A && echo true")
(sh "A=false && if $A ; then echo true; fi")
(sh "$A && echo true")

(p "# With test, [ ] or [[ ]] operators,
bash conditions evaluate as true in case of an exit code of 0")

(sh "if [ 0 ] ; then echo true; fi")
(sh "if [ $(echo 0) ] ; then echo true; fi")
(sh "if [ -z \"\" ] ; then echo true; fi")


(ps "tech")

(p "dictによる分岐")

(py #!Q
x = 'bar'
print({
    'foo': 'x is foo',
    'bar': 'x is bar',
    'baz': 'x is baz',
}.get(x, 'x is unknown'))
Q :str #t)

(p "三項演算子のネストによる分岐")
(py #!Q
x = 'baz'
print(
    'x is foo' if x == 'foo' else
    'x is bar' if x == 'bar' else
    'x is baz' if x == 'baz' else
    'x is unknown'
)
Q :str #t)
