
;# %Q()と%()は"で括るのと同じで変数展開可能
(run "ruby -e \"a='hello'; %(#{a} world).display\"")
