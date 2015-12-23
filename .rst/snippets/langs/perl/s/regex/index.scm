(load-from-current-dirctory "include-perl.scm")

(run "perl -E '$_=shift; /(?<l>.*?line)/ and say $+{l}' 'aaalinebbb'")
(run "perl -E '@r=\"abcdefghijk\"=~/.{1,4}/g; say join \"-\", @r'")

(p "file.min.js => file.js")
(run "ls -1 dir |perl -nlE perl -nlE '/\.min/;say qq/$`$''/'")


;; # Remove a part of a file name string # To escape ' is to double it
;; # Append a string after .js and before ' or "
find . -type f -name "*.js" |perl -nlE 's/(?<=\.js)(?=["''])/{{ query() }}/ and say'
;; # (?=)で先読みして、"or'にマッチさせる。
;; # また同時に(?<=)で後読みしてjsで始まる箇所とマッチさせる
;; # 実際のマッチはないが、その空文字に対して文字列を置き換える


# 'STRING' のようなクオートの文字列を抜き出す
perl -nlE "while(m/'(.*?)'/g){say $+;}" tmp.txt
# gをつけることで$_の開始位置が巡る

# warn: quote
# 2行ずつにして key: val表示
perl -nE "while(m/'(.*?)'/g){print $+; \$c % 2 == 0? print ':': say''; \$c++; }" tmp.txt


#tag: pratical, SV, grep, oneliner
# .tplのファイルについて、.jsを含む行をファイル名と合わせて表示
find ./ -name "*.tpl" |xargs perl -nlE 'say "$ARGV $_"if /\.js/'
# $ARGVでファイル名表示

perl -E 'say $& if shift =~ /(<)\w+@\w+(?:\.\w+)+(?(1)>)/' '<abc@aaa.com>'
# (?(NUMBER)REGEX)  If the group NUMBER is matched, REGEX is active


perl -E '$_=shift; say if m#^(?P<year>\d{4})(?P<d1>[-/])(?P<month>\d{1,2})\g{d1}(?P<day>\d{1,2})\s+(?P<hour>\d{1,2})(?P<d2>:)(?P<minute>\d{1,2})\g{d2}(?P<second>\d{1,2})$#' "2015-05-22 13:59:04"

#tag: oneliner
perl -nlE "tr/A-Z/a-z/ FILE


#tag: wget, pratical, SV
# Show png or gif img tags.
wget www.yahoo.co.jp -O -|perl -nlE 'say $& if /<img.*?(gif|png).*?>/'
# $&はマッチした文字列全体
# "-O -" means stdout instead of a file

# csvの特定列を抽出
perl -nE 'say $2if /("(.*?)",[^"]*){20}/' < FILEPATH

# 複数行
perl -nE '$b=$_;$a=qq/("(.*?)",[^"]*)/; say join " ", map{$k=qq/$a\{$_}/;$b=~/$k/;$2} qw/1 20/ '


# If you run below and cat -v, you can see ^M
# perl -pE 's/\n/\n/'
# sh THIS_FILE|cat -v

# Using brace means escaping dot
perl -E "say 'aab' =~ m/a[.]b/"  # 0
perl -E "say 'a.b' =~ m/a[.]b/"  # 1
perl -E "say 'a.b' =~ m/a\.b/"  # 1# 括弧でグループ化


# 続く文字列にマッチした場合に、マッチ
perl -E '$_=shift; say $& if /abc(?=def)/' abcdef  # abc
perl -E '$_=shift; say $& if /abc(?=def)/' abcdf  # NOTHING!
python -c 'import re; print(re.match(r"abc(?=def)", "abcdef").group())'


# 否定
# 続く文字列にマッチしない場合に、マッチ
perl -E '$_=shift; say $& if /abc(?!def)/' abcdf  # abc
perl -E '$_=shift; say if /abc(?!def)/' abcdef  # NOTHING!
python -c 'import re; print(re.match(r"abc(?!def)", "abcdf").group())'# あと読み

# 置換などで、マッチさせずに置換対象を狭めるのに使う
# src="../ => src="/
perl -plE 's#(?<=src=[''"])../#/#' file

# Match a string not starting with abc
echo abcdefg| perl -nlE '/^(?!abc).*/ and say'
echo bcdefg| perl -nlE '/^(?!abc).*/ and say'  # bcdefg
echo abcdefg|egrep -v '^abc'# $'

# pythonには存在しないのでsplitで代用
python -c 'import re; print(re.split(r"(\d+)", "pre 1234 post", 1))'  # ['pre ', '1234', ' post']# マッチした文字列で分割していく(マッチ文字も含む)
pythonn -c 'import re; print(re.split(r"(\d+)", "a 1 b 2 c 4"))'  # ['a ', '1', ' b ', '2', ' c ', '4', '']

perl -E 'say split /(\d+)/, "a 1 b 2 c 4";'


# マッチした文字列で分割していく(マッチ文字を含まない)
perl -E 'say split /\d+/, "a 1 b 2 c 4"'
ruby -pe 'sub(/\r\n/, "\n")' s1.txt# translate

(run "perl -E '$_=\"abc\"; /a   b c/x; say $&'")
