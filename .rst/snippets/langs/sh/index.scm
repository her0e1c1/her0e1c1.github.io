(load-from-current-dirctory "include-sh.scm")

(ps "STDOUT")
(run "echo 'This text is not shown' > /dev/null")
(run "echo 'This text is not shown' 1>&2 /dev/null")
(run "echo hoge|rev")

(ps "Compare")
(p "-eq, -gt, are operators for number. NOT STRING!")
(pw "[ and ] need spaces around each of them")
(run "[ 1 -eq 1 ] && echo 'true'")
(run "[ 2 -gt 1 ] && echo 'true'")
(run "[ 2 -ge 2 ] && echo 'true'")
(run "[ 1 -lt 2 ] && echo 'true'")
(run "[ 2 -le 2 ] && echo 'true'")
(run "[ 'hoge' -eq 'hoge' ] && echo 'true'")

(pw "Not == operator")
(run "[ 'str' = 'str' ]     && echo 'true'")
(run "[ 'str' != 'string' ] && echo 'true'")
(run "[ 1 = 1 ]     && echo 'true'")
(p "Not quoted string")
(run "[ hoge = hoge ]     && echo 'true'")

;; ### String
;; # Execute string
;; eval "ls $HOME"

;; # let
;; a=1
;; let a=a+1

(ps "set!")
(p "${NAME:=VAL} if variable is undefined, then set a value.")
(run ": ${NULL:='NULL'} && echo $NULL")

(p "${NAME:-VAL} if variable is undefined, then evaluate a value but not set it.")
(run "echo ${NULL:-'NULL'}")
(run ": ${NULL:-'NULL'}; echo $NULL")
(run "NULL='HOGE' && echo ${NULL:-'NULL'}")

(p "${NAME:=VAL} if variable is defined, then evaluate a value but not set it.")
(run "echo ${NULL:+'NULL AGAIN'}")


(ps "colon")
(p "colon(:) is similar to pass in Python")
(run "if true; then :; fi")

(ps "passArgsWithStdin")
(run "echo 'echo $1, $2'| sh /dev/stdin 100 1")
(p "better")
(run "echo 'echo $1, $2'| sh -s - 100 1")

(ps "function")
(p "declare minimum")
(run "f(){}")
(pw ";がないとエラー")
(run "f(){ echo 1 }; f")
(run "f(){ echo 1;}; f")

;; # {の後にspace必要。
(pw "need a space after {")
(run "f(){echo 1;} ;f")
(run "f(){ echo 1;};f")

(ps "string")
(run "cat <<EOS
This is a long string with new lines.
EOS")
(p "assign a var")
(run "VAR=$(cat <<EOS
This is a long string with new lines.
EOS
)
echo $VAR
")
(pw "変数を使いたい場合、変数展開されないようにする")
(run "VAR=1 && cat <<EOS
\\$VAR=$VAR
EOS")

(run "if true  ; then echo 'true'; else echo 'false'; fi")
(run "if false ; then echo 'true'; else echo 'false'; fi")
;; # How do I examine a variable in the best way?
;; A=true
;; if $A ; then echo "true!!"; fi
;; $A && echo 'true!!'

;; B=false
;; if $B ; then echo "true!!"; fi  # false
;; $B && echo 'true!!'  # false

;; # With test, [ ] or [[ ]] operators, bash conditions evaluate as true in case of an exit code of 0
;; if [ 0 ] ; then echo not null ; fi
;; if [ $(echo 0) ] ; then echo not null ; fi
;; if [ -z "" ] ; then echo null ; fi

(run "case 'apple' in a*) echo 'starts with a';; esac")
(run "case 'apple' in a*) echo 'starts with a';; esac")
(p "? is any one char")
(run "case 'Xapple' in ?a*) echo 'starts with a';; esac")
(run "case '' in '') echo 'empty string';; esac")
(run "case 'banana' in apple|banana) echo 'I want banana';; esac")

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

;; f(){
;;     # 等しいに文字列の=を使わない!
;;      [ $# -eq 1 ] && echo one
;;      [ $# -eq 2 ] && echo two
;;    }
;; f 1
;; f 1 2
