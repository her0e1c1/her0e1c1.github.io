(load-from-current-dirctory "include.scm")

(p (sphinx-section "statfs"))
;; mount info
(run "struct statfs s; statfs(\"/home\", &s); p(\"%s\", s.f_mntonname);")

;; # 指定したパスがディレクトリか判定
;; ce 'struct stat sb; printf("%s", stat(argv[1], &sb) == 0 && S_ISDIR(sb.st_mode) ? "DIR" : "NOT DIR");' ~/.emacs.d

;; # PATH_MAX(=1024)を超えるとstatは失敗する
;; # mkdir a  # 事前にaディレクトリを作成"a/../"は5文字なので205回繰り返すと1024は超える
;; ce 'struct stat sb; printf("%s", stat(argv[1], &sb) == 0 && S_ISDIR(sb.st_mode) ? "DIR" : "NOT DIR");' `perl -e 'print "a/../" x 205'`
