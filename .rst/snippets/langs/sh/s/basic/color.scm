(load-from-current-dirctory "include-sh.scm")

(ps "color")

(pw "check your terminal")

(p "# 複数の組み合わせをする場合は、;で区切る")

(run "echo -e \"\e[1;31;42m Yes it is awful \e[0m\"")

(p "# 以下のように、;でなくても一つ一つネストさせてよい
# \e[0mで全てキャンセルされるので、ネスト分だけ用意しなくてよい")

(run "echo -e \"\e[1m\e[31;42m Yes it is awful \e[0m\"")
(run "echo -e \"\e[1m\e[31m\e[42m Yes it is awful \e[0m\"")

(p "
以下の区切り文字で囲むことで、その範囲の文字列の色を変更できる
\033[数字m
\033[0m

数値は以下の通り
30 黒文字
31 赤文字
40 黒背景
41 赤背景
")

(pw "-e をつけないと、そのまま表示される(sh/bash)")

(run "echo -e \"\033[31mRED FOREROUND\033[0m\"")
(run "echo -e \"\033[41mRED BACKGROUND\033[0m\"")
