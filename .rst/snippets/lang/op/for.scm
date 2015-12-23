
(sh "for i in 1 2 3; do echo $i; done")

(sh "for i in $(seq -f \"%03g\" 1 10); do printf \"%s.csv \" $i; done"
    :msg "001.csv ... 010.csvまでの空ファイルを作成")

(p "区切り文字を$IFSとして、配列を生成し、行つきの結果を表示")
(sh "cnt=0; for i in `ls`; do echo \"$cnt $i\"; cnt=$((cnt + 1)); done")

;; for i in *.txt; do echo $i |sed -e 's/\.txt/\.csv/' |xargs mv $i ;done 
