(load-from-current-dirctory "include-ruby.scm")

(p (sphinx-section "exit"))
(run+ "exit")
(run+ "exit!")
(run+ "exec 'echo 1'; p \"NOT PRINTED\"")

(run+ "p ENV['USER'].split(':')")
(run+ "p [false, nil].all?")

;; # keyを指定
(run+ "def add(a: 1, b: 2) a+b end; puts add a: 3")
(run+ "def add(a=1, b=2) a+b end; puts add (a=3)")
(run+ "def add(*args) args.inject{|acc, it| acc+it} end; puts (add 1, 2, 3)")
(run+ "p true ? 'ok' : 'no'")

(p (sphinx-section "struct"))
;; struct構造は、特定のkeyを持つ辞書
(run+ "F=Struct.new('F','a','b'); f=F.new(1, 2); p f.a")
(run+ "F=Struct.new('F','a','b'); f=F.new(1, 2); p f.b")

(p "reduce is alias")
(run+ "p [1,2,3].drop(1)")
(run+ "p [1,2,3].reverse!")
(run+ "p [1,2,3].reverse")
(run+ "p [1,1,1,2,2,3].count(1)")
(run+ "p ARGV.shift.reverse' hoge")
(run+ "p [1,2,3].size")
(run+ "5.times{p rand}")
(run+ "p [1,2,3].inject{|a, b| a+b}")
(run+ "p [1,2,3].inject(:+)")
(run+ "p [1,2,3][1]")
(run+ "[1,2,3].permutation{|a| p a}")
(run+ "p [1,1,1,2,2,3].uniq")
(run+ "puts [1,2,3].map{|i| i+1}")
(run+ "p [1,2,3].first")
(run+ "a=[1,2,3]; a.push(4); p a")
(run+ "puts Dir.glob(\"*\")")
(run+ "puts \"hello world\"")
(run+ "p \"hello world\"")
(run+ "\"hello world\".display")
(run+ "p \"abcde\"[0]")
(run+ "p \"abcde\"[1,3]")
(run+ "p \"abcde\"[/a\wc/]")
(run+ "3.times{puts \"hello\"}")
(run+ "p [1,2,3,4,5].select{|i| i.even? }")
(run+ "p [[1,2,3], 4, [5, [6], 7]].flatten")
(run+ "[1,2,3].each{|i| puts i}")
(run+ "puts [1,2,3].include? 1")
(run+ "(\"a\"..\"c\").to_a.product([\"txt\", \"csv\"]).each{|(i, j)| puts i+\".\"+j}")

(run "ruby -e 'p ARGV.shift.length' 1234567890")
; h |ruby -0777nle 'p split("\n")[-1][/  (.*)/, 1]'
;; require "csv"; CSV.foreach(ARGV[0]) do |a| puts a[1] end' $FILEPATH
;; Dir.glob("*.txt").each{|i| o=i.sub("\.txt", "\.csv"); File.rename i, o}

; ruby -e 'puts ({:a => 1}.key? :a)'
ruby -e 'print({:a=>1, :b=>2}[:a])'

# シンボルと文字列を区別する
ruby -e 'puts ({:a => 1}.key? "a")'  # false

# 破壊的
ruby -e 'a="abc"; a << "efg"; puts a'
ruby -e 'puts "abc".concat("efg")'  # << と同じ

# 基本的に文字列の宣言は""で括る
ruby -e '%q(hello wolrd).display'

# %Q()と%()は"で括るのと同じで変数展開可能
ruby -e "a='hello'; %(#{a} world).display"
# 括るのは() !! {} [] ##
ruby -e "%Q#hello world#.display"

ruby -e 'puts File.basename("/path/to/file.txt")'  # file.txt

# ファイルパスのデリミタ
ruby -e 'puts File::Separator'

ruby -r tmpdir -e 'p Dir.mktmpdir do |d| puts end'  # "/tmp/d20150516-10476-pixcro"
ruby -r tmpdir -e 'p Dir.tmpdir'  # /tmp
