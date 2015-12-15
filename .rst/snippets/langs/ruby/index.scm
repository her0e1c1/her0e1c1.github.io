(define (run cmd)
  (let1 cmd+ (regexp-replace-all #/'/ cmd "\"")
        (oneliner-simple-run-print #"ruby -e '~cmd+'")))

(p (sphinx-section "exit"))
(run "exit")
(run "exit!")
(run "exec 'echo 1'; p \"NOT PRINTED\"")

(run "p ENV['USER'].split(':')")
(run "p [false, nil].all?")

;; # keyを指定
(run "def add(a: 1, b: 2) a+b end; puts add a: 3")
(run "def add(a=1, b=2) a+b end; puts add (a=3)")
(run "def add(*args) args.inject{|acc, it| acc+it} end; puts (add 1, 2, 3)")
(run "p true ? 'ok' : 'no'")

(p (sphinx-section "struct"))
;; struct構造は、特定のkeyを持つ辞書
(run "F=Struct.new('F','a','b'); f=F.new(1, 2); p f.a")
(run "F=Struct.new('F','a','b'); f=F.new(1, 2); p f.b")
