(load-from-current-dirctory "include-sh.scm")

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
