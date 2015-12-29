
(sh "for i in 1 2 3; do echo $i; done")

(sh "for i in $(seq -f \"%03g\" 1 10); do printf \"%s.csv \" $i; done"
    :msg "001.csv ... 010.csvまでの空ファイルを作成")

(p "区切り文字を$IFSとして、配列を生成し、行つきの結果を表示")
(sh "cnt=0; for i in `ls`; do echo \"$cnt $i\"; cnt=$((cnt + 1)); done")

;; for i in *.txt; do echo $i |sed -e 's/\.txt/\.csv/' |xargs mv $i ;done 


(pw "During iteration, you should not modify the list")

;; l = [1, 2, 3]
;; for i in l:
;;     l = [4,5,6]
;;     print(i)

(node "var l = [10,20,30]; for (var j in l) console.log(l[j]);")
(node "for (var n in [10,20,30]) console.log(n);"
      :warn "With for-in just return 1, 2, 3 ...")


; リストの要素に順にアクセス
(emacs (--each '(1 2 3) (print it)))
(emacs (dolist (it '(1 2 3)) (print it)))
