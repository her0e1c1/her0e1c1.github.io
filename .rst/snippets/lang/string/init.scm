
;# 基本的に文字列の宣言は""で括る
(run "ruby -e '%q(hello wolrd).display'")
;# 括るのは() !! {} [] ##
(run "ruby -e '%Q#hello world#.display'")


(run "perl -e 'print \"hello world\"'")
(run "perl -e 'print qq/hello world/'")
(run "perl -E 'say \"hello world\"'")

; typedef basic_string<char> string
(cpp "string s = \"test\"; P(s)")
(cpp "string s(\"test\"); P(s)")
(cpp "char s[] = \"test\"; string t(s); P(t)")
(cpp "string s(5, '0'); P(s)"
     :msg "指定した文字で初期化します。")
(cpp "string s=\"hoge\"; P((s[0]-'0')+(s[1]-'0') == (s[0]+s[1]-2*'0'))")


(sh "cat <<EOS
This is a long string with new lines.
EOS")

(p "assign a var")
(sh "VAR=$(cat <<EOS
This is a long string with new lines.
EOS
)
echo $VAR
")

(sh "VAR=1 && cat <<EOS
\\$VAR=$VAR
EOS" :warn "変数を使いたい場合、変数展開されないようにする")
(sh "VAR=1 && cat <<'EOS'
$VAR=$VAR
EOS" :msg "Don't expand variables with quotes")
