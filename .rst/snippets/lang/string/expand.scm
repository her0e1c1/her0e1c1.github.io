
;# %Q()と%()は"で括るのと同じで変数展開可能
(run "ruby -e \"a='hello'; %(#{a} world).display\"")

(gosh (let1 name 123 #"a test ~|name|.") :msg "|NAME|とすることで、文字をすぐ後ろへつなげる")
(gosh (let1 name 123 '#"a test ~|name|.") :msg "reader macroの確認")
(gosh #"~(+ 1 2 3)")
