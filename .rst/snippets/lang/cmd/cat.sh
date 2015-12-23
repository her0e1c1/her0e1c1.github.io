##cat
# -e 改行を$で表示
# -t タブを^Iで表示
# -v 制御文字を表示
# -n 行番号を表示
# -l ファイルロック
# -s 連続する改行を１つにまとめる

# line number
# -B バイナリ $ARGV ファイル名 $.はファイルごとに初期化
cat -n $FILE1 $FILE2
find . |xargs perl -nlE 'next if -B $ARGV; say "$ARGV $. $_"; $.=0 if eof'


# Print standard input from pipe
ls | perl -E 'say <stdin>;'
ls | ruby -e 'STDIN.each{|i| puts i}'
ls | ruby -e 'STDIN.each(&:display)'
ls | python -c 'import sys; print(sys.stdin.read())'

# Print using <
perl -E 'say <stdin>;' < $FILEPATH
ruby -e 'puts ARGF.read' $FILEPATH

# Print a file content
perl -pE '' s1.txt
ruby -pe '' s1.txt


# 現在の文字のデリミタを表示
# spece/tab/break line/nullの4つが初期値
echo -n "$IFS" |cat -vte
# ^I$
#^@