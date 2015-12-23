
(p "when you want to execute other commands, then use system")

(ps "exec")

(p "execute shell command. you need -i option")
(run "perl -e 'system qq#sh -ic \"ll /lib/libc.so.*\"#'")

(p "System and go last")
(run "perl -E 'system \"echo TEST\" ;say \"print\"'")

(p "コマンドを実行し、失敗した場合にのみ制御が戻る")
(run "perl -E 'exec \"echo 1\" ;say \"NOT PRINTED\"'")

(p "when you want to execute other commands, then use system")
(run "perl -E 'say `echo TEST`'")

(run "perl -e 'system \"echo 1\" for 1..3'")


(run "echo `echo TEST`")
(run "echo $(echo TEST)")

(p "You can nest commands if using $()")

(run "echo $(echo $(echo 1) 2) 3")

(ghc "System.Cmd.system $ \"echo \" ++ unwords [[x, '.'] ++ y | x <-['a'..'c'], y <- [\"csv\", \"txt\"]]")
