(load-from-current-dirctory "include.scm")
(define (run cmd)
  (let1 ret (oneliner-run cmd)
        (p (sphinx-block #"~cmd\n~ret" :code-block "sh"))))

(p (sphinx-warn "Don't use double quote which extend $ in sh or escape it"))
(run "perl -e \"$a=1; print $a\"")
(run "perl -e \"\\$a=1; print \\$a\"")

(p (sphinx-section "options"))

(p "With -0 option delimiter is NULL")
; (run "perl -p0 ''")

(p "With -0777 you can't use any option delimiter.")
(run "echo \"a\na\na\"|perl -p0777E 's/a/b/'")

(p "Display warning") 
(run "perl -we 'print @a'")

(p (sphinx-section "special characters"))

(p "$\"")
(p "This is a \"@array\" delimiter")
(run "perl -E '$\" = \" - \"; @a=1..5; say \"@a\"'")

(p "execute shell command. you need -i option")
(run "perl -e 'system qq#sh -ic \"ll /lib/libc.so.*\"#'")

(ps "escape quote in sh")
(run "perl -E 'say'\\''HOGE HOGE'\\'''")

(run "perl -M'File::Basename' -E 'say basename qq#/path/to/text.txt#'")
(run "perl -M'File::Spec' -E 'say File::Spec->catfile(q#/path/to#, q#text.txt#)'")

; $d="$ENV{HOME}/.trash";
; mkdir $d unless -d $d; $c=1;
; for(@ARGV){while(1){
;   unless(-e){say "no $_ exists"; last};
;   unless(-e $o){say $cmd; system $cmd; last};$c++;
; }}
; '''

(ps "hash")
(run "perl -E '%a=(a=>1); say exists($a{\"a\"})'")
(run "perl -E '%a=(a=>1, b=>2); say $a{a}'")
(p "get all hash keys")
(run "perl -E '%a=(a=>1, b=>2); say keys %a'")

(run "perl -E '%a=(a=>1); say exists($a{a})'")
(run "perl -E '%a=(a=>1); say %a ~~ /^a$/'")
(run "perl -E '%a=(a=>1, b=>2); while(($k, $v) =each %a){say \"$k = $v\"}'")

(run "perl -E 'say \"abc\".\"efg\"'")
(run "perl -E 'say 1 if \"a\" eq \"a\"'")
(run "perl -E 'say sprintf(\"%s, %s\", \"hello\", \"world\")'")
(run "perl -E 'say join \" \", 1..10'")
(run "perl -E 'say split /\s/, \"a b c\"'")
(run "perl -e 'print qq/hello world/'")
(run "perl -E 'say ord(\"a\")'")
(run "perl -E 'say substr + (join \"\", a..f), 1, -1'")

(p "perlの場合文字列を+で評価すると型を数値とする
なお、文字列の結合は.を使うので注意
また、数値でないものは0として扱われる")
(run "perl -E 'say \"1\" + \"2\"'")
(run "perl -E 'say \"a1a\" + \"2\"'")

(p "when you want to execute other commands, then use system")
(run "perl -E 'say `echo TEST`'")

(ps "exec")
(p "System and go last")
(run "perl -E 'system \"echo TEST\" ;say \"print\"'")

(p "コマンドを実行し、失敗した場合にのみ制御が戻る")
(run "perl -E 'exec \"echo 1\" ;say \"NOT PRINTED\"'")

(ps "false")
(run "perl -E 'say $a || \"\" || 0'")
(run "perl -E 'say for split \":\", $ENV{PATH}'")

(p "変数が未定義であることを確認")
(run "perl -E 'say \"undefined\" if !defined($a)'")
(p "未定義の場合に代入")
(run "perl -E '$a//=1; say $a'")

(run "perl -E 'say 1 ? \"ok\" : \"no\"'")
(run "perl -M\"File::Basename\" -E 'say basename \"/path/to/file.txt\"'")

(p "Change permissions recursively Note write in 8 digit notion")
(run "find . |perl -nlE 'chmod 0701, $_ if -d;'")

(p "permissions for apache about static files")
(run "find . |perl -nlE 'chmod 0755, $_ if -d; chmod 0644, $_ if -f'")

(run "perl -E '$_=\"/home\"; say if -d'")

(run "echo \"a,b\nc,d\" |perl -F'/,\s*/' -alnE 'say join \"/\", @F'")
(run "echo \"a\nb\n\nc\nd\"|perl -00 -pE 'say \"-\" x 20'")
(run "ls |perl -E 'say reverse <>'perl -E 'say \"sample.CsV\" =~ /.*\.csv/i'")
(run "perl -E '@a=(1, 2, 3); push @a, 4; say @a'")
(run "curl yahoo.co.jp |perl -nlE 's#(?<=href=)([\"''])/aiuie/(?=\1)#${1}{{ ''index'') }}#; say'")
(run "perl -E 'say 0b1000'")
(run "perl -M\"File::Copy qw(cp)\" -e 'cp $_, $_.\".bak\" for grep {-f} glob(\"*\")'")

(run "Create backup files in current directory")
(run "perl -E 'say 1 if 1 ~~ [1,2,3]'")

(run "perl -E 'grep{$_ eq 1} qw(1 2 3) and say 1'")
(run "perl -E 'say grep {$_ % 2 == 0} 1..5'")
; (run "perl -E 'sub f{$a=shift; for(glob($a.\"/*\")){say if -f; f($_) if -d}}; f(shift);' ~/")
(run "perl -M\"List::Util qw(reduce)\" -E 'say reduce {$a+$b} (1,2,3)'")
(run "perl -e 'print \"hello world\"'")
(run "perl -e 'print qq/hello world/'")
(run "perl -E 'say \"hello world\"'perl -E 'say qw/1 2 3/'perl -E '@a=(1,2,3); say $#a+1'")
(run "perl -E '@a=(1,2,3); say scalar @a'perl -E 'say for glob(\"*\")'perl -E 'say for map {$_ + 1} 1..3'  # mapの第二引数は配列")
(run "perl -E 'say $_ + 1 for 1..10'")
(run "perl -e 'for(<*.txt>){$a=$_; s/\.txt/\.csv/; rename $a, $_}'")
(p "ファイルシステムをまたいでmove")
(run "find ./ -print0 | perl -MFile::Copy -MFile::Basename -l0ne 'move($_, \"/path/to/\" . basename($_)'")

(run "perl -E 'say keys %{{map {$_ => 1} (1,1,1,2,2,3)}}'")
(run "perl -E 'print qq/\x1b[38;5;${_}mC$_ / for 0..255; say'")
(run "perl -E 'say rand for 1..5'")


(p "引数が@_に格納されてるので、そのどれかを取り出す感じ")
(run "perl -e 'sub {print $_[rand @_] for 1 .. 255}->(\"a\" .. \"z\", 0 .. 9, \"A\" .. \"Z\")'")
(run "perl -e 'system \"echo 1\" for 1..3'")
(run "perl -E 'say \"abc\" x 3'")

;; # 文字列の場合
;; # reverse関数に文字列として評価させたいのでscalar必要
(run "perl -E 'say scalar reverse shift' hoge")
(run "perl -E 'say for 1..3'")
(run "perl -E 'say join \" \" , map {sprintf \"%03d\", $_} 1..10'")
(run "perl -E '@a=(split \" \", \"a b c d e\")[2..4]; say @a'")
(run "perl -E '@a=(split \" \", \"a b c d e\")[-1]; say @a'")
(run "perl -E '@a=(split \" \", \"a b c d e\")[-1, 0]; say @a'")

;; mysqldump -u USER DB TABLE -t --compact --skip-extended-insert |perl -plE 's/(?<=VALUES \()(\d+)/$1+10000/e'
;; # idはnullにしておけば、mysql側でよしなに値をいれてくれる 
;; mysqldump -u USER DB TABLE -t --compact --skip-extended-insert |perl -plE 's/(?<=VALUES \()(\d+)/NULL/'perl -e 'open F, ">$FILENAME"; print F ""'
; perl -E '$s=chr 39;for$p(house, land){for$i(1..10){$n="${p}_$i"; $a=qq/insert into property_group (name, type, g_id) values ($s$n$s, $s$p$s,$i)/; say qq/mysql -u USER DB -e "$a"/}}'

(run "perl -E 'say join \" \", glob(\"{a,b,c}.{txt,csv}\")'")
(run "perl -E 'for $i (qw/a b c/){for(qw/txt csv/){`echo $i.$_`}}'")

(p "// .. // operator")
;; # 以下のコードと同じ
;; # my $process_this = 0;
;; # while (<$file>) {
;; #   $process_this = 1 if /START/;
;; #   $process_this = 0 if /END/;
;; #   process_this_line($_) if $process_this;
;; # }
(run "echo \"a\nb\nSTART\nc\nEND\ne\" |perl -nle 'print if /^START$/ .. /^END$/'")
(run "perl -E 'say length shift' 1234567890")
(run "perl -E '$_=shift; say if /([\"''])abc\1/ ' '\"abc\"'")

(run "perl -E '$_=shift; say if /([\"''])abc\g1/ ' '\"abc\"'")
(run "perl -E '$_=shift; say if /([\"''])abc\g{1}/ ' '\"abc\"'")

(run "perl -nlE 'say if /(\"([\\].|[^\\\"])*\")/' <<< '\"abc\"'")
(run "echo \"123456\tb\nc\td\" | perl -aF'\t' -nlE 'say join(\", \", map(sprintf(\"%5s\", substr($_, 0, 5)), @F))'")

(run "perl -e 'sub {print \"@_\"}->(\"a\" .. \"z\", 0 .. 9, \"A\" .. \"Z\")'")
;; perl -i -pE '461 .. 488 and s/(?<=: )(?!u)/u/' filepath
;; # {"key": " => {"key": u"

(run "ps aux | perl -anle 'print $F[1]' | head -n2")
(p "print 0 ~ 4 columns in the argument file")
; (run "perl -F: -lane  'print \"@F[0..4]\n\"' /etc/passwd")

(run "perl -le 'print unpack(\"H*\", $ARGV[0]);' 'あいうえお' ")
(run "perl -E 'say unpack(\"B*\", \"A\");'")
