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

(p "reduce is alias")
(run "p [1,2,3].drop(1)")
(run "p [1,2,3].reverse!")
(run "p [1,2,3].reverse")
(run "p [1,1,1,2,2,3].count(1)")
(run "p ARGV.shift.reverse' hoge")
(run "p [1,2,3].size")
(run "5.times{p rand}")
(run "p [1,2,3].inject{|a, b| a+b}")
(run "p [1,2,3].inject(:+)")
(run "p [1,2,3][1]")
(run "[1,2,3].permutation{|a| p a}")
(run "p [1,1,1,2,2,3].uniq")
(run "puts [1,2,3].map{|i| i+1}")
(run "p [1,2,3].first")
(run "a=[1,2,3]; a.push(4); p a")
(run "puts Dir.glob(\"*\")")
(run "puts \"hello world\"")
(run "p \"hello world\"")
(run "\"hello world\".display")
(run "p \"abcde\"[0]")
(run "p \"abcde\"[1,3]")
(run "p \"abcde\"[/a\wc/]")
(run "3.times{puts \"hello\"}")
(run "p [1,2,3,4,5].select{|i| i.even? }")
(run "p [[1,2,3], 4, [5, [6], 7]].flatten")
(run "[1,2,3].each{|i| puts i}")
(run "puts [1,2,3].include? 1")
(run "(\"a\"..\"c\").to_a.product([\"txt\", \"csv\"]).each{|(i, j)| puts i+\".\"+j}")

; h |ruby -0777nle 'p split("\n")[-1][/  (.*)/, 1]'

;; p ARGV.shift.length' 1234567890
;; require "csv"; CSV.foreach(ARGV[0]) do |a| puts a[1] end' $FILEPATH
;; Dir.glob("*.txt").each{|i| o=i.sub("\.txt", "\.csv"); File.rename i, o}
