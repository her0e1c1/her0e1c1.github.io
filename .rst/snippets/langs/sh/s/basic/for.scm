(load-from-current-dirctory "include-sh.scm")

(ps "for")

(run "for i in 1 2 3; do echo $i; done")

(p "001.csv ... 010.csvまでの空ファイルを作成")
(run "for i in $(seq -f \"%03g\" 1 10); do printf \"%s.csv \" $i; done")

(p "区切り文字を$IFSとして、配列を生成し、行つきの結果を表示")
(run "cnt=0; for i in `ls`; do echo \"$cnt $i\"; cnt=$((cnt + 1)); done")

;; for i in *.txt; do echo $i |sed -e 's/\.txt/\.csv/' |xargs mv $i ;done 
