
(zsh "echo /bin(/)")
(zsh "echo /bin/sh(/)" :warn "error")
(zsh "echo /bin/sh(N/)" :msg "ignore an error. return empty string")

(zsh "echo ~/.emacs.d(N/)" :warn "not following a symbol link so empty string")
(zsh "echo ~/.emacs.d(N-/)" :msg "this is recommended")

(perl "$_=\"/home\"; say if -d")
(gosh (file-is-directory? "/home"))
(emacs (f-dir? "/home"))
(c "struct stat sb; p(\"%d\",stat(\"/home\", &sb) == 0 && S_ISDIR(sb.st_mode));")

(run "ce 'p(\"%s => \", argv[1]); struct stat sb; p(\"%d\", stat(argv[1], &sb) == 0 && S_ISDIR(sb.st_mode));' `perl -e 'print \"a/../\" x 205'`"
     :warn "PATH_MAX(=1024)を超えるとstatは失敗する
 mkdir a  # 事前にaディレクトリを作成\"a/../\"は5文字なので205回繰り返すと1024は超える")
