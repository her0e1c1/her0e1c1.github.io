
;# 基本的に文字列の宣言は""で括る
(run "ruby -e '%q(hello wolrd).display'")

;# 括るのは() !! {} [] ##
(run "ruby -e '%Q#hello world#.display'")
