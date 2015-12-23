
# -r 再帰的にファイルを読み込む
find . | xargs grep "SEARCH_WORDS"


# Get files in srmXXX/XXX that are not named in some characters
perl -E 'say "$_" for grep {$_ !~ /(Hard|Medium|Easy)/ } glob("srm*/*")'


# Get lines before and after the matcing line.
hg st |perl -0777 -nlE '$"="\n";@a=split "\n", $_; for(1..$#a){if( $a[$_] =~ /news/){say "@a[$_-3..$_+3] \n";}}'
hg st |ruby -0777 -nle 'a=split("\n"); a.size.times{|i| puts "%s\n\n" % a[i-3..i+3].join("\n") if a[i].match("news")}'


# -v マッチしないものがマッチ
find . -type d| egrep -v 'hg|\.$'