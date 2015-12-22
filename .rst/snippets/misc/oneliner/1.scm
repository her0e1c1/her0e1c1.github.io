; I pick up especially convenient scripts.
(define (run cmd :key (sh 'sh) (dummy #f))
  (let1 ret (if dummy "(dummy)" (oneliner-run cmd :sh sh))
        (p (sphinx-block #"~cmd\n~ret" :code-block "sh"))))
(define ps ($ print $ sphinx-section $))

(p (sphinx-section "Serve static files"))
(p "need to install bottle")
(run (format "~a~a"
             "python -c 'import bottle as b;  b.route(\"<f:path>\")(lambda f: b.static_file(f, root=\".\"));"
             "b.run(host=\"0.0.0.0\", port=8000)'")
     :dummy #t)

(ps "Count up when the string perl appears in history")
(run "cat ~/.zsh_history |perl -nle '/perl/ and $p++; END{print $p}'")

(ps "Hello world in C")
(run "echo '#include <stdio.h>\nint main(){printf(\"hello world\");} ' |clang -x c - -o a.out && ./a.out")

(ps "port forwad at one time")
(define cmd "perl -E 'system qq#sudo ssh -fN -i ~/path/to/key -L $_:192.168.56.2:$_ root\@192.168.56.2# for @ARGV'")
(run #"~cmd 80 8000 8080" :dummy #t)
(p "specify a range argument")
(run #"~cmd `seq 8000 8010`" :dummy #t)

(ps "set ~/.bashrc")
(run "cd && curl https://raw.githubusercontent.com/her0e1c1/home/master/.bashrc -O" :dummy #t)

(p (sphinx-section "Check whether a command exists or not"))
(run "[ -e \"$(which ls)\" ] && echo \"FOUND\"")
(run "[ -e \"$(which hoge)\" ] && echo \"FOUND\"")

(p (sphinx-todo "ログを正規表現でフィルターして、tail -f"))
(p (sphinx-todo "先頭行に特定の文字列を挿入.sh"))

(ps "json")
(run+ "echo '{\"foo\": \"lorem\", \"bar\": \"ipsum\"}' | python -mjson.tool")


(p "sync selected directories in the two directories")
; perl -E 'for ("css", "fonts", "js"){ system "rsync -avz --delete src/html/$_ dest/public/" }'


(ps "tree")
; pwd;find . | sort | sed '1d;s/^\.//;s/\/\([^/]*\)$/|--\1/;s/\/[^/|]*/|  /g'

;; # LINUX
;; while true ; do clear ; df -h ; sleep 5 ; done

(ps "color")
(run "perl -E 'print qq/\x1b[38;5;${_}mC$_ / for 0..255; say'")

(ps "fizz buzz")
(p "plus separetes say and (Fizz)  # 単項プラス演算子")
(run "perl -E 'say +(Fizz)[$_%3].(Buzz)[$_%5]||$_ for 1..100'")

(p "Change permissions recursively Note write in 8 digit notion")
(run "find . |perl -nlE 'chmod 0701, $_ if -d;'")

(p "permissions for apache about static files")
(run "find . |perl -nlE 'chmod 0755, $_ if -d; chmod 0644, $_ if -f'")

(p "find")
; (run "perl -E 'sub f{$a=shift; for(glob($a.\"/*\")){say if -f; f($_) if -d}}; f(shift);' ~/")
