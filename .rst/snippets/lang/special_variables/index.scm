
(p "$\"")
(p "This is a \"@array\" delimiter")
(run "perl -E '$\" = \" - \"; @a=1..5; say \"@a\"'")

(run "echo $HISTSIZE")
(run "echo $PWD")
(run "echo $HOME")
(run "echo $OLDPATH")
(run "echo $SECONDS")

(p "getCurrentPID")
(run "echo $$")

(zsh "echo $(echo ~)(:a)" :msg "/home/USER")
(zsh "echo $(echo ~/.emacs.d)(:A)" :msg "expand symbol link")
