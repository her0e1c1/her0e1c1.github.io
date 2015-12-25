(load-from-current-dirctory "include-perl.scm")

(run "perl -E '$_=shift; /(?<l>.*?line)/ and say $+{l}' 'aaalinebbb'")

perl -nlE "while(m/'(.*?)'/g){say $+;}" tmp.txt

# 2行ずつにして key: val表示
perl -nE "while(m/'(.*?)'/g){print $+; \$c % 2 == 0? print ':': say''; \$c++; }" tmp.txt

# .tplのファイルについて、.jsを含む行をファイル名と合わせて表示
# $ARGVでファイル名表示
find ./ -name "*.tpl" |xargs perl -nlE 'say "$ARGV $_"if /\.js/'

# 複数行
perl -nE '$b=$_;$a=qq/("(.*?)",[^"]*)/; say join " ", map{$k=qq/$a\{$_}/;$b=~/$k/;$2} qw/1 20/ '
