
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


#tag: neta, fizzbuzz
perl -E 'say +(Fizz)[$_%3].(Buzz)[$_%5]||$_ for 1..100'
# plus separetes say and (Fizz)  # 単項プラス演算子


# csvの特定列を抽出
perl -nE 'say $2if /("(.*?)",[^"]*){20}/' < FILEPATH

# 複数行
perl -nE '$b=$_;$a=qq/("(.*?)",[^"]*)/; say join " ", map{$k=qq/$a\{$_}/;$b=~/$k/;$2} qw/1 20/ '


# /path/to => /path/to/
perl -E '$_=shift; m#<a.*?href=(["''])(.*?)\1.*?>#; $a=$2; substr($_, $-[2], $+[2] - $-[2]) = $a."/"; say' "<a href='/path/to'>"
# $-[]マッチ開始位置かな, $+[]マッチ終了位置


#tag: warn
perl -pE 's/\r\n/\n/' << EOF
aaa
bbb
ccc
EOF
# Warn: Don't use -l option, which chomps "\n" , "\r\n" or "\r"

# If you run below and cat -v, you can see ^M
# perl -pE 's/\n/\n/'
# sh THIS_FILE|cat -v


# (?:...)は、グループをつくるが、キャプチャしない
perl -E '$_=@ARGV[0]; /(a)(?:b)(c)/ and say "1 => $1, 2 => $2, 3 => $3"' abc


# Using brace means escaping dot
perl -E "say 'aab' =~ m/a[.]b/"  # 0
perl -E "say 'a.b' =~ m/a[.]b/"  # 1
perl -E "say 'a.b' =~ m/a\.b/"  # 1# 括弧でグループ化
# 順番は左から
perl -E '"1234" =~ /((((1)2)3)4)/; say "$1 $2 $3 $4"'  # 1234 123 12 1
pythonn -c 'import re; print(re.match(r"((((1)2)3)4)", "1234").groups())'  # ('1234', '123', '12', '1')# 先読み
# 文字列を特定するのと、特定の文字列を置換することの分離

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

# (?P<NAME>REGEX)でグループに名前をつける
# (?P=NAME)で参照(内部参照)
perl -E '$_=shift; say if /(?P<name>a)b\g{name}/ ' aba
perl -E '$_=shift; say if /(?P<name>a)b(?P=name)/ ' aba
python -c 'import re; print(re.match(r"(?P<name>a)b(?P=name)", "aba").group())'


# 外部参照
perl -E '$_=shift; say "$+{name}" if /(?P<name>a)/ ' a# (?:REGEX)
# Don't group
perl -E 'shift =~ /(a)(?:b)(c)/; say $1.$2' abc  # ac
python -c 'import re; print(re.match(r"(a)(?:b)(c)", "abc").groups())'  # ('a', 'c')# 先読み
# 後に続く文字列が条件に合致した場合に、その手前にマッチさせる


## Error
# Variable length lookbehind not implemented in regex
# 後読みの中で正規表現は使えない
perl -E '"test" =~ m#(?<=.*?)e#'
perl -E '"abcde" =~ /(?<=.*?c).*/; say $&'

# You can subsutitute lookbind with \K option
perl -E '"abcde" =~ /(.*?c)\K.*/; say $&'


# Match a string not starting with abc
echo abcdefg| perl -nlE '/^(?!abc).*/ and say'
echo bcdefg| perl -nlE '/^(?!abc).*/ and say'  # bcdefg
echo abcdefg|egrep -v '^abc'# $'
# 最後にマッチした部分に続く文字列
perl -E '"pre 1234 post"=~/\d+/; say $'''  #\ post

# pythonには存在しないのでsplitで代用
python -c 'import re; print(re.split(r"(\d+)", "pre 1234 post", 1))'  # ['pre ', '1234', ' post']# マッチした文字列で分割していく(マッチ文字も含む)
pythonn -c 'import re; print(re.split(r"(\d+)", "a 1 b 2 c 4"))'  # ['a ', '1', ' b ', '2', ' c ', '4', '']
perl -E 'say split /(\d+)/, "a 1 b 2 c 4";'


# マッチした文字列で分割していく(マッチ文字を含まない)
perl -E 'say split /\d+/, "a 1 b 2 c 4"'
ruby -pe 'sub(/\r\n/, "\n")' s1.txt# translate

# d option
# delete it if you cant map a char
perl -E '$_="abc"; tr/ac/A/d; say'  # Ab

# s option
# map continuous chars as one char to another char
perl -E '$_="aaabc"; tr/ac/A/s; say'  # AbA

# big <=> small
perl -E 'tr/a-zA-Z/A-Za-z/'


# gは、全てマッチ
# With g option it match more than once

# マッチ位置はマッチするごとに動くので、loopできる
# *は0文字とマッチするので空文字が含まれる
perl -E '$_="abc"; print "$_," for (/.*?/g)'  # ,a,,b,,c,,
perl -E '$_="abc"; print "$_," for /.+?/g'  # a,b,c,

# while
perl -E '$_="abc"; while(/.(?=(.*))/g){print $&.$1.","}'  # abc,bc,c,# With s option . matches also \n character
perl -E 'say "\n" =~ /./s'  # 1
python -c 'import re; print(re.match(r".", "\n", re.DOTALL))'

# . matches also dot character
perl -E 'say "." =~ /./'  # 1


(p"
. doesn't match \n character
Ignore white words( \n\r\t)
")
(run "perl -E 'say \"\n\" =~ /./'")

(run "perl -E '$_=\"abc\"; /a   b c/x; say $&'")
